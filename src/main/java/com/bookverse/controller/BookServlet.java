package com.bookverse.controller;

import com.bookverse.model.Book;
import com.bookverse.service.BookService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;

@WebServlet("/bookServlet")
@MultipartConfig(
        maxFileSize = 5 * 1024 * 1024,      // 5 MB
        maxRequestSize = 10 * 1024 * 1024,   // 10 MB
        fileSizeThreshold = 1024 * 1024      // 1 MB
)
public class BookServlet extends HttpServlet {

    private BookService bookService = new BookService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String action = req.getParameter("action");

        if ("add".equals(action)) {
            addBook(req, resp);
        } else if ("edit".equals(action)) {
            updateBook(req, resp);
        } else if ("delete".equals(action)) {
            deleteBook(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
        }
    }

    private void addBook(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        // Get form parameters
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String genre = req.getParameter("genre");
        String isbn = req.getParameter("isbn");
        String copiesStr = req.getParameter("copies");
        String description = req.getParameter("description");

        // Validate required fields
        if (title == null || title.trim().isEmpty() ||
                author == null || author.trim().isEmpty()) {

            req.getSession().setAttribute("error", "Title and Author are required");
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
            return;
        }

        int copies = 1;
        try {
            copies = Integer.parseInt(copiesStr);
        } catch (NumberFormatException e) {
            copies = 1;
        }

        // Handle file upload
        String coverImagePath = saveUploadedFile(req);

        // Create book object
        Book book = new Book(title, author, genre, isbn, copies, description, coverImagePath);

        // Save to database
        String result = bookService.saveBook(book, coverImagePath);

        if ("success".equals(result)) {
            req.getSession().setAttribute("message", "Book added successfully!");
        } else {
            req.getSession().setAttribute("error", result);
        }

        resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
    }

    private String saveUploadedFile(HttpServletRequest req) throws ServletException, IOException {
        Part filePart = req.getPart("coverImage");

        if (filePart == null || filePart.getSize() == 0) {
            return "uploads/books/default-book-cover.jpg";
        }

        // Get the file name
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Generate unique filename to prevent conflicts
        String uniqueFileName = System.currentTimeMillis() + "_" + fileName;

        // Get the deployment directory path
        String deploymentPath = getServletContext().getRealPath("/");

        // Create uploads/books directory relative to deployment
        String uploadDirPath = deploymentPath + "uploads" + File.separator + "books";
        File uploadDir = new File(uploadDirPath);

        // Create directory if it doesn't exist
        if (!uploadDir.exists()) {
            boolean created = uploadDir.mkdirs();
            if (!created) {
                System.err.println("Failed to create upload directory: " + uploadDirPath);
                return "uploads/books/default-book-cover.jpg";
            }
        }

        // Save the file
        String filePath = uploadDirPath + File.separator + uniqueFileName;
        filePart.write(filePath);

        // Return the path relative to web root for database storage
        return "uploads/books/" + uniqueFileName;
    }

    private void updateBook(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String bookIdStr = req.getParameter("bookId");
        if (bookIdStr == null || bookIdStr.trim().isEmpty()) {
            req.getSession().setAttribute("error", "Book ID is required");
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
            return;
        }

        int bookId = Integer.parseInt(bookIdStr);

        // Get existing book to preserve cover image if not updated
        Book existingBook = bookService.getBookById(bookId);
        if (existingBook == null) {
            req.getSession().setAttribute("error", "Book not found");
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
            return;
        }

        // Get form parameters
        String title = req.getParameter("title");
        String author = req.getParameter("author");
        String genre = req.getParameter("genre");
        String isbn = req.getParameter("isbn");
        String copiesStr = req.getParameter("copies");
        String description = req.getParameter("description");

        // Validate
        if (title == null || title.trim().isEmpty()) {
            req.getSession().setAttribute("error", "Title is required");
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
            return;
        }

        int copies = 1;
        try {
            copies = Integer.parseInt(copiesStr);
        } catch (NumberFormatException e) {
            copies = 1;
        }

        // Handle image upload - use existing if no new image
        String coverImagePath = existingBook.getImage();
        Part filePart = req.getPart("coverImage");
        if (filePart != null && filePart.getSize() > 0) {
            coverImagePath = saveUploadedFile(req);
        }

        // Update book object
        existingBook.setTitle(title);
        existingBook.setAuthor(author);
        existingBook.setGenre(genre);
        existingBook.setIsbn(isbn);
        existingBook.setCopies(copies);
        existingBook.setDescription(description);
        existingBook.setImage(coverImagePath);

        boolean result = bookService.updateBook(existingBook);

        if (result) {
            req.getSession().setAttribute("message", "Book updated successfully!");
        } else {
            req.getSession().setAttribute("error", "Failed to update book");
        }

        resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
    }

    private void deleteBook(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String bookIdStr = req.getParameter("bookId");

        if (bookIdStr == null || bookIdStr.trim().isEmpty()) {
            req.getSession().setAttribute("error", "Book ID is required");
            resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
            return;
        }

        int bookId = Integer.parseInt(bookIdStr);

        // Get the book to delete the cover image
        Book book = bookService.getBookById(bookId);

        boolean result = bookService.deleteBook(bookId);

        if (result) {
            // Delete the cover image file if it exists and is not default
            if (book != null && book.getImage() != null &&
                    !book.getImage().equals("uploads/books/default-book-cover.jpg")) {

                String deploymentPath = getServletContext().getRealPath("/");
                String filePath = deploymentPath + book.getImage();
                File imageFile = new File(filePath);
                if (imageFile.exists()) {
                    boolean deleted = imageFile.delete();
                    if (!deleted) {
                        System.err.println("Failed to delete image file: " + filePath);
                    }
                }
            }

            req.getSession().setAttribute("message", "Book deleted successfully!");
        } else {
            req.getSession().setAttribute("error", "Failed to delete book");
        }

        resp.sendRedirect(req.getContextPath() + "/admin/manage-books.html");
    }
}
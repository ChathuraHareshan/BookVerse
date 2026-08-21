package com.bookverse.service;

import com.bookverse.model.Book;
import com.bookverse.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class BookService {

    // Save book with image path
    public String saveBook(Book book, String coverImagePath) {
        try {
            Connection con = DBUtil.getInstance();

            String sql = "INSERT INTO books (title, author, genre, isbn, copies, description, cover_image, status) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getGenre());
            ps.setString(4, book.getIsbn());
            ps.setInt(5, book.getCopies());
            ps.setString(6, book.getDescription());
            ps.setString(7, coverImagePath);
            ps.setString(8, book.getStatus());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                return "success";
            } else {
                return "Failed to save book";
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return "Database error occurred: " + e.getMessage();
        }
    }

    // Get all books
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        try {
            Connection con = DBUtil.getInstance();
            String sql = "SELECT * FROM books ORDER BY book_id DESC";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenre(rs.getString("genre"));
                book.setIsbn(rs.getString("isbn"));
                book.setCopies(rs.getInt("copies"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("cover_image"));
                book.setStatus(rs.getString("status"));
                books.add(book);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    // Get book by ID
    public Book getBookById(int bookId) {
        try {
            Connection con = DBUtil.getInstance();
            String sql = "SELECT * FROM books WHERE book_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                Book book = new Book();
                book.setId(rs.getInt("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenre(rs.getString("genre"));
                book.setIsbn(rs.getString("isbn"));
                book.setCopies(rs.getInt("copies"));
                book.setDescription(rs.getString("description"));
                book.setImage(rs.getString("cover_image"));
                book.setStatus(rs.getString("status"));
                return book;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Update book
    public boolean updateBook(Book book) {
        try {
            Connection con = DBUtil.getInstance();
            String sql = "UPDATE books SET title=?, author=?, genre=?, isbn=?, " +
                    "copies=?, description=?, status=? WHERE book_id=?";

            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getGenre());
            ps.setString(4, book.getIsbn());
            ps.setInt(5, book.getCopies());
            ps.setString(6, book.getDescription());
            ps.setString(7, book.getStatus());
            ps.setInt(8, book.getId());

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete book
    public boolean deleteBook(int bookId) {
        try {
            Connection con = DBUtil.getInstance();
            String sql = "DELETE FROM books WHERE book_id = ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, bookId);

            int rows = ps.executeUpdate();
            return rows > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
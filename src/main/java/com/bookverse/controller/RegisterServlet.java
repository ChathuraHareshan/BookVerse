package com.bookverse.controller;

import com.bookverse.model.Member;
import com.bookverse.service.MemberService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/registerServlet")
public class RegisterServlet  extends HttpServlet {

    private MemberService memberService = new MemberService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Member member = new Member();


        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String mobile = req.getParameter("mobile");
        String password = req.getParameter("password");

        if(firstName == null || firstName.trim().isEmpty()){

            req.getSession().setAttribute("error","First name is required");
            resp.sendRedirect("signup.jsp");
            return;
        }


        if(lastName == null || lastName.trim().isEmpty()){

            req.getSession().setAttribute("error","Last name is required");
            resp.sendRedirect("signup.jsp");
            return;
        }


        if(email == null || email.trim().isEmpty()){

            req.getSession().setAttribute("error","Email address is required");
            resp.sendRedirect("signup.jsp");
            return;
        }

        if(mobile == null || mobile.trim().isEmpty()){

            req.getSession().setAttribute("error","Mobile number is required");
            resp.sendRedirect("signup.jsp");
            return;
        }


        if(password == null || password.trim().isEmpty()){

            req.getSession().setAttribute("error","Password is required");
            resp.sendRedirect("signup.jsp");
            return;
        }


        member.setFirstName(firstName);
        member.setLastName(lastName);
        member.setEmail(email);
        member.setMobile(mobile);
        member.setPassword(password);





        String result = memberService.register(member);

        if (result.equals("success")) {

            req.getSession().setAttribute(
                    "success",
                    "Account created successfully! Please login."
            );
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }else{
            req.getSession().setAttribute("error", result);
            resp.sendRedirect(req.getContextPath() + "/signup.jsp");
        }


    }
}

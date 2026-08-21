package com.bookverse.controller;

import com.bookverse.model.Member;
import com.bookverse.service.MemberService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/loginServlet")
public class LoginServlet extends HttpServlet {

    private MemberService memberService = new MemberService();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        Member member = new Member();

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        if(email == null || email.trim().isEmpty()){

            req.getSession().setAttribute("error","Email is required");
            resp.sendRedirect("index.jsp");
            return;
        }

        if(password == null || password.trim().isEmpty()){
            req.getSession().setAttribute("error","Password is required");
            resp.sendRedirect("index.jsp");
            return;
        }

        member.setEmail(email);
        member.setPassword(password);

        Member user = memberService.login(member);

        if(user != null){

            req.getSession().setAttribute("user",user);

            if(user.getRole_id() == 1){
                resp.sendRedirect(req.getContextPath() + "/member-dashboard.jsp");
            }else if(user.getRole_id() == 2){
                resp.sendRedirect(req.getContextPath() + "/admin-dashboard.jsp");
            }


        }else{
            req.getSession().setAttribute("error","Invalid email or password");
            resp.sendRedirect(req.getContextPath() + "/index.jsp");
        }


    }
}

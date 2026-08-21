package com.bookverse.middleware;


import com.bookverse.model.Member;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter("/admin-dashboard.jsp")
public class AdminFilter implements Filter {


    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException{


        HttpServletRequest request=(HttpServletRequest)req;
        HttpServletResponse response=(HttpServletResponse)res;


        HttpSession session=request.getSession(false);


        if(session==null || session.getAttribute("user")==null){

            response.sendRedirect("index.jsp");
            return;

        }


        Member user=(Member)session.getAttribute("user");


        if(user.getRole_id()!=2){

            response.sendRedirect("member-dashboard.jsp");
            return;

        }


        chain.doFilter(req,res);


    }

}

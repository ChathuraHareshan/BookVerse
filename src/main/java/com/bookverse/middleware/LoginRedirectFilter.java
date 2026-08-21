package com.bookverse.middleware;

import com.bookverse.model.Member;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebFilter("/index.jsp")
public class LoginRedirectFilter implements Filter {


    @Override
    public void doFilter(ServletRequest req, ServletResponse res, FilterChain chain)
            throws IOException, ServletException {


        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;


        HttpSession session = request.getSession(false);


        if(session != null){

            Member user = (Member) session.getAttribute("user");


            if(user != null){


                if(user.getRole_id() == 1){

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/member-dashboard.jsp"
                    );

                    return;

                }


                if(user.getRole_id() == 2){

                    response.sendRedirect(
                            request.getContextPath()
                                    + "/admin-dashboard.jsp"
                    );

                    return;

                }

            }

        }


        chain.doFilter(req,res);

    }
}
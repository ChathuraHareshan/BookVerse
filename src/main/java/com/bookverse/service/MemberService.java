package com.bookverse.service;

import com.bookverse.model.Member;
import com.bookverse.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberService {

    public String register(Member member) {

        try{

            Connection con = DBUtil.getInstance();

            String checkEmail = "SELECT `email` FROM `users` WHERE email=? ";

            PreparedStatement check = con.prepareStatement(checkEmail);
            check.setString(1, member.getEmail());

            ResultSet rs = check.executeQuery();

            if(rs.next()){
                return "Email already in use";
            }

            String sql = "INSERT INTO `users` (`first_name`,`last_name`,`email`,`phone`,`password`,`role_id`,`status`) " +
                    "VALUES (?,?,?,?,?,1,1) ";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, member.getFirstName());
            ps.setString(2, member.getLastName());
            ps.setString(3, member.getEmail());
            ps.setString(4, member.getMobile());
            ps.setString(5, member.getPassword());

            int rows = ps.executeUpdate();

            if(rows > 0){
                return "success";
            }else {
                return "Registration Failed.";
            }

        }catch(SQLException e){
            e.printStackTrace();
            return "Datanase error occurred.";
        }

    }

    public Member login(Member member) {

        try {

            Connection con = DBUtil.getInstance();

            String checkUser = "SELECT * FROM `users` WHERE `email`=? AND `password`=?";

            PreparedStatement check = con.prepareStatement(checkUser);
            check.setString(1, member.getEmail());
            check.setString(2, member.getPassword());

            ResultSet rs = check.executeQuery();

            if(rs.next()){

                Member user = new Member();

                user.setFirstName(rs.getString("first_name"));
                user.setLastName(rs.getString("last_name"));
                user.setEmail(rs.getString("email"));
                user.setMobile(rs.getString("phone"));
                user.setRole_id(rs.getInt("role_id"));
                user.setStatus(rs.getString("status"));

                return user;

            }else{
                return null;
            }

        }catch (SQLException e){
            e.printStackTrace();
            return null;

        }

    }

}

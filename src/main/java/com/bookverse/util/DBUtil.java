package com.bookverse.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class DBUtil {

    private static final String DATABASE_NAME = "bookverse_db";
    private static final String USERNAME = "root";
    private static final String PASSWORD = "ChathuHare@1232006";
    private static Connection connection;

    private static void createConnection(){
        if(connection == null){
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/"+ DATABASE_NAME + "?useSSL=false&allowPublicKeyRetrieval=true",  USERNAME , PASSWORD);
            } catch (ClassNotFoundException | SQLException e) {
                throw new ExceptionInInitializerError("Database connection established failed!");
            }
        }
    }

    public static Connection getInstance() throws SQLException {
        createConnection();
        return connection;
    }

    public static ResultSet execute(String query) throws SQLException{
        Statement statement = getInstance().createStatement();
        if(query.toUpperCase().startsWith("SELECT")){
            return statement.executeQuery(query);
        }else{
            statement.executeUpdate(query);
            return null;
        }
    }






}

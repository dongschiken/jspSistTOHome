package com.util;

import java.sql.Connection;


import java.sql.DriverManager;
import java.sql.SQLException;

import lombok.Data;

// 싱글톤( Singleton )
@Data
public class DBConn {
   
   private static Connection conn = null;
   
   private DBConn() {}
   
   public static Connection getConnection() {
      
      if (conn == null) {
         String className = "oracle.jdbc.driver.OracleDriver";
         String url = "jdbc:oracle:thin:@dongs:1521:xe";
         String user = "scott";
         String password = "tiger";
         
         try {
            Class.forName(className);
            conn = DriverManager.getConnection(url, user, password);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }// if
      
      return conn;
   }
   
   //오버로딩 == 중복함수
   public static Connection getConnection(String url, String user, String password) {
      
      if (conn == null) {
         String className = "oracle.jdbc.driver.OracleDriver";
         
         try {
            Class.forName(className);
            conn = DriverManager.getConnection(url, user, password);
         } catch (ClassNotFoundException e) {
            e.printStackTrace();
         } catch (SQLException e) {
            e.printStackTrace();
         }
      }// if
      
      return conn;
   }
   
   public static void close() {
      try {
         if (conn != null && !conn.isClosed()) {
            conn.close();
         }// if
      } catch (SQLException e) {
         e.printStackTrace();
      }
      conn = null;
   } //close()
}// main


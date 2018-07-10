package com.news;
import java.sql.*;
public class MyDatabean {
  private Connection conn = null;
  private Statement stmt=null;
  ResultSet rs = null;
  String DBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
  String Connstr="jdbc:odbc:db_news";
  String username="";
  String password="";
  //�����������򣬽�������
  public Connection OpenConn() throws Exception {
  try {
      Class.forName(DBDriver);
      conn = DriverManager.getConnection(Connstr,username,password);
  }
  catch (Exception ex) {
      System.err.println("aq.executeQuery: " + ex.getMessage());
  }
  return conn;
  }
//ִ�в�ѯ���SQL��䣬�з��ؼ�
  public ResultSet executeQuery(String sql) {
     rs = null;
     try {
     stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
     rs = stmt.executeQuery(sql);
     }
     catch(SQLException ex) {
      System.err.println("aq.executeQuery: " + ex.getMessage());
     }
     return rs;
   }
//�رն���
   public void closeStmt(){
     try{
       stmt.close();
       conn.close();
      }
     catch(SQLException ex) {
       System.err.println("aq.executeQuery: " + ex.getMessage());
      }
   }
 }

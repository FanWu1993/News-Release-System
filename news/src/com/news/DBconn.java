package com.news;

import java.sql.*;
public class DBconn{
  String DBDriver="sun.jdbc.odbc.JdbcOdbcDriver";
  String Connstr="jdbc:odbc:db_news";
  Connection con = null;
  ResultSet rs = null;
  String username="sa";
  String password="123456";
  public DBconn(){
     try{
         Class.forName(DBDriver);
     }
     catch(ClassNotFoundException e) {
           System.err.println("DBconn: classnotfoundexception ");
     }
   }
//���ݲ�ѯ�ķ����������ؿɹ����Ľ����
    public ResultSet Querysimple(String s){
        rs = null;
        Statement sql;
        try{
            con = DriverManager.getConnection(Connstr,username,password);
            //con = DriverManager.getConnection(Connstr);
            sql = con.createStatement();
            rs = sql.executeQuery(s);
        }
        catch(SQLException sqlexception){
            System.err.println("executeQuery: " + sqlexception.getMessage());
        }
        return rs;
    }
   //���ݲ�ѯ�ķ������ɷ��ؿɹ����Ľ����
    public ResultSet executeQuery(String s){
        rs = null;
        Statement sql;
        try{
            //con = DriverManager.getConnection(Connstr,username,password);
            con = DriverManager.getConnection(Connstr);
            sql = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE,ResultSet.CONCUR_READ_ONLY);
            rs = sql.executeQuery(s);
        }
        catch(SQLException sqlexception){
            System.err.println("executeQuery: " + sqlexception.getMessage());
        }
        return rs;
    }
    //�����޸ĵķ���
    public int executeUpdate(String s){
        int i = 0;
        Statement sql;
        try{
            //con = DriverManager.getConnection(Connstr,username,password);
            con = DriverManager.getConnection(Connstr);
            sql = con.createStatement();
            i = sql.executeUpdate(s);
        }
        catch(SQLException sqlexception){
            System.err.println("executeUpdate: " + sqlexception.getMessage());
        }
        return i;
    }
    public void close(){
        try{
            if(rs != null)
            rs.close();
            if(con != null)
               con.close();
        }
        catch(SQLException sqlexception){
            System.err.println("close: " + sqlexception.getMessage());
        }
     }
  }

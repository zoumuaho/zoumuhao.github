package com.test;

import java.sql.*;

/**
 * Created by HP on 2017/8/1.
 */
public class TestJDBC {
    public static void main (String [] args) throws SQLException{

        Connection conn = null;
        Statement stat = null;
        ResultSet rs =null;
        String url = "jdbc:oracle:thin:@10.30.64.97:1521:zssale";
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            conn = DriverManager.getConnection(url, "salefee", "salefee");
            stat = conn.createStatement();
            rs = stat.executeQuery("select  ename from t_emp");
            while (rs.next()) {
                System.out.println(rs.getString("ename"));
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            if(rs!=null){
                rs.close();
                rs = null;
            }
            if (stat != null) {
                stat.close();
                stat = null;
            }
            if (conn != null) {
                conn.close();
                conn = null;
            }
        }
    }
}

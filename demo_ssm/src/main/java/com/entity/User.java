package com.entity;

/**
 * Created by HP on 2017/8/3.
 */
public class User {
    private int userid;

    private String userName;

    private String pwd;

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPwd() {
        return pwd;
    }

    public void setPwd(String pwd) {
        this.pwd = pwd;
    }

    public User() {
    }

    public User(int userid, String userName, String pwd) {
        this.userid = userid;
        this.userName = userName;
        this.pwd = pwd;
    }

    @Override
    public String toString() {
        return "User{" +
                "userid=" + userid +
                ", userName='" + userName + '\'' +
                ", pwd='" + pwd + '\'' +
                '}';
    }
}

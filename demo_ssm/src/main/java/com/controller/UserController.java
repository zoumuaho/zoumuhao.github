package com.controller;

import com.alibaba.fastjson.JSONObject;

import com.entity.User;
import com.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import java.util.List;


/**
 * Created by HP on 2017/8/3.
 */
@Controller
@RequestMapping("user")
public class UserController {
        @Autowired
        private UserService userService;

        private User user;

        public User getUser() {
                return user;
        }

        public void setUser(User user) {
                this.user = user;
        }

        /*@RequestMapping("getUser")
            public String  getUser(User user) {
                System.out.print(user.getUserName()+"\t"+user.getPwd());
                List<User> userList = userService.getUser(user);
                if(userList.size()>0){
                    return "redirect:../Emp/getEmp";
                }else{
                    return "../../index";
                }
            }*/
        //用户登录
        @RequestMapping("loginUser.do")
        public void userLogin(@RequestParam("userName") String userName, @RequestParam("pwd") String pwd, Model model, HttpServletRequest request, HttpServletResponse response) throws IOException {
                PrintWriter out = response.getWriter();
                HttpSession session = request.getSession();
                JSONObject jsonObject = new JSONObject();
                response.setContentType("text/json; charset=utf-8");
                List<User> userList = userService.getUser(userName, pwd);
                for (User user : userList) {
                        if (user.getUserName().equals(userName) && user.getPwd().equals(pwd)) {
                                jsonObject.put("result", "success");
                        } else {
                                jsonObject.put("result", "error");
                        }
                }
                model.addAttribute("userList", userList);
                session.setAttribute("userName", userName);
                out.print(jsonObject);
                out.flush();
                out.close();

        }

        //返回用户注册页面
        @RequestMapping("reg.do")
        public String reg() {
                return "regist";
        }

        //添加用户
        @RequestMapping("addReg.do")
        public String addReg(User user) {
                if (userService.addUser(user) > 0) {
                        return "../../index";
                }
                return "redirect:/user/reg";
        }

        @RequestMapping("validateUsername.do")
        public void validateUsername(@RequestParam("userName") String userName, HttpServletRequest request, HttpServletResponse response) throws IOException {
                PrintWriter out = response.getWriter();
                JSONObject jsonObject = new JSONObject();
                response.setContentType("text/json; charset=utf-8");
                List<User> userList = userService.validateUsername(userName);
                if (userList.size() > 0) {
                        jsonObject.put("result", "success");
                }
                out.print(jsonObject);
                out.flush();
                out.close();
        }
}

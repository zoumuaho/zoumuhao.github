package com.controller;

import com.alibaba.fastjson.JSONObject;
import com.entity.Emp;
import com.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

/**
 * Created by HP on 2017/8/2.
 */
@Controller
@RequestMapping("Emp")
public class EmpController {
    @Autowired
    private EmpService empService;

    @RequestMapping("getEmp.do")
    public ModelAndView getEmpList() {

        ModelAndView mv = new ModelAndView("hello");
        List<Emp> Elist = empService.selectEmpList();
        for (Emp emp : Elist) {
            System.out.println(emp.getEname());

        }
        mv.addObject("Emp", Elist);
        return mv;
    }
    @RequestMapping("deleteEmp.do")
    public void deleteEmp(@RequestParam("empno") int empno, HttpServletRequest request, HttpServletResponse response) throws IOException {

        PrintWriter out = response.getWriter();
        JSONObject jsonObject = new JSONObject();
        response.setContentType("text/json; charset=utf-8");
        int row = empService.deleteEmp(empno);
        if(row>0){
            jsonObject.put("result","success");
        }else{
            jsonObject.put("result","error");
        }
        out.print(jsonObject);
    }
    @RequestMapping("addEmp.do")
    public String addEmp(){
        return "addEmp";
    }
    @RequestMapping("getAddEmp")
    public String getAddEmp(Emp emp){
        int row = empService.getAddEmp(emp);
        if(row>0){
            return "redirect:/Emp/getEmp.do";
        }
        return "redirect:../error/500";
    }
}

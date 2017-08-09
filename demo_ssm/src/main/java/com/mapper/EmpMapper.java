package com.mapper;

import com.entity.Emp;
import com.entity.User;

import java.util.List;

/**
 * Created by HP on 2017/8/1.
 */
public interface EmpMapper {
    //查询所有员工信息
    public List<Emp> selectEmpList();

    //删除员工信息
    public int deleteEmp(int empno);

    //添加员工信息
       public int addEmp(Emp emp);

    public int getAddEmp(Emp emp);
}


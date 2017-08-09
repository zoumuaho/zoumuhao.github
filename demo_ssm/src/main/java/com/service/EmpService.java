package com.service;

import com.entity.Emp;

import java.util.List;

/**
 * Created by HP on 2017/8/2.
 */
public interface EmpService {
    public List<Emp> selectEmpList();

    public int deleteEmp(int empno);

    public int addEmp(Emp emp);

    public int getAddEmp(Emp emp);
}

package com.service.impl;

import com.entity.Emp;
import com.mapper.EmpMapper;
import com.service.EmpService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by HP on 2017/8/2.
 */
@Service("empService")
public class EmpServiceImpl implements EmpService {
    @Autowired
    private EmpMapper empMapper;

    public int deleteEmp(int empno) {
        int row =empMapper.deleteEmp(empno);
        return row;
    }

    public int getAddEmp(Emp emp) {
        return empMapper.getAddEmp(emp);
    }

    public int addEmp(Emp emp) {
        int row = empMapper.addEmp(emp);
        return row;
    }

    public List<Emp> selectEmpList() {
        return empMapper.selectEmpList();
    }
}

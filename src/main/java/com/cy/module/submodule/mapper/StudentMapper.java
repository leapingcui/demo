package com.cy.module.submodule.mapper;

import com.cy.module.submodule.entity.Student;

import java.util.List;

/**
 * Created by Administrator on 2017/2/27.
 */
public interface StudentMapper {

    List<Student> selectAll();

    Student selectByPrimaryKey(int stuId);

    int insert(Student student);

    int update(Student student);

    int deleteByPrimaryKey(int stuId);

}

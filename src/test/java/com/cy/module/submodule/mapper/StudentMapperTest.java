package com.cy.module.submodule.mapper;

import com.cy.module.submodule.BaseTest;
import com.cy.module.submodule.entity.Classes;
import com.cy.module.submodule.entity.Student;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/2/28.
 */
public class StudentMapperTest extends BaseTest{

    @Autowired
    private StudentMapper studentMapper;

    @Test
    public void testSelectAll() throws Exception {
        List<Student> students = studentMapper.selectAll();
        for (Student student:students) {
            System.out.println(student);
        }
    }

    @Test
    public void testSelectByPrimaryKey() throws Exception {
        int stuId = 104;
        Student student = studentMapper.selectByPrimaryKey(stuId);
        System.out.println(student);
    }

    @Test
    public void testInsert() throws Exception {
        Student student = new Student();
        student.setStuId(114);
        student.setStuPwd("114");
        student.setStuName("崔十四");
        student.setStuSex("女");
        student.setStuBirth(new Date());

        Classes classes = new Classes();
        classes.setClaId("2");
        student.setClasses(classes);

        int count = studentMapper.insert(student);
        System.out.println(count);
    }

    @Test
    public void testUpdate() throws Exception {
        Student student = new Student();
        student.setStuId(104);
        student.setStuPwd("104");
        student.setStuName("崔四四");
        student.setStuSex("女");
        student.setStuBirth(new Date());

        Classes classes = new Classes();
        classes.setClaId("2");
        student.setClasses(classes);

        student.setClasses(classes);

        int count = studentMapper.update(student);
        System.out.println(count);
    }

    @Test
    public void testDdeleteByPrimaryKey() throws Exception {
        int count = studentMapper.deleteByPrimaryKey(113);
        System.out.println(count);
    }

}

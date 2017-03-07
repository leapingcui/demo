package com.cy.module.submodule.controller;

import com.cy.module.submodule.entity.Student;
import com.cy.module.submodule.service.StudentService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Created by Administrator on 2017/3/1.
 */
@Controller
@RequestMapping("/loginController")
public class LoginController {

    @Autowired
    private StudentService studentService;
    
    private static final Logger logger = Logger.getLogger(LoginController.class);

    @RequestMapping(value = "/login.do")
    public String login(Model model, String stuId, String stuPwd) {
        logger.info("接收到的学号" + stuId);
        logger.info("接收到的密码" + stuPwd);
        int stuIdFromUI = Integer.parseInt(stuId);
        List<Student> students = studentService.selectAll();
        for (Student student : students) {
            if (student.getStuId() == stuIdFromUI && student.getStuPwd().equals(stuPwd)) {
                return "redirect:/studentController/showAllStudents.do";
            }
        }
        model.addAttribute("errors", "用户名或密码错误");
        model.addAttribute("stuId", stuId);
        model.addAttribute("stuPwd", stuPwd);
        return "login";
    }


}

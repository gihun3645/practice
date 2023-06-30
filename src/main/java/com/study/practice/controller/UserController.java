package com.study.practice.controller;

import com.study.practice.domain.User;
import com.study.practice.service.UserDAOImpl;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserDAOImpl userDAOImpl;

    // 회원가입 GET
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getRegister() throws Exception {
        logger.info("get registered");
    }

    // 회원가입 POST
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(User user) throws Exception {
        logger.info("post resister");

        userDAOImpl.register(user);

        return "redirect:/";
    }
}

package com.study.practice.controller;

import com.study.practice.domain.User;
import com.study.practice.service.UserDAOImpl;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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


    // 로그인 GET
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void getLogin() throws Exception {
        logger.info("get login page");
    }

    // 로그인 POST
    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String login(User user, HttpServletRequest req, RedirectAttributes rttr) throws Exception {
        logger.info("post login");
        HttpSession session = req.getSession();
        User login = userDAOImpl.login(user);
        System.out.println(user);
        if (login == null) {
            session.setAttribute("user", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/login";
        } else {
            session.setAttribute("user", login);
            return "redirect:/";
        }
    }


    // 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        logger.info("get logout");

        session.invalidate();

        return "redirect:/";
    }
}

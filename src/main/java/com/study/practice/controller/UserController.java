package com.study.practice.controller;

import com.study.practice.domain.User;
import com.study.practice.service.UserDAOImpl;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.slf4j.Logger;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class UserController {

    private static final Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private UserDAOImpl userDAOImpl;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;


    // 회원가입 GET
    @RequestMapping(value = "/register", method = RequestMethod.GET)
    public void getRegister() throws Exception {
        logger.info("get registered");
    }

    // 회원가입 POST
    @RequestMapping(value = "/register", method = RequestMethod.POST)
    public String postRegister(User user) throws Exception {
        logger.info("post resister");

        // 비밀번호를 암호화하여 저장
        user.setUserPass(passwordEncoder.encode(user.getUserPass()));
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

        if (login != null) {
            // 기존 암호와 맞는지
            boolean passMatch = passwordEncoder.matches(user.getUserPass(), login.getUserPass());

            System.out.println(passMatch);

            if (passMatch) {
                session.setAttribute("user", login);
                return "redirect:/";
            } else {
                session.setAttribute("user", null);
                rttr.addFlashAttribute("msg", false);
                return "redirect:/login";
            }
        } else {
            session.setAttribute("user", null);
            rttr.addFlashAttribute("msg", false);
            return "redirect:/login";
        }
    }


    // 로그아웃
    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logout(HttpSession session) throws Exception {
        logger.info("get logout");

        session.invalidate();

        return "redirect:/";
    }

    // 회원정보 수정 GET
    @RequestMapping(value = "/modifyUser", method = RequestMethod.GET)
    public void getModify() throws Exception {
        logger.info("get modify");
    }

    // 회원정보 수정 POST
    @RequestMapping(value = "/modifyUser", method = RequestMethod.POST)
    public String postModify(HttpSession session, User user) throws Exception {
        logger.info("post modify");
        user.setUserPass(passwordEncoder.encode(user.getUserPass()));
        userDAOImpl.modify(user);
        // 현재 세션이 제거되어 로그아웃
        session.invalidate();
        return "redirect:/";
    }

    // 회원탈퇴 GET
    @RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
    public void getWithdrawal() throws Exception {
        logger.info("get withdrawal");
    }

    // 회원탈퇴 POST
    @RequestMapping(value = "/withdrawal", method = RequestMethod.POST)
    public String postWithdrawal(HttpSession session, User userToWithdraw, RedirectAttributes redirectAttributes) throws Exception {
        logger.info("post withdrawal");

        // 데이터 타입은 기본적으로 오브젝트 타입이라
        // 오브젝트 변수를 생성하여 받거나 형변환(캐스팅)을 해줘야함
        // 현재 세션에서 User 정보를 가져옴.
        // 세션의 "user"라는 속성 값이 object이므로 이를 User 타입으로 형변환(casting)해줘야 함
        User currentUser = (User) session.getAttribute("user");


        // 사용자 정보
        System.out.println("사용자 정보 : " + userToWithdraw);

        // 현제 사용자의 비밀번호
        String currentPassword = currentUser.getUserPass();
        // 탈퇴를 원하는 사용자가 입력한 비밀번호
        String providedPassword = userToWithdraw.getUserPass();

        System.out.println("현제 비번" + currentPassword);
        System.out.println("입력된 비번" + providedPassword);
        System.out.println((passwordEncoder.matches(providedPassword, currentPassword)));

        if (!(passwordEncoder.matches(providedPassword, currentPassword))) {
            redirectAttributes.addFlashAttribute("msg", false);
            return "redirect:/withdrawal";
        }

        // 사용자 정보를 DB에서 삭제
        userDAOImpl.withdrawal(userToWithdraw);
        session.invalidate();

        return "redirect:/";
    }

    // 회원 확인

    // JSP가 필요없어서 @ResponseBody 사용
    @ResponseBody
    @RequestMapping(value = "/idCheck", method = RequestMethod.POST)
    public int postIdCheck(HttpServletRequest req) throws Exception {
        logger.info("post idCheck");

        String userId = req.getParameter("userId");
        User idCheck = userDAOImpl.idCheck(userId);

        int result = 0;

        if (idCheck != null) {
            result = 1;
        }

        return result;
    }

}

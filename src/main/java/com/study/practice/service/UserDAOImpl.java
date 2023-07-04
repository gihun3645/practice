package com.study.practice.service;

import com.study.practice.dao.BoardDAO;
import com.study.practice.dao.UserDAO;
import com.study.practice.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserDAOImpl implements UserDAO {

    private final UserDAO userDAO;

    @Autowired
    public UserDAOImpl(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    // 회원가입
    @Override
    public void register(User user) throws Exception {
        userDAO.register(user);
    }

    // 로그인
    @Override
    public User login(User user) throws Exception {
        return userDAO.login(user);
    }

    // 회원정보 수정
    @Override
    public void modify(User user) throws Exception {
        userDAO.modify(user);
    }

    // 회원탈퇴
    @Override
    public void withdrawal(User user) throws Exception {
        userDAO.withdrawal(user);
    }

    // 아이디 중복 검사
    @Override
    public User idCheck(String userId) throws Exception {
        return userDAO.idCheck(userId);
    }
}

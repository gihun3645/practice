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
}

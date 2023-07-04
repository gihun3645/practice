package com.study.practice.dao;

import com.study.practice.domain.User;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Repository
@Mapper
public interface UserDAO {

    // 회원가입
    public void register(User user) throws Exception;

    // 로그인
    public User login(User user) throws Exception;

    // 회원정보 수정
    public void modify(User user) throws Exception;

    // 회원탈퇴
    public void withdrawal(User user) throws Exception;

    // 아이디 중복 검사
    public User idCheck(String userId) throws Exception;
}

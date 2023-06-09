package com.study.practice.dao;

import com.study.practice.domain.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
@Mapper
public interface ReplyDAO {

    // 댓글 조회
    public List<Reply> view(int board_id) throws Exception;

    // 댓글 작성
    public void write(Reply reply) throws Exception;

    // 댓글 수정
    public void modify(Reply reply) throws Exception;

    // 댓글 삭제
    public void delete(@Param("board_id") int board_id, @Param("reply_id") int reply_id) throws Exception;
    
    // 단일 댓글 조회 
    public Reply select(Reply reply) throws Exception;
}

package com.study.practice.service;

import com.study.practice.dao.ReplyDAO;
import com.study.practice.domain.Reply;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class ReplyDAOImpl implements ReplyDAO {
    private final ReplyDAO replyDAO;

    @Autowired
    public ReplyDAOImpl(ReplyDAO replyDAO) {
        this.replyDAO = replyDAO;
    }

    // 댓글 조회
    @Override
    public List<Reply> view(int board_id) throws Exception {
        return replyDAO.view(board_id);
    }

    // 댓글 작성
    @Override
    public void write(Reply reply) throws Exception {
        replyDAO.write(reply);
    }

    // 댓글 수정
    @Override
    public void modify(Reply reply) throws Exception {
        replyDAO.modify(reply);
    }

    // 댓글 삭제
    @Override
    public void delete(int reply_id) throws Exception {
        replyDAO.delete(reply_id);
    }
}

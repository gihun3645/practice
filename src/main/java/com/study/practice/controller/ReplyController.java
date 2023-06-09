package com.study.practice.controller;


import com.study.practice.domain.Reply;
import com.study.practice.service.ReplyDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReplyController {

    @Autowired
    private ReplyDAOImpl replyDAOImpl;

    // 댓글 작성
    @RequestMapping(value = "/reply/write", method = RequestMethod.POST)
    public String postWrite(Reply reply) throws Exception {

        replyDAOImpl.write(reply);

        return "redirect:/view?board_id=" + reply.getBoard_id();
    }
}

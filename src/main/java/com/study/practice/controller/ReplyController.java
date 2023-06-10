package com.study.practice.controller;


import com.study.practice.domain.Reply;
import com.study.practice.service.ReplyDAOImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    
    // 댓글 단일 조회 (수정 페이지)
    @RequestMapping(value = "/reply_modify", method = RequestMethod.GET)
    public void getModify(@RequestParam("board_id") int board_id, @RequestParam("reply_id") int reply_id ,Model model) throws Exception {
    	
    	Reply replySelect = new Reply();
    	replySelect.setBoard_id(board_id);
    	replySelect.setReply_id(reply_id);
    	
    	Reply reply = replyDAOImpl.select(replySelect);
    	model.addAttribute("reply", reply);
    }
    
    @RequestMapping(value = "/reply/modify", method = RequestMethod.POST)
    public String postModify(Reply reply) throws Exception {
    	replyDAOImpl.modify(reply);
    	
    	return "redirect:/view?board_id=" + reply.getBoard_id();
    }

    @RequestMapping(value = "/reply/delete", method = RequestMethod.GET)
    public String deleteReply(@RequestParam("board_id") int board_id, @RequestParam("reply_id") int reply_id) throws Exception {
    	
    	replyDAOImpl.delete(board_id, reply_id);
    	
    	return "redirect:/view?board_id="+board_id;
    }
}

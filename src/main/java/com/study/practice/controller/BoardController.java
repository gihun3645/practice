package com.study.practice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.Date; // Date 클래스를 import
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.study.practice.domain.Board;
import com.study.practice.service.BoardDAOImpl;

@Controller
public class BoardController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
		// 현재 시간을 serverTime 속성으로 전달
		model.addAttribute("serverTime", new Date());
		return "index";
	}
	
	@Autowired
	private BoardDAOImpl boardDAOImpl;
	
	// 게시물 목록.
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception{
		List list = null;
		list = boardDAOImpl.list();
		model.addAttribute("list", list);
	}
	
	// 게시물 작성 (GET)
	@RequestMapping(value ="/write", method = RequestMethod.GET)
	public String getWrite() throws Exception {
		return "write";
	}
	
	// 게시물 작성 (POST)
	@RequestMapping(value = "/write", method = RequestMethod.POST )
	public String postWrite(Board board) throws Exception{
		boardDAOImpl.write(board);
		
		return "redirect:/list";
	}
	
	// 게시물 조회
	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public void getView(@RequestParam("board_id") int board_id, Model mode) throws Exception {
		Board board = boardDAOImpl.view(board_id);
		mode.addAttribute("view", board);
	}

		// 게시물 수정 (GET)
		@RequestMapping(value = "/modify", method = RequestMethod.GET)
		public void getModify(@RequestParam("board_id") int board_id, Model model) throws Exception {
			Board board = boardDAOImpl.view(board_id);
			
			model.addAttribute("view", board);
		}
		
		// 게시물 수정 (POST)
		@RequestMapping(value = "/modify", method = RequestMethod.POST) 
		public String postModify(Board board) throws Exception {
			boardDAOImpl.modify(board);
			System.out.println(board.getBoard_id());
			
			return "redirect:/view?board_id="+board.getBoard_id();
		}
	
}

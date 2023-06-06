package com.study.practice.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import java.awt.print.Pageable;
import java.security.PublicKey;
import java.security.Provider.Service;
import java.util.Date; // Date 클래스를 import
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.mysql.cj.protocol.PacketSentTimeHolder;
import com.study.practice.domain.Board;
import com.study.practice.domain.Page;
import com.study.practice.service.BoardDAOImpl;

@Controller
public class BoardController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String index(Model model) {
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
			
			return "redirect:/view?board_id="+board.getBoard_id();
		}
		
		// 게시물 삭제 (DELETE)
		@RequestMapping(value = "/delete", method = RequestMethod.GET)
		public String getDelete(@RequestParam("board_id") int board_id) throws Exception {
			 boardDAOImpl.delete(board_id);
			return "redirect:/list";
		}

		// 게시글 목록 + 페이징 추가
		@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
			
			Page page = new Page();
			
			page.setNum(num);
			page.setCount(boardDAOImpl.count());
			
			List<Board> list = null;
			list = boardDAOImpl.listPage(page.getDisplayPost(), page.getPostNum());
			
			model.addAttribute("list", list);
			model.addAttribute("pageNum", page.getPageNum());
			
			model.addAttribute("page", page);
			model.addAttribute("select", num);			
		}
		
		// 게시물 목록 + 페이징 추가 + 검색
				@RequestMapping(value = "/listPageSearch", method = RequestMethod.GET)
				public void getListPageSearch(Model model, 
						@RequestParam("num") int num, 
						@RequestParam(value = "searchType", required = false, defaultValue = "title") String searchType, 
						@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {
					
					Page page = new Page();
					
					page.setNum(num);
					page.setCount(boardDAOImpl.count());
					
					List<Board> list = null;
					list = boardDAOImpl.listPageSearch(page.getDisplayPost(), page.getPostNum(), searchType, keyword);
					
					model.addAttribute("list", list);
					model.addAttribute("page", page);
					model.addAttribute("select", num);			
				}
}

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
			System.out.println(board_id);
			return "redirect:/list";
		}

		// 게시글 목록 + 페이징 추가
		@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void getListPage(Model model, @RequestParam("num") int num) throws Exception {
			
			// 게시물 총 갯수
			int count = boardDAOImpl.count();
			
			// 한 페이지에 출력할 게시물 갯수
			int postNum = 10;
			
			// 하단 페이징 번호([ 게시물 총 갯수 / 한 페이지에 출력할 개]의올림)
			int pageNum = (int)Math.ceil((double)count/postNum);
			
			// 출력할 게시물
			int displayPost = (num - 1) * postNum;
			
			// 한번에 표시할 페이징 번호의 갯수
			int pageNum_count = 10;
			
			// 표시되는 페이지 번호 중 마지막 번호
			// 마지막 페이지 번호 = ((올림)(현재 페이지 번호 / 한번에 표시할 페이지 번호의 갯수)) * 한번에 표시할 페이지 번호의 갯수
			int endPageNum = (int)(Math.ceil((double)num / (double)pageNum_count) * pageNum_count);
			
			// 표시되는 페이지 번호 중 첫번째 번호
			// 시작 페이지 = 마지막 페이지 번호 - 한번에 표시할 페이지 번호의 갯수 + 1
			int startPageNum = endPageNum - (pageNum_count - 1);
			
			// 마지막 번호 재계산 
			int endPageNum_count = (int)(Math.ceil((double)count / (double)pageNum_count));
			
			if (endPageNum > endPageNum_count) {
				endPageNum = endPageNum_count;
			}
			
			boolean prev = startPageNum == 1 ? false : true;
			boolean next = endPageNum * pageNum_count >= count ? false : true;
			
			
			List<Board> list = null;
			list = boardDAOImpl.listPage(displayPost, postNum);
			model.addAttribute("list", list);
			model.addAttribute("pageNum", pageNum);
			
			// 시작 및 끝 번호
			model.addAttribute("startPageNum", startPageNum);
			model.addAttribute("endPageNum", endPageNum);
			
			// 이전 및 다음
			model.addAttribute("prev", prev);
			model.addAttribute("next", next);
			
			// 현제 페이지
			model.addAttribute("select", num);
		}
}

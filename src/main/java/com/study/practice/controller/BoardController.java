package com.study.practice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.Date; // Date 클래스를 import
import java.util.List;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void getList(Model model) throws Exception{
		List list = null;
		list = boardDAOImpl.list();
		model.addAttribute("list", list);
	}
}

package com.study.practice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {
		
		// 메인 페이지
		@GetMapping("/")
		public String index() {
			// 인덱스 페이지를 리턴
			return "index";
		}
}

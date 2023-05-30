package com.study.practice.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.study.practice.service.TestService;


@RestController
public class TestController {
	@Autowired
	TestService testService;
	
	@RequestMapping("/getAnimalsNums")
	public String getAnimalNums() {
		String str = testService.getNums();
		System.out.println("가지고 온 데이터: " + str);
		return str;
	}
	
	@RequestMapping("/getAllAnimals")
	public String getAllAnimals() {
		String str = testService.getAllAnimals();
		System.out.println("가지고 온 데이터: " + str);
		return str;
	}
}

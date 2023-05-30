package com.study.practice.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class DeleteController {
	@DeleteMapping(value = "/{variable}")
	public String DeleteVariable(@PathVariable String variable) {
		return variable;
	}
	

	@DeleteMapping(value = "/request1")
	public String getRequestParam1(@PathVariable String email) {
		return "e-mail : " + email;
	}
}

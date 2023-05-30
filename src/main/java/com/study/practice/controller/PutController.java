package com.study.practice.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.scheduling.config.ScheduledTasksBeanDefinitionParser;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import dto.MemberDto;

@RestController
@RequestMapping("/api/v1/put-api")
public class PutController {
	@PutMapping(value = "/member")
	public String postMember(@RequestBody Map<String, Object> putData) {
		StringBuilder sBuilder = new StringBuilder();
		putData.entrySet().forEach(map -> {
			sBuilder.append(map.getKey() + " : " + map.getValue() + "\n");
		});
		return sBuilder.toString();
	}
	
	@PutMapping(value = "/member1")
	public String PostMemberDto1(@RequestBody MemberDto memberDto) {
		return memberDto.toString();
	}
	
	@PutMapping(value = "/member2")
	public MemberDto PostMemberDto2(@RequestBody MemberDto memberDto) {
		return memberDto;
	}
	
	@PutMapping("/member3")
	public ResponseEntity<MemberDto> postMemberDto3(@RequestBody MemberDto memberDto) {
		return ResponseEntity.status(HttpStatus.ACCEPTED).body(memberDto);
	}
}

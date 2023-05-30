package com.study.practice.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.practice.dao.TestDao;

@Service
public class TestService {
	@Autowired 
	TestDao testDao;
	
	public String getNums() {
		Long num = testDao.getNumber();
		String ans; 
		ans ="총 동물의 수는 " + num.toString()  + "마리입니다.";
		
		return ans;
	}
	
	public String getAllAnimals() {
		String ans;
		ans = testDao.getCat() + " " + testDao.getDog() + " " + testDao.getQuokka();
		return ans;
				
	}
}

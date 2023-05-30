package com.study.practice.dao;

import org.springframework.stereotype.Component;

@Component
public class TestDao {
	
	public String getDog() { 
		return "강아지";
	}
	
	public String getCat(){
        return "고양이";
    }

    public String getQuokka(){
        return "쿼카";
    }

    public Long getNumber(){
    	//롱타입임을 명시 
        return 1L;
    }
}
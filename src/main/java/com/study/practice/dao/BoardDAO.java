package com.study.practice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.practice.domain.Board;

@Mapper
@Repository
public interface BoardDAO {
	public List<Board> list();
	
	public void write(Board board) throws Exception;
}

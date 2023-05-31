package com.study.practice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.study.practice.domain.Board;

@Mapper
@Repository
public interface BoardDAO {
	// 게시글 목록 
	public List<Board> list();
	
	// 게시글 작성 
	public void write(Board board) throws Exception;
	
	// 게시글 조회 
	public Board view(int board_id) throws Exception;
}

package com.study.practice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
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

	// 게시글 수정
	public void modify(Board board) throws Exception;
	
	// 게시글 삭제
	public void delete(int board_id) throws Exception;
	
	// 게시물 총 개수 
	public int count() throws Exception;

	// 게시물 목록 + 페이징
	public List listPage(@Param("displayPost") int displayPost, @Param("postNum")int postNum) throws Exception;
	
	// 게시물 목록  + 페이징 + 검색 
	public List listPageSearch(@Param("displayPost") int displayPost,@Param("postNum") int postNum, @Param("searchType") String searchType, @Param("keyword") String keyword) throws Exception;
}

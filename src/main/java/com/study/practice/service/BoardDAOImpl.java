package com.study.practice.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.practice.dao.BoardDAO;
import com.study.practice.domain.Board;

@Service
public class BoardDAOImpl implements BoardDAO {
    private final BoardDAO boardDAO;

    @Autowired
    public BoardDAOImpl(BoardDAO boardDAO) {
        this.boardDAO = boardDAO;
    }

    // 게시물 목록.
    @Override
    public List<Board> list() {
        return boardDAO.list();
    }

    // 게시물 작성.
    @Override
    public void write(Board board) throws Exception {
        boardDAO.write(board);
    }
    
    // 게시물 조회
    public Board view(int board_id) throws Exception {
    	return boardDAO.view(board_id);
    }

    // 게시글 수정
    public void modify(Board board) throws Exception {
    	boardDAO.modify(board);
    }
    
    // 게시글 삭제
    public void delete(int board_id) throws Exception {
    	boardDAO.delete(board_id);
    }

    // 게시글 총 갯수
	@Override
	public int count() throws Exception {
		return boardDAO.count();
 	}

	
	// 게시글 페이징 
	@Override
	public List listPage(@Param("displayPost") int displayPost, @Param("postNum") int postNum) throws Exception {
	    return boardDAO.listPage(displayPost, postNum);
	}
	
	
	// 게시물 목록 + 페이징 + 검색 
	@Override
	public List listPageSearch(
			@Param("displayPost") int displayPost,@Param("postNum") int postNum, 
			@Param("searchType") String searchType, @Param("keyword") String keyword) throws Exception {
		
		return boardDAO.listPageSearch(displayPost, postNum, searchType, keyword);
	}
	
}

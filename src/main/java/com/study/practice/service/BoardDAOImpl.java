package com.study.practice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
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
}

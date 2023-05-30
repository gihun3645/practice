package com.study.practice.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.study.practice.dao.BoardDAO;
import com.study.practice.domain.Board;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BoardDAOImpl implements BoardDAO{
	private final BoardDAO boardDAO;
	
	@Override
	public List<Board> list() {
		return boardDAO.list();
	}
}

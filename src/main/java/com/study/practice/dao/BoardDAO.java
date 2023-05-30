package com.study.practice.dao;

import java.util.List;

import com.study.practice.domain.Board;

public interface BoardDAO {
	public List<Board> list() throws Exception;
}

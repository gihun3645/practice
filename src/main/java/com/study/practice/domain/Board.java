package com.study.practice.domain;

import java.sql.Date;

/*
 create table board (
	board_id int not null auto_increment,
    title varchar(50) not null,
    content text not null,
    writer varchar(30) not null,
    reg_date timestamp not null default now(),
    view_count int default 0,
    primary key(board_id)
);
  */
public class Board {
	private int board_id;
	private String title;
	private String content;
	private String writer;
	private Date reg_date;
	private int view_count;
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getView_count() {
		return view_count;
	}
	public void setView_count(int view_count) {
		this.view_count = view_count;
	}
	
	
	
}	

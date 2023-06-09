package com.study.practice.domain;

/*
create table board_reply (
    reply_id int not null auto_increment,
    board_id int not null,
    writer varchar(30) not null,
    content text not null,
    reg_date timestamp not null default now(),
    primary key(reply_id, board_id),
    foreign key(board_id) references board(board_id)
);
*/

import java.util.Date;

public class Reply {
    private int reply_id;
    private int board_id;
    private String writer;
    private String content;
    private Date reg_date;

    public int getReply_id() {
        return reply_id;
    }

    public void setReply_id(int reply_id) {
        this.reply_id = reply_id;
    }

    public int getBoard_id() {
        return board_id;
    }

    public void setBoard_id(int board_id) {
        this.board_id = board_id;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getReg_date() {
        return reg_date;
    }

    public void setReg_date(Date reg_date) {
        this.reg_date = reg_date;
    }
}

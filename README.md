# 레거시 게시판 프로젝트

이 프로젝트는 Spring, MyBatis, MySQL, JSP, 그리고 jQuery를 사용하여 개발된 레거시 게시판입니다.

## 개요

이 게시판은 사용자가 게시물을 작성, 수정, 삭제하고 댓글을 달 수 있는 기능을 제공합니다.

## 구성 요소

프로젝트는 다음과 같은 구성 요소로 이루어져 있습니다:

- **Spring Framework**: 웹 애플리케이션 개발을 위한 프레임워크로 사용되었습니다.
- **MyBatis**: 데이터베이스 연동을 위한 ORM(Object-Relational Mapping) 프레임워크로 사용되었습니다. SQL 매핑을 XML 파일로 작성하고, Java 객체와 데이터베이스 레코드 간의 매핑을 처리합니다.
- **MySQL**: 데이터베이스 시스템으로 사용되었습니다. 게시물, 댓글, 회원 정보 등을 저장하고 관리합니다.
- **JSP**: 서버 측에서 동적인 웹 페이지를 생성하기 위해 사용되었습니다. JSP를 통해 게시물 목록, 상세 내용, 댓글 등을 표시합니다

## 초반 MySQL 실행 쿼리

```java

CREATE DATABASE practice CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

CREATE TABLE board (
        board_id INT NOT NULL AUTO_INCREMENT,
        title VARCHAR(50) NOT NULL,
        content LONGTEXT NOT NULL,
        writer VARCHAR(30) NOT NULL,
        reg_date TIMESTAMP NOT NULL DEFAULT NOW(),
        view_count INT DEFAULT 0,
        PRIMARY KEY(board_id)
);


create table board_reply (
    reply_id int not null auto_increment,
    board_id int not null,
    writer varchar(30) not null,
    content text not null,
    reg_date timestamp not null default now(),
    primary key(reply_id, board_id),
    foreign key(board_id) references board(board_id)
);


CREATE TABLE user (
    userId VARCHAR(30) NOT NULL,
    userPass VARCHAR(100) NOT NULL,
    userName VARCHAR(30) NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`userId`),
    UNIQUE (`userName`));
```


# レガシーボードプロジェクト

このプロジェクトは、Spring、MyBatis、MySQL、JSP、そしてjQueryを使用して開発されたレガシーボードです。

## 概要

このボードは、ユーザーが投稿を作成、編集、削除し、コメントを追加できる機能を提供します。

## コンポーネント

プロジェクトは以下のコンポーネントで構成されています:

- **Spring Framework**: ウェブアプリケーション開発のためのフレームワークとして使用されました。
- **MyBatis**: データベース連携のためのORM（Object-Relational Mapping）フレームワークとして使用されました。SQLマッピングはXMLファイルで記述し、Javaオブジェクトとデータベースレコードのマッピングを処理します。
- **MySQL**: データベースシステムとして使用されました。投稿、コメント、会員情報などを保存および管理します。
- **JSP**: サーバーサイドで動的なウェブページを生成するために使用されました。JSPを使用して、投稿リスト、詳細コンテンツ、コメントなどを表示します。

## 初期のMySQL実行クエリ

```java

CREATE DATABASE practice CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

create table board (
	board_id int not null auto_increment,
    title varchar(50) not null,
    content text not null,
    writer varchar(30) not null,
    reg_date timestamp not null default now(),
    view_count int default 0,
    primary key(board_id)
);

create table board_reply (
    reply_id int not null auto_increment,
    board_id int not null,
    writer varchar(30) not null,
    content text not null,
    reg_date timestamp not null default now(),
    primary key(reply_id, board_id),
    foreign key(board_id) references board(board_id)
);

CREATE TABLE user (
    userId VARCHAR(30) NOT NULL,
    userPass VARCHAR(100) NOT NULL,
    userName VARCHAR(30) NOT NULL,
    reg_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`userId`),
    UNIQUE (`userName`));
```


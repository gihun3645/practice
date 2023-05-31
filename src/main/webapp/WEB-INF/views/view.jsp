<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 조회</title>
</head>
<body>
    <div id="nav">
        <%@ include file="nav.jsp" %>
    </div>
    
    <h2>${view.title}</h2>

<hr />
<div class="writer">
	<span>작성자 : </span>${view.writer}
</div>

<hr />

<div class="content">
	${view.content}
</div>

<hr />

        <div>
            <a href="/modify?board_id=${view.board_id}">게시물 수정</a>,
            	<a href="/delete?board_id=${view.board_id }">게시물 삭제</a>
        </div>
</body>
</html>

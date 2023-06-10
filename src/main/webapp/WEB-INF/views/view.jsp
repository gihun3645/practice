<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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

<hr/>

<div class="writer">
    <span>작성자 : </span>${view.writer}
</div>

<hr/>

<div class="content">
    ${view.content}
</div>

<hr/>

<div>
    <a href="/modify?board_id=${view.board_id}">게시물 수정</a>,
    <a href="/delete?board_id=${view.board_id}">게시물 삭제</a>
</div>


<!-- 댓글 시작 -->
<hr/>

<ul>
    <c:forEach items="${reply}" var="reply">
        <li>
            <div>
                <p>${reply.writer} / ${reply.reg_date}</p>
                <p>${reply.content}</p>
                
  				<p>
                    <a href="/reply_modify?board_id=${view.board_id}&reply_id=${reply.reply_id}">수정</a> / <a href="">삭제</a>
                </p>
            </div>
        </li>
    </c:forEach>
</ul>


<div>
    <form method="post" action="/reply/write">

        <p>
            <label>댓글 작성자</label> <input type="text" name="writer">
        </p>
        <p>
            <textarea rows="5" cols="50" name="content"></textarea>
        </p>
        <p>
            <input type="hidden" name="board_id" value="${view.board_id}">
            <button type="submit">댓글 작성</button>
        </p>
    </form>
</div>

<script>

</script>

<!-- 댓글 끝 -->
</body>
</html>

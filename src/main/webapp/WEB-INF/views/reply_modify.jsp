<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
</head>
<body>
<div id="nav">
    <%@ include file="nav.jsp" %>
</div>


<!-- 댓글 수정 시작 -->
<hr/>


<div>
    <form method="post" action="/reply/modify">

        <p>
            <label>댓글 작성자</label> <input type="text" name="writer" readonly="readonly" value="${reply.writer}">
        </p>
        <p>
            <textarea rows="5" cols="50" name="content">${reply.content}</textarea>
        </p>
        <p>
            <input type="hidden" name="board_id" value="${reply.board_id}">
            <input type="hidden" name="reply_id" value="${reply.reply_id}">
            <button type="submit">댓글 수정</button>
        </p>
    </form>
</div>

<script>

</script>

<!-- 댓글 수정 끝 -->
</body>
</html>

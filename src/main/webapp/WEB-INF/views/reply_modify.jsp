<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>댓글 수정</title>
</head>
<body>
<div id="nav">
    <%@ include file="nav.jsp" %>
</div>


<!-- 댓글 수정 시작 -->
<hr/>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form method="post" action="/reply/modify">
                <div class="form-group">
                    <label>댓글 작성자</label>
                    <input type="text" name="writer" readonly="readonly" value="${reply.writer}" class="form-control">
                </div>

                <div class="form-group">
                    <textarea rows="5" name="content" class="form-control">${reply.content}</textarea>
                </div>

                <input type="hidden" name="board_id" value="${reply.board_id}">
                <input type="hidden" name="reply_id" value="${reply.reply_id}">
                <button type="submit" class="btn btn-primary">댓글 수정</button>
            </form>
        </div>
    </div>
</div>

<script>

</script>

<!-- 댓글 수정 끝 -->
</body>
</html>
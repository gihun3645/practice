<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
    <meta charset="UTF-8">
    <title>게시물 조회</title>
</head>
<body>
<div id="nav" class="mb-5">
    <%@ include file="nav.jsp" %>
</div>

<div class="container">
    <h2 class="mb-4">${view.title}</h2>

    <hr/>

    <div class="writer mb-3">
        <span>작성자 : </span><strong>${view.writer}</strong>
    </div>

    <hr/>

    <div class="content mb-3">
        ${view.content}
    </div>

    <hr/>

    <div class="mb-4">
        <a href="/modify?board_id=${view.board_id}" class="btn btn-warning">게시물 수정</a>
        <a href="/delete?board_id=${view.board_id}" class="btn btn-danger">게시물 삭제</a>
    </div>

    <!-- 댓글 시작 -->
    <hr/>

    <ul class="list-unstyled">
        <c:forEach items="${reply}" var="reply">
            <li class="mb-3 p-3 border rounded">
                <div>
                    <p><strong>${reply.writer}</strong> / ${reply.reg_date}</p>
                    <p>${reply.content}</p>

                    <p>
                        <a href="/reply_modify?board_id=${view.board_id}&reply_id=${reply.reply_id}" class="btn btn-sm btn-warning">수정</a>
                        <a href="/reply/delete?board_id=${view.board_id}&reply_id=${reply.reply_id}" class="btn btn-sm btn-danger">삭제</a>
                    </p>
                </div>
            </li>
        </c:forEach>
    </ul>

    <div class="my-5">
        <form method="post" action="/reply/write">
            <div class="form-group">
                <label>댓글 작성자</label>
                <input type="text" name="writer" class="form-control">
            </div>
            <div class="form-group">
                <textarea rows="5" class="form-control" name="content"></textarea>
            </div>
            <div class="form-group">
                <input type="hidden" name="board_id" value="${view.board_id}">
                <button type="submit" class="btn btn-primary">댓글 작성</button>
            </div>
        </form>
    </div>

    <script>

    </script>

    <!-- 댓글 끝 -->
</div>
</body>
</html>

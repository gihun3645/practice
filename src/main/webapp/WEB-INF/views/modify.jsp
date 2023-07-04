<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.4.1.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
    <meta charset="UTF-8">
    <title>게시물 수정</title>
</head>
<body>
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <form method="post">
                <div class="form-group">
                    <label>제목</label>
                    <input type="text" name="title" value="${view.title}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>작성자</label>
                    <input type="text" name="writer" value="${view.writer}" class="form-control"/>
                </div>

                <div class="form-group">
                    <label>내용</label>
                    <textarea cols="50" rows="5" name="content" class="form-control">${view.content}</textarea>
                </div>

                <button type="submit" class="btn btn-primary">완료</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>

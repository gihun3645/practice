<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>회원정보 수정</title>
</head>
<body>
<div class="container">
    <div id="nav" class="mb-4">
        <%@  include file="nav.jsp"  %>
    </div>
    <form role="form" method="post" autocomplete="off">
        <div class="form-group">
            <label for="userName">닉네임</label>
            <input type="text" id="userName" name="userName"
                   value="${user.userName}" class="form-control">
        </div>
        <div class="form-group">
            <label for="userPass">새로운 패스워드</label>
            <input type="password" id="userPass" name="userPass" class="form-control">
        </div>
        <button type="submit" id="submit" class="btn btn-primary">수정</button>
        <p>회원 탈퇴는 <a href="/withdrawal">여기</a>를 눌러주세요.</p>
    </form>
</div>
</body>
</html>

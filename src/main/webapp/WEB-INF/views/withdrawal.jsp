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
    <title>회원탈퇴</title>
</head>
<body>
<div class="container">
    <div id="nav" class="mb-4">
        <%@  include file="nav.jsp"  %>
    </div>
    <form role="form" method="post" autocomplete="off">
        <div class="form-group">
            <label for="userID">아이디</label>
            <input type="text" id="userId" name="userId"
                   value="${user.userId}" class="form-control" readonly/>
            <label for="userName">닉네임</label>
            <input type="text" id="userName" name="userName"
                   value="${user.userName}" class="form-control" readonly/>
        </div>
        <div class="form-group">
            <label for="userPass">패스워드</label>
            <input type="password" id="userPass" name="userPass" class="form-control">
        </div>
        <button type="submit" id="submit" class="btn btn-primary">회원탈퇴</button>
    </form>
    <c:if test="${msg == false}">
        <div class="alert alert-danger mt-2" role="alert">
            패스워드가 일치하지 않습니다.
        </div>
    </c:if>
</div>
</body>
</html>

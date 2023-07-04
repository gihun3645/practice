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
    <title>로그인</title>
</head>
<body>
<div class="container">
    <div id="nav" class="mb-4">
        <%@  include file="nav.jsp" %>
    </div>
    <%--로그인 창 추가--%>
    <c:if test="${user == null || msg == false}">
        <form role="form" method="post" autocomplete="off" action="/login">
            <div class="form-group">
                <label for="userId">아이디</label>
                <input type="text" id="userId" name="userId" class="form-control"/>
            </div>
            <div class="form-group">
                <label for="userPass">패스워드</label>
                <input type="password" id="userPass" name="userPass" class="form-control"/>
            </div>
            <button type="submit" class="btn btn-primary" >로그인</button>
        </form>
    </c:if>

    <c:if test="${msg == false}">
        <div class="alert alert-danger mt-2" role="alert">
            아이디 혹은 패스워드가 일치하지 않습니다.
        </div>
    </c:if>

</div>
</body>
</html>

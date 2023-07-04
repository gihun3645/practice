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
    <title>회원가입</title>
</head>
<body>
<div class="container">
    <div id="nav" class="mb-4">
        <%@  include file="nav.jsp"  %>
    </div>
    <form role="form" method="post" autocomplete="off">
        <div class="form-group">
            <label for="userId">아이디</label>
            <input type="text" id="userId" name="userId" class="form-control">
        </div>

        <div class="form-group">
            <button type="button" id="idCheck" class="btn btn-primary idCheck">아이디 중복확인</button>
        </div>

        <div class="form-group result" >
            <span class="msg">아이디를 확인해 주십시오.</span>
        </div>

        <div class="form-group">
            <label for="userPass">패스워드</label>
            <input type="password" id="userPass" name="userPass" class="form-control">
        </div>
        <div class="form-group">
            <label for="userName">닉네임</label>
            <input type="text" id="userName" name="userName" class="form-control">
        </div>
        <button type="submit" id="submit" disabled="disabled" class="btn btn-primary">등록</button>
    </form>
</div>

<script>
$(".idCheck").click(function () {


    var query = {userId : $("#userId").val()};

    $.ajax({
        url : "/idCheck",
        type : "post",
        data : query,
        success : function (data) {

            if (data == 1) {
                $(".result .msg").text("사용 불가");
                $(".result .msg").attr("style", "color:#f00");
                $("#submit").attr("disabled", "disabled");
            } else {
                $(".result .msg").text("사용 가능");
                $(".result .msg").attr("style", "color:#00f")
                $("#submit").removeAttr("disabled");
            }
        }
    }); // ajax코드

});
</script>
</body>
</html>

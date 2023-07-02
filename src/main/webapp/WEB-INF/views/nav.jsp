<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<style>

    /*전체 글, 글 작성 링크*/
    .p-2.text-dark:hover {
        background-color: #f4f6fb;
        text-decoration: none;
        border-radius: 5px;
        transition: all 0.3s ease;
    }

    /*메인화면 링크*/
    .legacy-board-link:hover {
        background-color: #f4f6fb;
        text-decoration: none;
        border-radius: 5px;
        transition: all 0.3s ease;
    }


</style>
<div class="d-flex flex-column flex-md-row align-items-center p-3 px-md-4 mb-3 bg-white border-bottom box-shadow">
    <h5 class="my-0 mr-md-auto font-weight-normal"><a class="legacy-board-link" href="/">Legacy Board</a></h5>
    <nav class="my-2 my-md-0 mr-md-3">
        <a class="p-2 text-dark" href="/listPageSearch?num=1">전체 글</a>
    </nav>

    <c:choose>
        <c:when test="${user != null}">
            <p>${user.userName}님</p>
            <a class="p-2 text-dark btn btn-outline-primary" href="/write">글 작성</a>
            <a class="p-2 text-dark btn btn-outline-primary" href="/logout">로그아웃</a>
        </c:when>
        <c:otherwise>
            <a class="btn btn-outline-primary" href="/register">Sign up</a>
            <a class="btn btn-outline-primary" href="/login">Login</a>
        </c:otherwise>
    </c:choose>
</div>
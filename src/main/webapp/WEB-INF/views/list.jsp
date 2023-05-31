<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>게시물 목록</title>
</head>
<body>
<div id="nav">
	<%@  include file="nav.jsp"  %> 
</div>
<table>
    <thead>
    <tr>
        <th>번호</th>
        <th>제목</th>
        <th>작성일</th>
        <th>작성자</th>
        <th>조회수</th>
    </tr>
    </thead>

    <tbody>

    </tbody>

    <tbody>

    <c:forEach items="${list}" var="board">
        <tr>
            <td>${board.board_id}</td>
            <td>
                <a href="/view?board_id=${board.board_id}">${board.title}</a>
            </td>
            <td>${board.title}</td>
            <td><fmt:formatDate value="${board.reg_date}" pattern="yyyy-MM-dd" /></td>
            <td>${board.writer}</td>
            <td>${board.view_count}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
</body>
</html>
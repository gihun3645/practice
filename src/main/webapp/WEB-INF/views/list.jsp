<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
</head>
<body>
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
  <td>${board.title}</td>
  <td>${board.reg_date}</td>
  <td>${board.writer}</td>
  <td>${board.view_count}</td>
 </tr>
</c:forEach>
</tbody>
</table>
</body>
</html>
<!-- index.jsp -->

<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello world!
</h1>
<p> The time on the server is ${serverTime}. </p>
<div id="nav">
	<%@  include file="nav.jsp"  %> 
</div>
</body>
</html>

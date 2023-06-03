<!-- index.jsp -->

<%@page import="lombok.EqualsAndHashCode.Include"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Home</title>
</head>
<body>
<h1>
    Hello world!
</h1>
<p> The time on the server is  </p>
<div id="nav">
	<%@  include file="nav.jsp"  %> 
</div>
</body>
</html>

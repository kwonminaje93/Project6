<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
<%
	String id = request.getParameter("id");
	ProductDAO dao = new ProductDAO();
	dao.delete(id);
%>
	alert("삭제완료되었습니다.");
	location.href="insert.html";
</script>
</body>
</html>
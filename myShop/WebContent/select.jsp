<%@page import="product.ProductDTO"%>
<%@page import="product.ProductDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품검색 리스트</title>
      <link type="text/css" rel="stylesheet" href="maincss.css">
</head>
<body>
	<script type="text/javascript">
		
	<%
		String id = request.getParameter("id");
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = dao.select(id);
	%>
	</script>	
	<center>
	 <font color = "black" size="6">등록한 글 화면입니다</font>
	 <hr>
<table class ="bg">
	<tr align="center">
		<td width="100">아이디</td>
		<td width="300" id="id" value="<%= dto.getId() %>"><%= dto.getId() %></td>
	</tr>
	<tr align="center">
		<td bgcolor="red" width="100">상품 이름</td>
		<td bgcolor="orange"  width="300" id="title" value="<%= dto.getTitle() %>"><%= dto.getTitle() %></td>
	</tr>
	
	<tr align="center">
	<td bgcolor="red" width="100">상품 설명</td>
	<td bgcolor="orange"  width="300" id="content" value ="<%= dto.getContent() %>"><%= dto.getContent() %></td>
	</tr>
	
	<tr align="center">
		<td bgcolor="red" width="100">가격</td>
		<td bgcolor="orange"  width="300" id="price" value="<%= dto.getPrice() %>"><%=dto.getPrice()%></td>
	</tr>
</table>
<hr>
        <a href="insert.html">상품 등록</a>
		<a href="delete.html">상품 삭제</a>
        <a href="selectAll.jsp">상품 전체 검색</a>
        <a href="update.html">상품 수정</a>
</center>
</body>
</html>
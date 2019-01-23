<%@page import="product.ProductDTO"%>
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
		ProductDAO dao = new ProductDAO();
		ProductDTO dto = new ProductDTO();
		
		String id = request.getParameter("id");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int price = Integer.parseInt(request.getParameter("price"));
		
		dto.setId(id);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPrice(price);
	%>
	<%
		dao.insert(dto);
	%>
		alert("상품등록 완료");
		location.href="insert.html";
</script>
</body>
</html>
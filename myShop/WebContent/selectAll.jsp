<%@page import="product.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
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
<center>
<font color = "black" size="6">상품 전체 리스트</font>
<hr>
					<table>	
							<tr align ="center">
								<td width="150"><strong>아&nbsp;이&nbsp;디&nbsp;</strong></td>
							 	<td width="150"><strong>상&nbsp;품&nbsp;명&nbsp;</strong></td> 
								<td width="200"><strong>내&nbsp;&nbsp;&nbsp;용</strong></td>
								<td width="100"><strong>가&nbsp;&nbsp;&nbsp;격</strong></td>
							</tr>
							
						<%	
							//게시판 메인에 게시글 목록띄우는 것
							ProductDAO dao = new ProductDAO();
							ArrayList<ProductDTO> list = dao.selectAll();
							ProductDTO dto = null;
							
						
							for(int i = 0; i < list.size(); i++){
								dto = list.get(i);
								dto = dao.select(dto.getId());
								dto.setId(dto.getId());
						%>
							<tr align = "center">
								<td bgcolor= "gray" width="100"><%= dto.getId()%></td>
								<td bgcolor= "gray" width="100"><%= dto.getTitle()%></td>
								<td bgcolor= "gray" width="100"><%= dto.getContent()%></td>
								<td bgcolor= "gray" width="100"><%= dto.getPrice()%></td>
							</tr>
						<%		
							}
						%>
					</table>
					 <hr>
        <a href="insert.html">상품 등록</a>
        <a href="delete.html">상품 삭제</a>
        <a href="select.html">상품 검색</a>
        <a href="update.html">상품 수정</a>
					</center>
</body>
</html>
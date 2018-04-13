<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="Style.css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<center>
		<h1>Book Management</h1>
		<h2>
			<a href="/MVC_CRUD/new">Add New Book</a> &nbsp; &nbsp; &nbsp;
			<a href="/MVC_CRUD/list">List All Books</a>
		</h2>
	</center>
	<div align="center">
		<table border="1" cellpadding="5">
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author</th>
				<th>Price</th>
				<th>Actions</th>
			</tr>
			<c:forEach var="book" items="${listBook}">
				<tr>
					<td><c:out value="${book.id}"></c:out></td>
					<td><c:out value="${book.title}"></c:out></td>
					<td><c:out value="${book.author}"></c:out></td>
					<td><c:out value="${book.price}"></c:out></td>
					<td><a href="/MVC_CRUD/edit?id=<c:out value="${book.id}" />">Edit</a>
						&nbsp; &nbsp; &nbsp;
						<a href="/MVC_CRUD/delete?id=<c:out value="${book.id}" />">Delete</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>


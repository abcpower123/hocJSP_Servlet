<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="Style.css">
<title>Book Store App</title>
</head>
<body>
	<h1 align="center">Books Management</h1>
	<h2 align="center">
		<a href="/MVC_CRUD/new">Add new book</a> &nbsp; &nbsp;&nbsp; <a href="/MVC_CRUD/list">List
			all books</a>
	</h2>
	<div align="center">
		<c:if test="${book!=null}">
			<form action="update" method="post">
				<table border="1" cellpadding="5">
					<caption>
						<h2>Edit book</h2>
					</caption>
					<input type="hidden" name="id"
						value='<c:out value="${book.id}"></c:out>' />
					</c:if>

					<c:if test="${book==null}">
						<form action="insert" method="post">
							<table border="1" cellpadding="5">
								<caption>
									<h2>Insert book</h2>
								</caption>
								</c:if>
								<tr>
									<th>Title:</th>
									<td><input type="text" name="title" size="45"
										value="${book.title}"></td>
								</tr>
								<tr>
									<th>Author:</th>
									<td><input type="text" name="author" size="45"
										value="${book.author}"></td>
								</tr>
								<tr>
									<th>Price:</th>
									<td><input type="text" name="price" size="45"
										value="${book.price}"></td>
								</tr>
								<tr>
									<td colspan="2" align="center"><input type="submit"
										value="Save" /></td>
								</tr>
							</table>
						</form>
						</div>
</body>
</html>
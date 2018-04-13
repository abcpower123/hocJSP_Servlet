<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>First servlet</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>Hello World hê hê hế</h1>
<div class="Login">
<form action="LogAcc" method="get">
<label for="email">Email</label>
			<input type="email" name="email" placeholder="Input your email" id="email">
			<label for="password">Password</label>
			<input type="password" name="password" placeholder="Your password"  id="password">
			<input type="checkbox" name="remember" checked="checked" value="checked" id="checkbox">
			<label for="checkbox">Stay signed in</label>
			<input type="submit" name="submit" value="Sign in">

</form>
</div>
</body>
</html>
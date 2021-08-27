<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<meta name="description" content="dịch vụ chăm sóc khách hàng xịn">
<meta name="keywords" content="khách hàng, dịch vụ, chăm sóc">
<meta name="author" content="CuongPham">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS && JS -->
<%@ include file="/views/includes/css_js.jsp"%>
<!-- ------ -->

<title>Project Tong Hop</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->

	<div id="main">
		<div class="container">
			<div class="container-form">
				<h1 class="mt-5" style="text-align: center;">Đăng nhập</h1>
				<form action="/login" method="POST">
					<div class="form-group">
						<label>Email:</label> <input type="text" class="form-control"
							placeholder="Enter email" name="username">
					</div>
					<div class="form-group">
						<label>Password:</label> <input type="password"
							class="form-control" placeholder="Enter password" name="password">
					</div>
					<div style="text-align: center; margin-top: 20px;">
						<button type="submit" class="btn btn-primary">Login</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->

</body>

</html>
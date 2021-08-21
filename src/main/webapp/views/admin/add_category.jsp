<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- sử dụng taglibs của spring để bind-data từ end-point trả về -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/all.css">
<link rel="stylesheet" href="/css/home.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/js/all.js"></script>

<title>Document</title>
</head>

<body>
	<div id="header">
		<nav class="navbar navbar-expand-sm container">

			<a class="navbar-brand" href="/"><img class="logo"
				src="/img/logo.png" alt="logo"></a>

			<ul class="navbar-nav">
				<div class="nav-left" style="display: flex; align-items: center;">
					<li class="nav-item"><a class="nav-link" href="/contact.html">Liên
							hệ</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Sản phẩm </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Hãng A</a> <a
								class="dropdown-item" href="#">Hãng B</a> <a
								class="dropdown-item" href="#">Hãng C</a>
						</div></li>
				</div>
				<div class="nav-center" style="display: flex;">
					<form class="form-inline" action="#"
						style="width: 100%; position: relative;">
						<input class="form-control mr-sm-2" type="text"
							placeholder="Search">
						<button class="btn" type="submit">
							<i class="fas fa-search"></i>
						</button>
					</form>
				</div>

				<div class="nav-right" style="display: flex; align-items: center;">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbardrop"
						data-toggle="dropdown"> Tài khoản </a>
						<div class="dropdown-menu">
							<a class="dropdown-item" href="#">Login</a>
						</div></li>
					<li class="nav-item"><a class="nav-link"
						style="position: relative;" href="#"><img class="cart"
							src="/img/cart.png" alt="cart"><span class="count-item">0</span></a>
					</li>
				</div>
			</ul>
		</nav>
	</div>

	<div id="main">
		<div class="container mt-5">
			<div class="contact-form">
				<form:form modelAttribute="category" action="/admin/add-category"
					method="POST">

					<div class="form-group">
						<label>Tên danh mục:</label>
						<form:input type="text" class="form-control"
							placeholder="Enter name" path="name" />
					</div>

					<button type="submit" class="btn btn-primary">Submit</button>
				</form:form>
			</div>

		</div>

	</div>

	<div id="footer">
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<h4>THỜI TRANG TÚI XÁCH</h4>
				</div>
				<div class="col-md-3">
					<h4>SẢN PHẨM</h4>
					<ul>
						<a href="#">
							<li>Hãng A</li>
						</a>
						<a href="#">
							<li>Hãng A</li>
						</a>
						<a href="#">
							<li>Hãng A</li>
						</a>
					</ul>
				</div>

				<div class="col-md-4">
					<h4>LIÊN HỆ</h4>
					<ul>
						<a href="#">
							<li><i class="fas fa-envelope"></i>&emsp;phamcuongth2000@gmail.com</li>
						</a>
						<a href="#">
							<li><i class="fas fa-phone"></i>&emsp;214141414</li>
						</a>
						<a href="#">
							<li><i class="fas fa-map-marker-alt"></i>&emsp;19A Xa La Hà
								Nội</li>
						</a>
					</ul>
				</div>

				<hr>
				<div class="footer-copyright text-center py-3" style="width: 100%;">
					©
					<script>
						var now = new Date();
						document.write(now.getFullYear());
					</script>
					Copyright: <a href="https://www.facebook.com/cuongphamptit999/">
						CuongPham.com</a>
				</div>
			</div>
		</div>
	</div>


</body>

</html>
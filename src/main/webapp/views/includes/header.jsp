<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
	<nav class="navbar navbar-expand-sm container">

		<a class="navbar-brand" href="/"><img class="logo"
			src="/img/logo.png" alt="logo"></a>

		<ul class="navbar-nav">
			<div class="nav-left" style="display: flex; align-items: center;">
				<li class="nav-item"><a class="nav-link" href="#">Liên
						hệ</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#" id="navbardrop"
					data-toggle="dropdown"> Sản phẩm </a>
					<div class="dropdown-menu">
						<a class="dropdown-item" href="/all-product">Tất cả</a>
						<c:forEach var="category" items="${categories }">
							<a class="dropdown-item" href="/all-product/${category.slug }">${category.name }</a>
						</c:forEach>
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
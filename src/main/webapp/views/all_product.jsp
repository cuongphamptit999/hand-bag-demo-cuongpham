<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS && JS -->
<%@ include file="/views/includes/css_js.jsp"%>
<link rel="stylesheet" type="text/css" href="/css/all_product.css">
<!-- ------ -->

<title>Document</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->


	<!-- MAIN -->
	<div id="main">
		<div class="container all-items">
			<div class="filter">
				<span class="title-x">FILTER ITEM</span>
				<div class="category">
					<span class="title">CATEGORY</span>
					<ul class="list-unstyled">
						<c:forEach var="category" items="${categories }">
							<li><a href="/all-product/${category.slug }"><i
									class="fas fa-angle-double-right"></i> ${category.name }</a></li>
							<li>
						</c:forEach>
					</ul>
				</div>

				<div class="about-price">
					<span class="title">PRICE</span>
					<ul class="list-unstyled">
						<c:choose>
							<c:when test="${empty price }">
								<li><a href="/all-product/filter-by-price/under-$100"><i
										class="far fa-square"></i> Under $100</a></li>
								<li><a href="/all-product/filter-by-price/$100-$500"><i
										class="far fa-square"></i> $100 - $500</a></li>
								<li><a href="/all-product/filter-by-price/over-$500"><i
										class="far fa-square"></i> Over $500</a></li>
							</c:when>

							<c:when test="${price == 'under-$100' }">
								<li><a href="/all-product"><i
										class="far fa-check-square"></i> Under $100</a></li>
							</c:when>

							<c:when test="${price == '$100-$500' }">
								<li><a href="/all-product"><i
										class="far fa-check-square"></i> $100 - $500</a></li>
							</c:when>

							<c:when test="${price == 'over-$500' }">
								<li><a href="/all-product"><i
										class="far fa-check-square"></i> Over $500</a></li>
							</c:when>

						</c:choose>

					</ul>
				</div>
			</div>

			<div class="product-list">
				<div class="list-sort">
					<c:choose>
						<c:when test="${empty sortPrice }">
							<select id="sort-select" onchange="location.href=this.value">
								<option value="">Sort by</option>
								<option value="/all-product/sort-by-price/low-to-high">Price (low to high)</option>
								<option value="/all-product/sort-by-price/high-to-low">Price (high to low)</option>
							</select>
						</c:when>
						
						<c:when test="${sortPrice == 'low-to-high' }">
							<select id="sort-select" onchange="location.href=this.value">
								<option value="">Sort by</option>
								<option value="/all-product/sort-by-price/low-to-high" selected>Price (low to high)</option>
								<option value="/all-product/sort-by-price/high-to-low">Price (high to low)</option>
							</select>
						</c:when>
						
						<c:when test="${sortPrice == 'high-to-low' }">
							<select id="sort-select" onchange="location.href=this.value">
								<option value="">Sort by</option>
								<option value="/all-product/sort-by-price/low-to-high">Price (low to high)</option>
								<option value="/all-product/sort-by-price/high-to-low" selected>Price (high to low)</option>
							</select>
						</c:when>
					</c:choose>

				</div>
				<div class="list-item">
					<div class="row">

						<c:forEach var="product" items="${products }">
							<div class="col-md-3">
								<a href="/product-detail/${product.slug }"><img
									src="/files_product/${product.imgProducts.get(0).name }"
									alt="product"></a>
								<div class="infor" style="text-align: center;">
									<a href="/product_detail.html">
										<h6>${product.name }</h6>
									</a>
									<div class="price-buy">
										<p>$${product.price }</p>
										<a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua
											ngay</a>
									</div>
								</div>
							</div>

						</c:forEach>
					</div>
				</div>
				<div class="my-4"></div>
				<div class="list-sort">
					<div class="paging">
						<a href="#">Previous</a> <a href="#">1</a> <a href="#">2</a> <a
							href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">Next</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- ------ -->

	<div class="clear-with-height"></div>

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
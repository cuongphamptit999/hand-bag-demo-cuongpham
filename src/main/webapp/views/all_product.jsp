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

				<div class="about-brand">
					<span class="title">BRAND</span>
					<ul class="list-unstyled">
						<c:choose>
							<c:when test="${empty brand }">
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('brand', 'Vera Bradley')"><i
										class="far fa-square"></i> Vera Bradley</a></li>
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('brand', 'Nautica')"><i
										class="far fa-square"></i> Nautica</a></li>
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('brand', 'Gucci')"><i
										class="far fa-square"></i> Gucci</a></li>
							</c:when>

							<c:when test="${brand=='Vera Bradley' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('brand')"><i
										class="far fa-check-square"></i> Vera Bradley</a></li>
							</c:when>

							<c:when test="${brand=='Nautica' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('brand')"><i
										class="far fa-check-square"></i> Nautica</a></li>
							</c:when>
							<c:when test="${brand=='Gucci' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('brand')"><i
										class="far fa-check-square"></i> Gucci</a></li>
							</c:when>

						</c:choose>
					</ul>
				</div>

				<div class="about-brand">
					<span class="title">MATERIAL</span>
					<ul class="list-unstyled">
						<c:choose>
							<c:when test="${empty material }">
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('material', 'Da')"><i
										class="far fa-square"></i> Da</a></li>
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('material', 'Sắt')"><i
										class="far fa-square"></i> Sắt</a></li>
								<li><a href="javascript:void(0);"
									onclick="addUrlParameter('material', 'Gỗ')"><i
										class="far fa-square"></i> Gỗ</a></li>
							</c:when>

							<c:when test="${material=='Da' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('material')"><i
										class="far fa-check-square"></i> Da</a></li>
							</c:when>

							<c:when test="${material=='Sắt' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('material')"><i
										class="far fa-check-square"></i> Sắt</a></li>
							</c:when>

							<c:when test="${material=='Gỗ' }">
								<li><a href="javascript:void(0);"
									onclick="deleteUrlParameter('material')"><i
										class="far fa-check-square"></i> Gỗ</a></li>
							</c:when>
						</c:choose>
					</ul>
				</div>
			</div>

			<div class="product-list">
				<div class="list-sort">
					<select id="sort-select"
						onchange="addUrlParameter('sort', this.value)">
						<option value="">Sort by</option>
						<option value="low-to-high">Price (low to high)</option>
						<option value="high-to-low">Price (high to low)</option>
					</select>
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
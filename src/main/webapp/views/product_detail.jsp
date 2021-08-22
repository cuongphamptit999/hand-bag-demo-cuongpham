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
<link rel="stylesheet" type="text/css" href="/css/product_detail.css">
<!-- ------ -->

<title>Document</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->

	<div id="main">
		<div class="container">
			<div class="item-detail">
				<div class="row">
					<div class="col-md-5">
						<img src="/files_product/${product.imgProducts.get(0).name }"
							alt="product">
						<div class="list-img">
							<c:forEach var="imgProduct" items="${product.imgProducts }">
								<img src="/files_product/${imgProduct.name }" alt="product"
									onclick="selectImg('${imgProduct.name }')">
							</c:forEach>
						</div>
					</div>
					<div class="col-md-7">
						<h3>${product.name }</h3>
						${product.content }
						Giá:&emsp;
						<h2 style="display: inline-block;">$${product.price }</h2>
						<div class="btn-buy">
							<button type="button" class="btn btn-warning"
								style="width: 100%; margin-bottom: 10px;">Cho vào giỏ</button>
							<button type="button" class="btn btn-danger" style="width: 100%;">Mua
								ngay</button>
						</div>
					</div>
				</div>
			</div>

			<div class="video mt-5">
				<iframe width="100%" height="600px"
					src="https://www.youtube.com/embed/${product.video }"
					title="YouTube video player" frameborder="0"
					allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture"
					allowfullscreen></iframe>
			</div>

		</div>

	</div>
	<!-- ------ -->

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
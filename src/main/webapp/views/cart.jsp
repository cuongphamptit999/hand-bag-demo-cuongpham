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
<link rel="stylesheet" href="/css/cart.css">

<!-- ------ -->

<title>Document</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->

	<!-- MAIN -->
	<div id="main">

		<div class="container mt-5">
            <div class="row">
                <div class="col-md-8">
                    <table class="table list-sp" style="background-color: white;">
                        <thead class="thead-light">
                            <tr>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                        <c:forEach var = "cart" items="${giohang }">
                            <tr>
                                <td class="san-pham"><a href="/product_detail.html"><img src="/files_product/${cart.product.imgProducts.get(0).name }"
                                            alt="product"></a><a href="#">
                                        <h6>${cart.product.name }</h6>
                                    </a>
                                </td>
                                <td>$${cart.product.price }</td>
                                <td><input class="form-control text-center nhap-so-luong" value="${cart.amount }" type="number"
                                        min="1" style="width: 70px;"></td>
                                <td></td>
                            </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <div class="col-md-4">
                    <div class="thanh-toan">
                        <h5>Thanh toán</h5>
                        <table style="width: 100%;">
                            <tbody>
                                <tr>
                                    <td>Tạm tính:</td>
                                    <td class="tam-tinh">$${tongTien }</td>
                                </tr>
                                <tr>
                                    <td>Thành tiền:</td>
                                    <td class="thanh-tien">$${tongTien }</td>
                                </tr>
                                <tr>
                                    <td colspan="2" style="text-align: right;">(Đã bao gồm VAT)</td>
                                </tr>
                            </tbody>
                        </table>
                        <a href="/cart/finish" class="btn btn-success btn-thanh-toan"><span
                                style="font-size: 16px;font-weight: 600;">THANH TOÁN</span>
                            <span style="font-size: 12px;">Bạn phải đăng nhập để tiếp tục</span></a>
                    </div>


                </div>
            </div>

        </div>

	</div>
	<!-- --- -->

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
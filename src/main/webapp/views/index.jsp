<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!-- CSS && JS -->
	<%@ include file="/views/includes/css_js.jsp"%>
	<!-- ------ -->

    <title>Document</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->
	
	
	<!-- MAIN  -->
    <div id="banner">
        <div id="demo" class="carousel slide" data-ride="carousel">

            <!-- Indicators -->
            <ul class="carousel-indicators">
                <li data-target="#demo" data-slide-to="0" class="active"></li>
                <li data-target="#demo" data-slide-to="1"></li>
                <li data-target="#demo" data-slide-to="2"></li>
            </ul>

            <!-- The slideshow -->
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img src="/img/banner2.jpg" alt="Los Angeles">
                </div>
                <div class="carousel-item">
                    <img src="/img/banner1.jpg" alt="Chicago">
                </div>
                <div class="carousel-item">
                    <img src="/img/banner3.jpg" alt="New York">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="carousel-control-prev" href="#demo" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#demo" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>

        </div>
    </div>
    
    <!-- MAIN -->
    <div id="main">
        <div class="container">
            <h3 class="tieu-de" style="margin-top: 20px;text-align: center;">SẢN PHẨM</h3>

            <h4 class="mb-3">Wallets</h4>
            <div class="row">
            	
                <div class="col-md-3">
                    <a href="/product_detail.html"><img src="/img/ML4445651_main.jpg" alt="product"></a>
                    <div class="infor" style="text-align: center;">
                        <a href="/product_detail.html">
                            <h6>Space Jam by Fossil Lola Bunny Card Case</h6>
                        </a>
                        <div class="price-buy">
                            <p>$96</p>
                            <a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
                        </div>
                    </div>
                </div>

                
            </div>
            <h4 class="mb-3">Backpacks</h4>
            <div class="row">
                <div class="col-md-3">
                    <a href="/product_detail.html"><img src="/img/ML4445651_main.jpg" alt="product"></a>
                    <div class="infor" style="text-align: center;">
                        <a href="/product_detail.html">
                            <h6>Space Jam by Fossil Lola Bunny Card Case</h6>
                        </a>
                        <div class="price-buy">
                            <p>$96</p>
                            <a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <a href="/product_detail.html"><img src="/img/ML4445651_main.jpg" alt="product"></a>
                    <div class="infor" style="text-align: center;">
                        <a href="/product_detail.html">
                            <h6>Space Jam by Fossil Lola Bunny Card Case</h6>
                        </a>
                        <div class="price-buy">
                            <p>$96</p>
                            <a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <a href="/product_detail.html"><img src="/img/ML4445651_main.jpg" alt="product"></a>
                    <div class="infor" style="text-align: center;">
                        <a href="/product_detail.html">
                            <h6>Space Jam by Fossil Lola Bunny Card Case</h6>
                        </a>
                        <div class="price-buy">
                            <p>$96</p>
                            <a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
                        </div>
                    </div>
                </div>

                <div class="col-md-3">
                    <a href="/product_detail.html"><img src="/img/ML4445651_main.jpg" alt="product"></a>
                    <div class="infor" style="text-align: center;">
                        <a href="/product_detail.html">
                            <h6>Space Jam by Fossil Lola Bunny Card Case</h6>
                        </a>
                        <div class="price-buy">
                            <p>$96</p>
                            <a href="#"><i class="fas fa-shopping-cart"></i>&nbsp;Mua ngay</a>
                        </div>
                    </div>
                </div>

            </div>
            <div style="text-align: center; margin-top: 40px;">
                <a class="view-all" href="#"><i class="fas fa-caret-right"></i> TẤT CẢ</a>
            </div>
            
        </div>

    </div>
    <!-- --- -->
    
    <!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
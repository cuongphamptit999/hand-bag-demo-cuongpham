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

<!-- CSS && JS -->
<%@ include file="/views/includes/css_js.jsp"%>
<!-- ------ -->

<title>Document</title>
</head>

<body>
	<!-- HEADER -->
	<%@ include file="/views/includes/header.jsp"%>
	<!-- ------ -->

	<div id="main">
		<div class="container mt-5">
			<div class="contact-form">
				<form:form modelAttribute="product" action="/admin/add-product"
					enctype="multipart/form-data">
					<div class="form-group">
						<label class="required" for="txtInput">Category:</label>
						<form:select class="form-control" path="category.id">
							<form:options items="${categories}" itemValue="id"
								itemLabel="name" />
						</form:select>
					</div>
					<div class="form-group">
						<label class="required">Tên sảm phẩm:</label>
						<form:input path="name" class="form-control" />
					</div>
					<div class="form-group">
						<label class="required">Giảm giá:</label>
						<form:input path="saleoff" class="form-control" />
					</div>
					<div class="form-group">
						<label class="required">Giá bán:</label>
						<form:input path="price" class="form-control" />
					</div>

					<div class="form-group">
						<label class="required">Chất liệu:</label>
						<form:input path="material" class="form-control" />
					</div>
					<div class="form-group">
						<label class="required">Số lượng nhập:</label>
						<form:input path="amount_stock" class="form-control" />
					</div>

					<div class="form-group">
						<label class="required">Hãng sản xuất:</label>
						<form:input path="brand" class="form-control" />
					</div>

					<div class="form-group">
						<label class="required">Nội dung:</label>
						<form:textarea path="content" class="form-control"
							id="summernote"></form:textarea>
					</div>
					
					<div class="form-group">
						<label class="required">Video:</label>
						<form:input path="video" class="form-control" />
					</div>

					<div class="form-group">
						<label class="required">Hình ảnh:&ensp;</label> <input type="file"
							name="productImage" multiple="multiple" />
					</div>
					<button type="submit" class="btn btn-success">
						<i class="fas fa-download"></i> Save
					</button>
				</form:form>
				
			</div>

		</div>

	</div>

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
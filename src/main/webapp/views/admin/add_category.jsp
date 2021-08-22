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

	<!-- FOOTER -->
	<%@ include file="/views/includes/footer.jsp"%>
	<!-- ------ -->


</body>

</html>
function selectImg(nameImg) {
	var imgCurrent = document.querySelector('.col-md-5 img');
	imgCurrent.src = '/files_product/' + nameImg;
}

$(document).ready(function() {
	$("#summernote").summernote({
		placeholder: 'Nội dung chi tiết',
		tabsize: 3,
		height: 200
	});
});


function addUrlParameter(name, value) {
	var searchParams = new URLSearchParams(window.location.search);
	searchParams.set(name, value);
	window.location.search = searchParams.toString();
}

function deleteUrlParameter(name) {
	var searchParams = new URLSearchParams(window.location.search);
	searchParams.delete(name);
	window.location.search = searchParams.toString();
}

function addToCart(slug) {
	var data = {};
	data["productSlug"] = slug;

	$.ajax({
		url: "/rest/api/cart/addToCart",
		type: "post",
		contentType: "application/json", // dữ liệu gửi lên RestAPI
		// có
		// dạng là json.
		data: JSON.stringify(data), // object json -> string json

		dataType: "json", // dữ liệu từ Rest trả về là json.
		success: function(jsonResult) { // được gọi khi web-service
			alert("Bạn đã thêm hàng vào giỏ");
			$('.count-item').html(jsonResult);
		}
	});
}
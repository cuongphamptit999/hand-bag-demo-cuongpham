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
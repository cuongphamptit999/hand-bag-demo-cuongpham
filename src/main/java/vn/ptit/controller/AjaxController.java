package vn.ptit.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import vn.ptit.entities.Product;
import vn.ptit.repositories.ProductRepository;
import vn.ptit.services.ProductServices;
import vn.ptit.ultils.CartUtils;

@RestController
@RequestMapping("/rest/api")
public class AjaxController {
	@Autowired
	ProductServices productServices;

	@PostMapping(value = "/cart/addToCart")
	public ResponseEntity<Object> addToCart(@RequestBody final Map<String, Object> data, final ModelMap model,
			final HttpServletRequest request, final HttpServletResponse response) {
		HttpSession httpSession = request.getSession();
		
		String productSlug = (String) data.get("productSlug");

		Product product = productServices.getProductBySlug(productSlug).get(0);
		CartUtils.checkCart(product, request);
		CartUtils.tongTien(request);
		Integer soLuongMua = (Integer) httpSession.getAttribute("soLuongMua");
		return ResponseEntity.ok(soLuongMua);

	}
}

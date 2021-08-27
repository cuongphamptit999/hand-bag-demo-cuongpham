package vn.ptit.ultils;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import vn.ptit.entities.BoughtProduct;
import vn.ptit.entities.Product;


public class CartUtils {
	
	public static void checkCart(Product product, HttpServletRequest request) {
		String productSlug = product.getSlug();
		// 1. Lấy danh sách sản phẩm trong giỏ hàng từ Session.
		List<BoughtProduct> carts = new ArrayList<>();
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("giohang") != null) {
			carts = (List<BoughtProduct>) httpSession.getAttribute("giohang");
		}

		// 2. kiểm tra sản phẩm đã có trong giỏ hàng chưa?
		boolean isExists = false;
		for (BoughtProduct cart : carts) {
			if (cart.getProduct().getSlug().equalsIgnoreCase(productSlug)) {
				isExists = true;
				break;
			}
		}

		// 3.
		if (!isExists) { // nếu chưa có trong giỏ hàng thì thêm mới.
			BoughtProduct cart = new BoughtProduct();
			cart.setProduct(product);
			cart.setAmount(1);
			carts.add(cart);
		} else { // ngược lại cộng thêm số lượng cho sản phẩm đó.
			for (BoughtProduct cart : carts) {
				if (cart.getProduct().getSlug().equalsIgnoreCase(productSlug)) {
					cart.setAmount(cart.getAmount() + 1);
					break;
				}
			}
		}
		
		int soLuongMua=0;
		for(BoughtProduct cart: carts) {
			soLuongMua+=cart.getAmount();
		}

		httpSession.setAttribute("status", null);
		httpSession.setAttribute("giohang", carts);
		httpSession.setAttribute("soLuongMua", soLuongMua);

	}
	
	public static void tongTien(HttpServletRequest request) {
		List<BoughtProduct> carts = new ArrayList<>();
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute("giohang") != null) {
			carts = (List<BoughtProduct>) httpSession.getAttribute("giohang");
		}
		double t = 0;
		for (int i = 0; i < carts.size(); i++) {
			t += carts.get(i).getAmount()*carts.get(i).getProduct().getPrice();
		}
		httpSession.setAttribute("tongTien", t);
	}

}

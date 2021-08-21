package vn.ptit.controller.admin;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import vn.ptit.entities.ImgProduct;
import vn.ptit.entities.Product;
import vn.ptit.repositories.CategoryRepository;
import vn.ptit.repositories.ProductRepsitory;
import vn.ptit.ultils.CreateSlug;

@Controller
public class ProductController {
	@Value("${file.upload.product.path}")
	private String fileProduct;
	
	@Autowired CategoryRepository categoryRepository;
	@Autowired ProductRepsitory productRepsitory;
	
	@RequestMapping(value = { "/admin/add-product" }, method = { RequestMethod.GET })
	public String addProduct(ModelMap model, HttpServletRequest req, HttpServletResponse resp) {
		
		model.addAttribute("product", new Product());
		model.addAttribute("categories", categoryRepository.findAll());
		return "admin/add_product";
	}
	
	@RequestMapping(value = "/admin/add-product", method = RequestMethod.POST)
	public String add_laptop(@RequestParam("productImage") MultipartFile[] productImage,
			@ModelAttribute("product") Product product, ModelMap model, HttpServletRequest request,
			HttpServletResponse response) throws IllegalStateException, IOException {

		if (productImage != null && productImage.length > 0) {
			for (MultipartFile multipartFile : productImage) {
				if (multipartFile.getSize() <= 0)
					continue;
				ImgProduct imgProduct = new ImgProduct();
				imgProduct.setName(multipartFile.getOriginalFilename());
				product.addImgProduct(imgProduct);
				multipartFile.transferTo(new File(fileProduct + "/" + multipartFile.getOriginalFilename()));
			}
		}
	
		product.setSlug(new CreateSlug().createSlug(product.getName()));
		product.setDate_create(new Date());
		
		productRepsitory.save(product);

		return "admin/add_product";
	}

}

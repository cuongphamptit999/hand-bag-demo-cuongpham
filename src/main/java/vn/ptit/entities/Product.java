package vn.ptit.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_product")
public class Product {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //tự động tăng id
	@Column(name = "id")
	private int id;
	
	@Column(name = "name", nullable = false, length = 100)
	private String name;
	
	@Column(name = "saleoff", nullable = true)
	private int saleoff;
	
	@Column(name = "price", nullable = false)
	private double price;
	
	@Column(name = "date_create", nullable = false)
	private Date date_create;
	
	@Column(name = "content", nullable = false, columnDefinition = "LONGTEXT")
	private String content;
	
	@Column(name ="amount_stock", nullable = false)
	private int amount_stock;
	
	@Column(name = "brand", nullable = false, length = 100)
	private String brand;
	
	@Column(name = "material", nullable = false, length = 100)
	private String material;
	
	@Column(name = "slug", nullable = false, length = 100)
	private String slug;
	
	@Column(name = "status", nullable = true)
	private boolean status;
	
	@Column(name = "video", nullable = true)
	private String video;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "category_id")
	private Category category;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "product", fetch = FetchType.LAZY)
	private List<ImgProduct> imgProducts = new ArrayList<>();
	
	public void addImgProduct(ImgProduct imgProduct) {
		imgProducts.add(imgProduct);
		imgProduct.setProduct(this);
	}

	public void removeImgProduct(ImgProduct imgProduct) {
		imgProducts.remove(imgProduct);
		imgProduct.setProduct(null);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getSaleoff() {
		return saleoff;
	}

	public void setSaleoff(int saleoff) {
		this.saleoff = saleoff;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public Date getDate_create() {
		return date_create;
	}

	public void setDate_create(Date date_create) {
		this.date_create = date_create;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getAmount_stock() {
		return amount_stock;
	}

	public void setAmount_stock(int amount_stock) {
		this.amount_stock = amount_stock;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getSlug() {
		return slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	public boolean isStatus() {
		return status;
	}

	public void setStatus(boolean status) {
		this.status = status;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public List<ImgProduct> getImgProducts() {
		return imgProducts;
	}

	public void setImgProducts(List<ImgProduct> imgProducts) {
		this.imgProducts = imgProducts;
	}

	public String getVideo() {
		return video;
	}

	public void setVideo(String video) {
		this.video = video;
	}

}

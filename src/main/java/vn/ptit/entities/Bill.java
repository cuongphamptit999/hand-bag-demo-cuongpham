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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_bill")
public class Bill {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //tự động tăng id
	@Column(name = "id")
	private int id;
	
	@Column(name = "dateCreate", nullable = false)
	private Date dateCreate;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private UserInfo user;
	
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "bill", fetch = FetchType.EAGER)
	private List<BoughtProduct> boughtProducts = new ArrayList<>();
	
	public void addBoughtProduct(BoughtProduct boughtProduct) {
		boughtProducts.add(boughtProduct);
		boughtProduct.setBill(this);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDateCreate() {
		return dateCreate;
	}

	public void setDateCreate(Date dateCreate) {
		this.dateCreate = dateCreate;
	}

	public UserInfo getUser() {
		return user;
	}

	public void setUser(UserInfo user) {
		this.user = user;
	}
	
	
}

package vn.ptit.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import vn.ptit.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product, Integer>{
//	@Query("select p from Product p where p.category.id = ?1")
//    List<Product> searchProductByCategoryId(int id);
	
	@Query(value = "select * from tbl_product where category_id = ?1", nativeQuery = true)
	List<Product> searchProductByCategoryId(int id);

}

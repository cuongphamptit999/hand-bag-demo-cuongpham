package vn.ptit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.ptit.entities.Product;

@Repository
public interface ProductRepsitory extends JpaRepository<Product, Integer>{

}

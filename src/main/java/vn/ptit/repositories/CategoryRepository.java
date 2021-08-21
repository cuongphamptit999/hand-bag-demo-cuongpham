package vn.ptit.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import vn.ptit.entities.Category;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
	
}

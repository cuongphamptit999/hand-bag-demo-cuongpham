package vn.ptit.services;

import java.util.Collections;
import java.util.Comparator;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import vn.ptit.entities.Product;
import vn.ptit.repositories.ProductRepository;
import vn.ptit.ultils.FilterMap;

@Service
public class ProductServices {
	@PersistenceContext
	EntityManager entityManager;

	@Autowired
	ProductRepository productRepsitory;

	@SuppressWarnings("unchecked")
	public List<Product> searchProductByIdCate(int id) {

		String jpql = "select p from Product p where p.category.id = " + id;

		Query query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}

	public List<Product> searchProductByIdCateSortName(int id) {

		List<Product> list = productRepsitory.searchProductByCategoryId(id);
		Collections.sort(list, new Comparator<Product>() {

			@Override
			public int compare(Product o1, Product o2) {

				return o1.getName().compareToIgnoreCase(o2.getName());
			}
		});

		return list;
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProductBySlugCate(String slug, List<FilterMap> list) {

		String jpql = "select p from Product p";
		if (!slug.isEmpty()) {
			jpql += " where p.category.slug = '" + slug + "'";
		}

		for (FilterMap filterMap : list) {
			if (filterMap.getKey().equalsIgnoreCase("sort")) {
				if (filterMap.getValue().equalsIgnoreCase("low-to-high")) {
					jpql += " order by p.price asc";
				} else
					jpql += " order by p.price desc";

			} else
				jpql += " and p." + filterMap.getKey() + "='" + filterMap.getValue() + "'";
		}

		Query query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProductByPrice(String price) {

		String jpql = "select p from Product p";
		if (!price.isEmpty() && price.equalsIgnoreCase("under-$100")) {
			jpql += " where p.price <= 100";
		}

		else if (!price.isEmpty() && price.equalsIgnoreCase("$100-$500")) {
			jpql += " where p.price > 100 and p.price <= 500";
		}

		else if (!price.isEmpty() && price.equalsIgnoreCase("over-$500")) {
			jpql += " where p.price > 500";
		}

		Query query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Product> searchProductBySortPrice(String price) {

		String jpql = "select p from Product p";
		if (!price.isEmpty() && price.equalsIgnoreCase("low-to-high")) {
			Query query = entityManager.createQuery(jpql, Product.class);
			List<Product> list = query.getResultList();
			Collections.sort(list, new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {

					return Double.compare(o1.getPrice(), o2.getPrice());
				}
			});
			return list;
		}

		else if (!price.isEmpty() && price.equalsIgnoreCase("high-to-low")) {
			Query query = entityManager.createQuery(jpql, Product.class);
			List<Product> list = query.getResultList();
			Collections.sort(list, new Comparator<Product>() {

				@Override
				public int compare(Product o1, Product o2) {

					return Double.compare(o2.getPrice(), o1.getPrice());
				}
			});
			return list;
		}

		return null;
	}

	@SuppressWarnings("unchecked")
	public List<Product> getProductBySlug(String slug) {

		String jpql = "select p from Product p";
		if (!slug.isEmpty()) {
			jpql += " where p.slug = '" + slug + "'";
		}

		Query query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public List<Product> findProduct(List<FilterMap> list) {

		String jpql = "select p from Product p where 1=1";
		for (FilterMap filterMap : list) {
			if (filterMap.getKey().equalsIgnoreCase("sort")) {
				if (filterMap.getValue().equalsIgnoreCase("low-to-high")) {
					jpql += " order by p.price asc";
				} else
					jpql += " order by p.price desc";

			} else
				jpql += " and p." + filterMap.getKey() + "='" + filterMap.getValue() + "'";
		}

		Query query = entityManager.createQuery(jpql, Product.class);
		return query.getResultList();
	}

}

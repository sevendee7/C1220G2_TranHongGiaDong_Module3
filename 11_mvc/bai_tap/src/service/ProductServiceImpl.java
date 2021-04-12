package service;

import model.Product;
import sun.reflect.generics.tree.Tree;

import java.util.*;

public class ProductServiceImpl implements ProductService {

    private static Map<Integer, Product> products;

    static {
        products = new TreeMap<>();
        products.put(1, new Product(1, "Inspiron", "Dell", 900.59));
        products.put(2, new Product(2, "Mac Book Air", "Apple", 1900.59));
        products.put(3, new Product(3, "Think Pad", "Lenovo", 1200.59));
        products.put(4, new Product(4, "Vaio", "Sony", 700.59));
        products.put(5, new Product(5, "Asus", "Tuf Gaming", 1150.59));
    }
    @Override
    public List<Product> findAll() {
        return new ArrayList<>(products.values());
    }

    @Override
    public void save(Product product) {
        products.put(product.getId(), product);
    }

    @Override
    public Product findById(int id) {
        return products.get(id);
    }

    @Override
    public void update(int id, Product product) {
        products.put(id,product);
    }

    @Override
    public void remove(int id) {
        products.remove(id);
    }
}

package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.ProductCost;
import vn.edu.hcmuaf.fit.dao.ProductCostDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductCostService {
    private ProductCostDAO dao = new ProductCostDAO();

    public List<ProductCost> getAll() throws Exception {
        List<ProductCost> result = new ArrayList<ProductCost>();
        List<Map<String, Object>> productCost = dao.getAll();
        for (Map<String, Object> map : productCost) {
            result.add(convertMapToProductCost(map));
        }
        return result;
    }

    public List<ProductCost> getByProductId(int id) {
        List<Map<String, Object>> productCost = dao.getByProductId(id);
        List<ProductCost> result = new ArrayList<ProductCost>();
        for (Map<String, Object> map : productCost) {
            result.add(convertMapToProductCost(map));
        }
        return result;
    }

    public void insert(ProductCost productCost) {
        dao.insert(productCost.getProduct_id(), productCost.getSize(), productCost.getPrice());
    }

    public void update(ProductCost productCost) throws Exception {
        dao.update(productCost.getId(), productCost.getSize(), productCost.getPrice());
    }

    public void updateByProductId(ProductCost productCost) throws Exception {
        int product_id = productCost.getProduct_id();
        dao.updateByProductId(productCost.getId(), productCost.getSize(), productCost.getPrice());
    }


    public void delete(int id) throws Exception {
        dao.delete(id);
    }

    public void deleteByProductId(int product_id) {
        dao.deleteByProductId(product_id);
    }

    public ProductCost getById(Integer id) {
        return convertMapToProductCost(dao.getById(id));
    }

    public ProductCost convertMapToProductCost(Map<String, Object> map) {
        ProductCost productCost = new ProductCost();
        productCost.setId((Integer) map.get("id"));
        productCost.setProduct_id((Integer) map.get("product_id"));
        productCost.setSize((String) map.get("size"));
        productCost.setPrice((Float) map.get("price"));
        return productCost;
    }

    public static void main(String[] args) throws Exception {
        System.out.println(new ProductCostService().getAll());
    }
}

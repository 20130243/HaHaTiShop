package vn.edu.hcmuaf.fit.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import vn.edu.hcmuaf.fit.bean.Image;
import vn.edu.hcmuaf.fit.bean.PriceSize;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.dao.ProductDAO;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ProductService {

    private final ProductDAO dao = new ProductDAO();
    private final ImageService image_service = new ImageService();
    private final PriceSizeService price_size_service = new PriceSizeService();
    private final ToppingService topping_service = new ToppingService();

    public List<Product> getAll() {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getAll();
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getPagingProduct(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProduct(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }

    public List<Product> getPagingProductAdmin(int index) {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.pagingProductAdmin(index);
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }

    public List<Product> sortASC(List<Product> listProducts) {
        listProducts.sort((o1, o2) -> (int) (o1.getPriceSize().get(0).getPrice() - o2.getPriceSize().get(0).getPrice()));
        return listProducts;
    }

    public List<Product> sortDECS(List<Product> listProducts) {
        listProducts.sort((o1, o2) -> (int) (o2.getPriceSize().get(0).getPrice() - o1.getPriceSize().get(0).getPrice()));
        return listProducts;
    }


    public Product getById(int id) {
        Map<String, Object> product = dao.getById(id);
        List<PriceSize> priceSizeList = price_size_service.getByProductId((Integer) product.get("id"));
        return new Product((Integer) product.get("id"), (String) product.get("name"), (Integer) product.get("category_id"),
                priceSizeList, image_service.getByProductId((Integer) product.get("id")), (Integer) product.get("status"),
                topping_service.getByCategoryId((Integer) product.get("category_id")));
    }

    public int getTotalProduct() {
        return dao.getTotalProduct();
    }

    public int getPriceSizeM(int id) throws Exception {
        return (int) getById(id).getPriceSize().get(0).getPrice();
    }

    public int getPriceSizeL(int id) throws Exception {
        try {
            return (int) getById(id).getPriceSize().get(1).getPrice();
        } catch (Exception e) {
            return getPriceSizeM(id);
        }
    }

    public PriceSize getSizeM(int id) throws Exception {
        return getById(id).getPriceSize().get(0);
    }

    public PriceSize getSizeL(int id) throws Exception {
        try {
            return getById(id).getPriceSize().get(1);
        } catch (Exception e) {
            return getSizeM(id);
        }
    }


    public List<Product> searchProducts(String search, String category) {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getSearchProducts(search, category);
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getProductByCategory(int id_category) {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductByCategory(id_category);
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }

    public List<Product> getProductSale() {
        List<Product> list = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductSale();
        for (Map<String, Object> map : productList) {
            list.add(convertMapToProduct(map));
        }
        return list;
    }


    public List<Product> getProductNew() {
        List<Product> rs = new ArrayList<Product>();
        List<Map<String, Object>> productList = dao.getProductNew();
        for (Map<String, Object> map : productList) {
            rs.add(convertMapToProduct(map));
        }
        return rs;
    }


    public void delete(int id) {
        dao.updateStatus(id, 3);
    }

    public void insert(Product product)  {
        dao.insert(product.getName(), product.getIdCategory(), product.getStatus());
        //insert image
        List<Image> images = product.getImage();
        for (Image image : images) {
            image.setProduct_id(findFirst().getId());
        }
        images.get(0).setStatus(1);
        image_service.insert(images);
        //insert price
        for (PriceSize priceSize : product.getPriceSize()) {
            priceSize.setProduct_id(findFirst().getId());
            (new PriceSizeService()).insert(priceSize);
        }
    }

    public Product findFirst()  {
        Map<String, Object> product = dao.findFirst();
        List<PriceSize> priceSizeList = new PriceSizeService().getByProductId((Integer) product.get("id"));
        return new Product((Integer) product.get("id"), (String) product.get("name"), (Integer) product.get("category_id"),
                priceSizeList, image_service.getByProductId((Integer) product.get("id")), (Integer) product.get("status"), topping_service.getByCategoryId((Integer) product.get("category_id")));

    }

    public void update(Product product) throws Exception {
        dao.update(product.getId(), product.getName(), product.getIdCategory(), product.getStatus());
        image_service.update(product.getImage());
        for (PriceSize priceSize : product.getPriceSize()) {
            (new PriceSizeService()).updateByProductId(priceSize);
        }
    }
    public boolean checkInventoryProduct(int proid){
        return dao.checkInventoryProduct(proid);
    }

    public Product convertMapToProduct(Map<String, Object> map) {
        Product product = new Product();
        product.setId((Integer) map.get("id"));
        product.setName((String) map.get("name"));
        product.setIdCategory((Integer) map.get("category_id"));
        product.setImage(image_service.getByProductId((Integer) map.get("id")));
        product.setStatus((Integer) map.get("status"));

        List<PriceSize> priceSizeList = price_size_service.getByProductId((Integer) map.get("id"));
        product.setPriceSize(priceSizeList);

        product.setTopping(topping_service.getByCategoryId((Integer) map.get("category_id")));

        return product;
    }

    public static void main(String[] args) throws Exception {

        new ProductService().getById(96);

    }
}

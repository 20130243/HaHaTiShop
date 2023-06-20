package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.db.JDBIConnector;

import java.util.List;
import java.util.Map;

public class PriceSizeDAO extends RD {
    private static final String tableName = "product_size";

    @Override
    public List<Map<String, Object>> getAll() {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName)
                        .mapToMap()
                        .list()
        );
    }

    @Override
    public Map<String, Object> getById(int id) {
        List<Map<String, Object>> priceSizeList = getAll();
        for (Map<String, Object> product_size : priceSizeList) {
            if ((int) product_size.get("id") == id) {
                return product_size;
            }
        }
        return null;
    }

    public List<Map<String, Object>> getByProductId(int id) {
        return JDBIConnector.get().withHandle(h ->
                h.createQuery("SELECT * FROM " + tableName + " WHERE product_id =:product_id")
                        .bind("product_id", id)
                        .mapToMap()
                        .list()
        );
    }

    public void insert(int product_id, String name, float original_price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("INSERT INTO " + tableName + "(product_id,name,original_price,price) VALUES(:product_id,:name,:original_price,:price)")
                        .bind("name", name)
                        .bind("original_price", original_price)
                        .bind("product_id", product_id)
                        .bind("price", original_price)
                        .execute()
        );
    }

    public void update(int id, String name, float price, float original_price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET name=:name,price=:price,original_price:=original_price WHERE id=:id")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("id", id)
                        .bind("original_price", original_price)
                        .execute());
    }

    public void updateByProductId(int product_id, String name, float price, float original_price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET price=:price,original_price:=original_price WHERE product_id=:product_id AND name=:name")
                        .bind("name", name)
                        .bind("price", price)
                        .bind("product_id", product_id)
                        .bind("original_price", original_price)
                        .execute());
    }

    public void updatePriceSale(int id, float price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET price=:price WHERE id=:id")
                        .bind("price", price)
                        .bind("id", id)
                        .execute());

    }

    public void updateoriginal_price(int id, float original_price) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("UPDATE " + tableName + " SET original_price=:original_price WHERE id=:id")
                        .bind("original_price", original_price)
                        .bind("id", id)
                        .execute());
    }

    public void deleteByProductId(int product_id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE product_id=:product_id")
                        .bind("product_id", product_id)
                        .execute());
    }

    @Override
    public void delete(int id) {
        JDBIConnector.get().withHandle(h ->
                h.createUpdate("DELETE FROM " + tableName + " WHERE id=:id")
                        .bind("id", id)
                        .execute()
        );
    }


    public static void main(String[] args) {
    }
}
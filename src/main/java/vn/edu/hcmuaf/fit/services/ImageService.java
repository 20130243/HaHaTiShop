package vn.edu.hcmuaf.fit.services;

import vn.edu.hcmuaf.fit.bean.Image;
import vn.edu.hcmuaf.fit.dao.ImageDAO;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ImageService {
    private final ImageDAO dao = new ImageDAO();

    public List<Image> getAll() throws SQLException {
        List<Image> list = new ArrayList<Image>();
        List<Map<String, Object>> imageList = dao.getAll();
        for (Map<String, Object> map : imageList) {
            list.add(new Image((int) map.get("id"),
                    (String) map.get("name"),
                    (String) map.get("url"), (Integer) map.get("product_id)"),
                    (Integer) map.get("status")));
        }
        return list;
    }

    public List<Image> getByProductId(int productId) {
        List<Image> list = new ArrayList<Image>();
        List<Map<String, Object>> imageList = dao.getByProductId(productId);
        for (Map<String, Object> map : imageList) {
            list.add(new Image((int) map.get("id"),
                    (String) map.get("name"),
                    (String) map.get("url"),
                    (int) map.get("product_id"),
                    (int) map.get("status")));
        }
        return list;
    }

    public void insert(List<Image> list) {
        for (Image image : list) {
            dao.insert(image.getName(), image.getUrl(), image.getProductId(), image.getStatus());
        }
    }

    public void update(List<Image> list) {
        deleteByProductId(list.get(0).getProductId());
        insert(list);
    }

    public void deleteByProductId(int productId) {
        dao.deleteByProductId(productId);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public static void main(String[] args) {
        System.out.println(new ImageService().getByProductId(4));
    }
}

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
            list.add(convertToImage(map));
        }
        return list;
    }

    public Image getById(int id) throws SQLException {
        return convertToImage(dao.getById(id));
    }

    public List<Image> getByProductId(int product_id) {
        List<Image> list = new ArrayList<Image>();
        List<Map<String, Object>> imageList = dao.getByProductId(product_id);
        for (Map<String, Object> map : imageList) {
            list.add(convertToImage(map));
        }
        return list;
    }

    public void insert(List<Image> list) {
        for (Image image : list) {
            dao.insert(image.getName(), image.getUrl(), image.getProduct_id(), image.getStatus());
        }
    }

    public void update(List<Image> list) {
        System.out.println(list);
        if (list.size() > 0) {
            for (Image image : list) {
                if (image.getStatus() == -1) {
                    delete(image);
                } else if (image.getStatus() == 1) {
                    setThumbnail(image);
                } else if (image.getStatus() == 3)
                    dao.insert(image.getName(), image.getUrl(), image.getProduct_id(), 0);
            }
        }
    }

    public void setThumbnail(Image image) {
        System.out.println(image);
        dao.resetThumbnail(image.getProduct_id());
        System.out.println();
        dao.updateStatus(image.getId(), 1);
    }

    public void deleteByproduct_id(int product_id) {
        dao.deleteByProductId(product_id);
    }

    public void delete(int id) {
        dao.delete(id);
    }

    public void delete(Image image) {
        dao.delete(image.getId());
    }

    public Image convertToImage(Map<String, Object> map) {
        return new Image((int) map.get("id"),
                (String) map.get("name"),
                (String) map.get("url"),
                (int) map.get("product_id"),
                (int) map.get("status"));
    }

    public static void main(String[] args) {
        System.out.println(new ImageService().getByProductId(4));
    }
}

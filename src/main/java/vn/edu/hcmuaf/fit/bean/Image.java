package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;

public class Image implements Serializable {
    int id;
    String name;
    String url;
    int productId;
    int status;

    public Image() {
    }

    public Image(int id, String name, String url, int productId, int status) {
        this.id = id;
        this.name = name;
        this.url = url;
        this.productId = productId;
        this.status = status;
    }

    public int getProductId() {
        return productId;
    }

    public void setProductId(int productId) {
        this.productId = productId;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Image{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", url='" + url + '\'' +
                ", productId=" + productId +
                ", status=" + status +
                '}';
    }
}

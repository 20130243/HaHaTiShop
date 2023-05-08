package vn.edu.hcmuaf.fit.bean;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Cart implements Serializable {
    private int id;
    private User customer;
    private List<Item> items;
    private int status;
    private float totalMoney;

    private float priceSale;

    private Coupon coupon;

    public Cart() {
        this.status = 0;
        this.totalMoney = 0;
        this.priceSale = 0;
        this.coupon = null;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getCustomer() {
        return customer;
    }

    public void setCustomer(User customer) {
        this.customer = customer;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public float getTotalMoney() {
        return totalMoney;
    }

    public void setTotalMoney(float totalMoney) {
        if(this !=null) {
            if(this.totalMoney < 0) {
                this.totalMoney = 0;
            }
        }
        this.totalMoney = totalMoney;
    }

    public float getPriceSale() {
        return priceSale;
    }

    public void setPriceSale(float priceSale) {
        if(this.priceSale < 0) {
            this.priceSale = 0;
        }
        this.priceSale = priceSale;
    }

    public Coupon getCoupon() {
        return coupon;
    }

    public void setCoupon(Coupon coupon) {
        this.coupon = coupon;
    }

    public void addItem(Item item) {
        if(this.items!=null){
            this.items.add(item);
        } else {
            this.items = new ArrayList<>();
            this.items.add(item);
        }
    }

    public void removeItem(Item item) {
        this.items.remove(item);
    }

    public void updateTotal() {
        float total = 0;
        if(items == null) {
            this.setTotalMoney(0);
            return;
        }
        if(items.size() == 0) {
            this.setTotalMoney(0);
        } else {
            for (int i = 0; i < items.size(); i++) {
                total += items.get(i).getPrice();
                this.setTotalMoney(total);
            }
        }
    }


    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", customer=" + customer +
                ", items=" + items +
                ", status=" + status +
                ", totalMoney=" + totalMoney +
                ", priceSale=" + priceSale +
                ", coupon=" + coupon +
                '}';
    }

}

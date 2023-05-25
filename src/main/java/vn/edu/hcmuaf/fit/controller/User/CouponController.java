package vn.edu.hcmuaf.fit.controller.User;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CouponService;

import javax.mail.Session;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;
import java.util.List;

@WebServlet(name = "coupon", value = "/coupon")
public class CouponController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        CouponService couponService = new CouponService();
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        String coupon = request.getParameter("coupon");
        User user = (User) session.getAttribute("user");
        Date currentDate = new Date(System.currentTimeMillis());
        if (user != null) {
            if (cart != null) {
                if(cart.getCoupon() == null) {
                    if (coupon != null) {
                        try {
                            List<Coupon> listCoupons = couponService.getAll();
                           boolean checkCoupon = false;
                            for (Coupon item : listCoupons) {
                                if (coupon.equals(item.getCode())) {
                                    checkCoupon = true;
                                    Coupon newCoupon = item;
                                    if (newCoupon.getQuantity() > 0
                                            && (checkEqualDate(currentDate, newCoupon.getStart_date())
                                            || currentDate.after(newCoupon.getStart_date())
                                            && (checkEqualDate(currentDate, newCoupon.getEnd_date())
                                            || currentDate.before(newCoupon.getEnd_date())))) {

                                        if (cart.getTotalMoney() >= newCoupon.getMin_price_order()) {
                                            if (cart.getCoupon() == null) {
                                                cart.setCoupon(newCoupon);
                                                float pricePercent = (float) (item.getPercent() / 100.0) * cart.getTotalMoney();
                                                if (pricePercent > item.getMax_price_sale()) {
                                                    pricePercent = item.getMax_price_sale();
                                                }
                                                cart.setTotalMoney(cart.getTotalMoney() - pricePercent);
                                                cart.setPriceSale(pricePercent);
                                                couponService.useCoupon(item);
                                                response.getWriter().write(new Gson().toJson(cart));
                                                return;
                                            }
                                        }
                                    } else {
                                        response.getWriter().write("1");
                                    }
                                }
                            }
                            if(!checkCoupon) {
                                response.getWriter().write("4");
                                return;
                            }
                        } catch (SQLException e) {
                            throw new RuntimeException(e);
                        } catch (Exception e) {
                            throw new RuntimeException(e);
                        }
                    }
                } else {
                    response.getWriter().write("3");
                }
            }
        } else {
            response.getWriter().write("2");
        }

    }

    private boolean checkEqualDate(Date date1, Date date2) {
        if (date1.compareTo(date2) == 0) {
            return true;
        }
        return false;
    }
}

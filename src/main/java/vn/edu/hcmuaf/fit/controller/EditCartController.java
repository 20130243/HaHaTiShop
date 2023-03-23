package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Coupon;
import vn.edu.hcmuaf.fit.bean.Item;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CouponService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "EditCartController", value = "/editcart")
public class EditCartController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url =(String) session.getAttribute("url");
        Cart cart = (Cart) session.getAttribute("cart");
        List<Product> listProductUnavaiable = (List<Product>) session.getAttribute("listProductUnavaiable");
        if (listProductUnavaiable ==null){
            listProductUnavaiable = new LinkedList<Product>();
            session.setAttribute("listProductUnavaiable",listProductUnavaiable);
        }
        if(cart != null) {
            String remove = request.getParameter("rpID");
            List<Item> items = cart.getItems();
            for (int i = 0; i < items.size(); i++) {
                String item_id = request.getParameter(items.get(i).getId() + "");
                if (item_id != null) {
                    int id = Integer.parseInt(item_id);
                    String quantityChange = request.getParameter("quantityChange" + id);
                    int quantity = Integer.parseInt(quantityChange);
                    if (items.get(i).getId() == id) {

                        boolean isUnavaiable = new ProductService().checkInventoryProduct(items.get(i).getProduct().getId());
                        if (isUnavaiable ==false){

                            items.get(i).setQuantity(quantity);
                            items.get(i).updatePrice();
//                            System.out.println("set quan");
                        }else{
                            //
                            listProductUnavaiable.add(items.get(i).getProduct());
//                            System.out.println("unavailble");
                            items.get(i).setQuantity(0);
                            items.get(i).updatePrice();
                        }

                    }
                } else if (remove != null) {
                    int removeId = Integer.parseInt(remove);
                    if (items.get(i).getId() == removeId) {
                        cart.removeItem(items.get(i));
                    }
                }
            }
            cart.updateTotal();
            session.setAttribute("cart", cart);
            session.setAttribute("listProductUnavaiable", listProductUnavaiable);
            response.sendRedirect(request.getContextPath() + url);
//            response.sendRedirect("/milkteashop_war/shop");
        }else {
            response.sendRedirect(request.getContextPath() + url);
        }

    }
}

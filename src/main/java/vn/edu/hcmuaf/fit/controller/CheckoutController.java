package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Item;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

@WebServlet(name = "CheckoutController", value = "/checkout")
public class CheckoutController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String url = ((HttpServletRequest) request).getRequestURI().toString();
        session.setAttribute("url", url);
        List<Product> listProductUnavaiable = (List<Product>) session.getAttribute("listProductUnavaiable");
        Cart cart = (Cart) session.getAttribute("cart");
        listProductUnavaiable = new LinkedList<Product>();
        session.setAttribute("listProductUnavaiable",listProductUnavaiable);

        if(cart != null) {
            List<Item> items = cart.getItems();
            for (int i = 0; i < items.size(); i++) {

                boolean isUnavaiable = new ProductService().checkInventoryProduct(items.get(i).getProduct().getId());
                if (isUnavaiable ==true){
                    listProductUnavaiable.add(items.get(i).getProduct());
                    items.get(i).setQuantity(0);
                    items.get(i).updatePrice();
                }
            }
        }
        cart.updateTotal();
        session.setAttribute("cart", cart);
        session.setAttribute("listProductUnavaiable", listProductUnavaiable);
        request.getRequestDispatcher("/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

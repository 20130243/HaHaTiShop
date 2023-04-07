package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.bean.Cart;
import vn.edu.hcmuaf.fit.bean.Item;
import vn.edu.hcmuaf.fit.bean.Order;
import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.CartOrderService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "OrderController", value = "/order")
public class OrderController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("checkout").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        User user = (User) session.getAttribute("user");
        CartOrderService cartOrderService = new CartOrderService();
        if (cart != null && user != null) {
            String nameUser = request.getParameter("nameUser");
            String phoneUser = request.getParameter("phoneUser");
            String addressUser = request.getParameter("addressUser");
            String noteUser = request.getParameter("noteUser");
            if(nameUser.equals("") || phoneUser.equals("") || addressUser.equals("")) {
                request.setAttribute("addressUser", nameUser);
                request.setAttribute("noteUser", noteUser);
                response.getWriter().write("1");
                return;
            } else {
                Order order = new Order();
                order.setUser_id(user.getId());
                order.setName(nameUser);
                order.setPhone(phoneUser);
                order.setAddress(addressUser);
                order.setNote(noteUser);
                List<Item> listItems = cart.getItems();
                order.setListItems(listItems);
                order.setCoupon(cart.getCoupon());
                order.setTotal(cart.getTotalMoney());
                try {
                    cartOrderService.addOrder(order);
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                session.removeAttribute("cart");
                response.getWriter().write("0");
                return;
            }
        } else if(user == null){
            response.getWriter().write("2");
        }
    }
}

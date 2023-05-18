package vn.edu.hcmuaf.fit.controller.User;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import vn.edu.hcmuaf.fit.bean.*;
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
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Cart cart = (Cart) session.getAttribute("cart");
        List<Product> listProductUnavaiable = (List<Product>) session.getAttribute("listProductUnavaiable");
        listProductUnavaiable = new LinkedList<Product>();
        session.setAttribute("listProductUnavaiable", listProductUnavaiable);
        JsonArray jsonArray = new JsonArray();
        String remove = request.getParameter("removeProduct");

        if (cart != null) {
            List<Item> items = cart.getItems();
            for (int i = 0; i < items.size(); i++) {
                if(remove != null) {
                    int removeId = Integer.parseInt(remove);
                    if (items.get(i).getId() == removeId) {
                        cart.removeItem(items.get(i));
                        cart.updateTotal();
                    }
                } else {
                    String item_id = request.getParameter(items.get(i).getId() + "");
                    if (item_id != null) {
                        int id = Integer.parseInt(item_id);
                        String quantityChange = request.getParameter("quantityChange" + id);
                        int quantity = Integer.parseInt(quantityChange);
                        if (items.get(i).getId() == id) {
                            boolean isUnavaiable = new ProductService().checkInventoryProduct(items.get(i).getProduct().getId());
                            if (isUnavaiable == false) {
                                items.get(i).setQuantity(quantity);
                                items.get(i).updatePrice();
                            } else {
                                listProductUnavaiable.add(items.get(i).getProduct());
                                items.get(i).setQuantity(0);
                                items.get(i).updatePrice();
                            }

                        }
                        cart.updateTotal();

                }

                }

            }
            if(remove == null) {
                for(int i = 0; i < items.size(); i++) {
                    JsonObject jsonObject = new JsonObject();
                    jsonObject.addProperty("id",items.get(i).getId());
                    jsonObject.addProperty("price",items.get(i).getPrice());
                    jsonObject.addProperty("priceCart",cart.getTotalMoney());
                    jsonArray.add(jsonObject);
                }
                response.getWriter().write(jsonArray.toString());

            } else {
                response.getWriter().write("remove"+"|"+ remove+"|"+ cart.getTotalMoney());
            }
            session.setAttribute("cart", cart);
            session.setAttribute("listProductUnavaiable", listProductUnavaiable);


        }
    }
}

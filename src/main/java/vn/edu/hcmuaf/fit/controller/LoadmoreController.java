package vn.edu.hcmuaf.fit.controller;

import com.google.gson.Gson;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;



@WebServlet(name = "load", value = "/load")
public class LoadmoreController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        ProductService productService = new ProductService();

        List<Product> products = productService.getPagingProduct(2);

        response.getWriter().write(new Gson().toJson(products));


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

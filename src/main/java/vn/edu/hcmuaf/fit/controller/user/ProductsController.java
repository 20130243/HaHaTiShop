package vn.edu.hcmuaf.fit.controller.user;

import vn.edu.hcmuaf.fit.bean.Category;
import vn.edu.hcmuaf.fit.bean.Product;
import vn.edu.hcmuaf.fit.services.CategoryService;
import vn.edu.hcmuaf.fit.services.ProductService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "listProducts", value = "/shop")
public class ProductsController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String url = request.getRequestURI();

        String hideSticky = request.getParameter("hideSticky");
        CategoryService categoryService = new CategoryService();
        List<Category> listCategories = categoryService.getAll();
        listCategories.add(0, new Category(0,"Tất cả",0));
        ProductService productService;

        List<Product> listProduct;
        try {
            productService = new ProductService();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

        if (hideSticky == null || !hideSticky.equals("1")) {
            String indexPage = request.getParameter("index");
            int index;
            if(indexPage == null) {
                index = 1;
            } else {
                index = Integer.parseInt(indexPage);
            }

            listProduct = productService.getPagingProduct(index);

            int count = productService.getTotalProduct();
            int endPage = count/12;
            if(count % 12 != 0) {
                endPage++;
            }
            request.setAttribute("sort", "");
            request.setAttribute("endPage", endPage);
            request.setAttribute("pageIndex", index);
            session.setAttribute("url", url+"?"+request.getQueryString());

        } else {


            String search = request.getParameter("search");
            String category =  request.getParameter("category");
            String sort = request.getParameter("sort");
            String categoryId = "";
            if(!category.equals("Tất cả")) {
                categoryId =  String.valueOf(categoryService.getByName(category).getId());
            }

            listProduct = productService.searchProducts(search, categoryId);

           if(sort.equals("price-asc")) {
               listProduct = productService.sortASC(listProduct);
           } else if(sort.equals("price-desc")) {
               listProduct = productService.sortDECS(listProduct);
           }
            request.setAttribute("endPage", 0);
            request.setAttribute("pageIndex", 0);
            request.setAttribute("sort", sort);

            session.setAttribute("url", url+"?"+request.getQueryString());
        }
        request.setAttribute("listProduct", listProduct);
        request.setAttribute("hideSticky" , hideSticky);
        request.setAttribute("listCategories", listCategories);
        request.getRequestDispatcher("shop.jsp").forward(request, response);


    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

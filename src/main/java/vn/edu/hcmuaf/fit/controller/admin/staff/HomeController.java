package vn.edu.hcmuaf.fit.controller.admin.staff;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.bean.Blog;
import vn.edu.hcmuaf.fit.services.AdminService;
import vn.edu.hcmuaf.fit.services.BlogService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "Staff", value = "/admin/staff")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int index = page == null ? 1 : Integer.parseInt(page);
        AdminService adminService = new AdminService();
        int count = adminService.getTotal();
        int endPage = count/10;
        if(count % 10 != 0) {
            endPage++;
        }

        List<Admin> adminList = adminService.getPaging(index);

        request.setAttribute("adminList", adminList);
        request.setAttribute("endPage", endPage);
        System.out.println(endPage);
        if (!response.isCommitted()) request.getRequestDispatcher("staff/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

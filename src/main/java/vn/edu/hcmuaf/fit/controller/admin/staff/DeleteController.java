package vn.edu.hcmuaf.fit.controller.admin.staff;

import vn.edu.hcmuaf.fit.bean.Admin;
import vn.edu.hcmuaf.fit.services.AdminService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Staff delete", value = "/admin/staff/delete")
public class DeleteController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!response.isCommitted())   response.sendRedirect("./Error404");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Admin admin = (Admin) session.getAttribute("admin");
        int id = Integer.parseInt(request.getParameter("id"));
        AdminService adminService = new AdminService();
        try {
            adminService.logAccount(adminService.getById(id).getId(), request.getRemoteAddr(),admin.getId(),-1);
            adminService.delete(id);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
        response.sendRedirect(request.getContextPath()+"/admin/staff");
    }
}

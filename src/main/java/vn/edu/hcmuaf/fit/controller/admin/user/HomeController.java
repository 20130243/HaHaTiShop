package vn.edu.hcmuaf.fit.controller.Admin.user;

import vn.edu.hcmuaf.fit.bean.User;
import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "User", value = "/admin/user")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String page = request.getParameter("page");
        int index = page == null ? 1 : Integer.parseInt(page);

        UserService userService = new UserService();
        int count = userService.getTotal();
        int endPage = count / 10;
        if (count % 10 != 0) endPage++;

        List<User> userList = userService.getPaging(index);

        request.setAttribute("userList", userList);
        request.setAttribute("endPage", endPage);
        if (!response.isCommitted())  request.getRequestDispatcher("user/index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

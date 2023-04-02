package vn.edu.hcmuaf.fit.controller;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "forgotPassword", value = "/forgotPass")
public class ForgotPasswordController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/forgotPass.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("user-email").trim();
        UserService userService = new UserService();
        System.out.println( !email.equals("")  );
        if ( !email.equals("") ) {
            try {
                System.out.println(userService.checkEmail( email));
                if (userService.checkEmail( email)) {

                    userService.passwordRecovery( email);
                    response.getWriter().write("0");
                } else {
                    response.getWriter().write("1");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            response.getWriter().write("2");
        }
    }
}

package vn.edu.hcmuaf.fit.controller.User;

import vn.edu.hcmuaf.fit.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.Date;
import java.util.Calendar;
import java.util.TimeZone;

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
                    Calendar cal = Calendar.getInstance(TimeZone.getTimeZone("UTC"));
                    java.util.Date date = cal.getTime();
                    Date current = new java.sql.Date(date.getTime());
                    int count = userService.getCountForgetPassword(email, current );
                    System.out.println(count);
                    if(count == 0) {
                        count++;
                        System.out.println("Lần đầu " +count);
                        userService.passwordRecovery( email);
                        userService.insertCountForgetPassword(email, current);
                        response.getWriter().write("0");
                    } else {
                        if( count <= 5) {
                            count++;
                            System.out.println("các lần tiếp theo " +count);
                            userService.passwordRecovery( email);
                            userService.updateCountForgetPassword(email, current, count);
                            response.getWriter().write("0");
                        } else {
                            response.getWriter().write("3");
                        }
                    }


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

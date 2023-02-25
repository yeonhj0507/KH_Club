package userData;

 

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;

 
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import foodData.foodCtrl;
 

@WebServlet("/UserCtrl")
public class UserCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

 

    public UserCtrl() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String loginid = request.getParameter("loginid");
        String loginpw = request.getParameter("loginpw");
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();

        if(action.equals("join")) {
            String name = request.getParameter("name");
            int grade = Integer.parseInt(request.getParameter("grade"));

            int permission = 0;
            UserDO p = new UserDO(loginid, name, grade, loginpw, permission);
            try {
                dao.insert(p);
                response.sendRedirect("userPage/userLogin.jsp");
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        if(action.equals("logout")) {
        	response.sendRedirect("Main.jsp?userID="+null);
        }
        
        if(action.equals("login")) {
            UserDO p = dao.findById(loginid);
            System.out.println("로그인됨");
            if(p.pw.equals(loginpw)) {
                if(p.permission == 1) {
                	session.setAttribute("userID", loginid);
                    foodCtrl foodCtrl = new foodCtrl();
					foodCtrl.service(request, response);
				
                } else {
                    response.sendRedirect("userPage/userLogin.jsp");
                }
            } else {
                response.sendRedirect("userPage/userLogin.jsp");
            }
        }
    }

 

}
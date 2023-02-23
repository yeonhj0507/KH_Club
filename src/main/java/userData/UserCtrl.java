package userData;

 

import java.io.IOException;
import java.lang.reflect.Method;
import java.sql.SQLException;

 
import javax.servlet.http.HttpSession;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import foodData.foodCtrl;
 

/**
* Servlet implementation class UserCtrl
*/
@WebServlet("/UserCtrl")
public class UserCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

 

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserCtrl() {
        super();
        // TODO Auto-generated constructor stub
    }

 

    /**
     * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
     */
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String loginid = request.getParameter("loginid");
        String loginpw = request.getParameter("loginpw");
        UserDAO dao = new UserDAO();
        System.out.println("action: " + action);
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
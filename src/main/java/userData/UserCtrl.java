package userData;

import java.io.IOException;

import foodData.foodCtrl;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserCtrl")
public class UserCtrl extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public UserCtrl() {
        super();
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String loginid = request.getParameter("userID");
        String loginpw = request.getParameter("pw");
        UserDAO dao = new UserDAO();
        HttpSession session = request.getSession();

        if(action.equals("join")) {
            String name = request.getParameter("name");
            int grade = Integer.parseInt(request.getParameter("grade"));
            int permission = 0;
            UserDO p = new UserDO(loginid, name, grade, loginpw, permission);
            dao.insert(p);
            response.sendRedirect("userPage/userLogin.jsp");
        }
        
        if(action.equals("logout")) {
        	session.removeAttribute("userID");
        	response.sendRedirect("/foodCtrl");
        }
        
        if(action.equals("login")) {
            UserDO p = dao.getById(loginid);
//          System.out.println(p.pw);
            if(loginpw.equals(p.getPw())) {
            	System.out.println("비밀번호 일치");
            	System.out.println(loginpw);
            	System.out.println(p.getPw());
                if(p.getPermission() == 1) {
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
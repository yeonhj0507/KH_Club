package contentData;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


public class CommentCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CommentCtrl() {
        super();
    }
    
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	CommentDAO dao = new CommentDAO();
    	String action = request.getParameter("action");
    	
    	if(action.equals("write")) {
    		String comment = request.getParameter("comment");
    		int postID = Integer.parseInt(request.getParameter("postID"));
			HttpSession session = request.getSession();
            String userID = (String)session.getAttribute("userID");
            System.out.println(userID);
    		
    		CommentDO c = new CommentDO();
    		c.setComment(comment);
    		c.setPostNum(postID);
    		c.setUserID(userID);
    		dao.insert(c);
    		
    		String view = "ContentsCtrl?action=view&postID="+postID;
    		response.sendRedirect(view);
    	}
    }
}

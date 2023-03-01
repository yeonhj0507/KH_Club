package contentData;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


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
    		int postNum = request.getParameter("")
    		
    		CommentDO c = new CommentDO();
    		c.setComment(comment);
    		c.setPostNum(0);
    		
    	}
    }

}

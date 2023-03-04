package contentData;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/ContentsCtrl")
public class ContentsCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ContentsCtrl() {
        super();
    }

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ContentsDAO dao = new ContentsDAO();
		String action = request.getParameter("action");
		String view = null;
		if(action.equals("like")) {
			
		}
		
		if(action.equals("list")) {
			RequestDispatcher dispacher = request.getRequestDispatcher(contentsList(request));
			dispacher.forward(request,response);
		}
		
		if(action.equals("write")) {
			String title = request.getParameter("title");
			String content= request.getParameter("content");
			HttpSession session = request.getSession();
            String userID = (String)session.getAttribute("userID");
            
            if(title.equals("") || content==null) {
            	session.setAttribute("error", "제목이나 내용을 입력하세요");
            	view = "/contentPage/contentWrite.jsp";
            	response.sendRedirect(view);
            } else {
            	ContentsDO c = new ContentsDO();
    			c.setTitle(title);
    			c.setContent(content);
    			c.setWriter(userID);
    			dao.insert(c);
    			session.setAttribute("error", null);
    			
    			view = "/ContentsCtrl?action=list";
    			response.sendRedirect(view);
            }
		}
		
		if(action.equals("view")) {
			int postID = Integer.parseInt(request.getParameter("postID"));
			ContentsDO c = dao.getByID(postID);
			request.setAttribute("content", c);
			view = "/contentPage/contentView.jsp";
			RequestDispatcher dispacher = request.getRequestDispatcher("/contentPage/contentView.jsp");
			dispacher.forward(request, response);
		}
	}
		

	
	public String contentsList(HttpServletRequest request) {
		ContentsDAO dao = new ContentsDAO();
		List<ContentsDO> list = dao.getAll();
		
		request.setAttribute("list", list);
		return "contentPage/contentList.jsp";
	}

}

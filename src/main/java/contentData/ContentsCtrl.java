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
		
		if(action.equals("list")) {
			RequestDispatcher dispacher = request.getRequestDispatcher(contentsList(request));
			dispacher.forward(request,response);
		}
		
		if(action.equals("write")) {
			String title = request.getParameter("title");
			String content= request.getParameter("content");
			HttpSession session = request.getSession();
            String userID = (String)session.getAttribute("userID");
			
			ContentsDO c = new ContentsDO();
			c.setTitle(title);
			c.setContent(content);
			c.setWriter(userID);
			dao.insert(c);

			RequestDispatcher dispacher = request.getRequestDispatcher("/ContentsCtrl?action=list");
			dispacher.forward(request,response);
		}
		
		if(action.equals("view")) {
			int postID = Integer.parseInt(request.getParameter("postID"));
			ContentsDO c = dao.getByID(postID);
			request.setAttribute("content", c);
			RequestDispatcher dispacher = request.getRequestDispatcher("/contentPage/contentView.jsp");
			dispacher.forward(request, response);
		}
	}
		

	
	public String contentsList(HttpServletRequest request) {
		ContentsDAO dao = new ContentsDAO();
		
//		String[] list = new String[dao.getRecentID()];
//		for(int i=0; i<dao.getRecentID(); i++) {
//			list[i] = dao.getByID(dao.getRecentID()-i).title;
//		}
		List<ContentsDO> list = dao.getAll();
		
		request.setAttribute("list", list);
		return "contentPage/contentList.jsp";
	}

}

package contentData;

import java.io.IOException;
import java.util.ArrayList;
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
		likeDAO likedao = new likeDAO();
		ContentsDAO dao = new ContentsDAO();
		String action = request.getParameter("action");
		String view = null;
		if(action.equals("like")) {
			likeDO like = new likeDO();
			ContentsDO content = new ContentsDO(); 
			content = dao.getByID(Integer.parseInt(request.getParameter("content")));
			HttpSession session = request.getSession();
			String userID = (String)session.getAttribute("userID");
			
			if(userID != null) {
				List<likeDO> likeLog = likedao.getByTitle(content.getTitle());
				boolean ID = true;
				
				for(int i = 0; i<likeLog.size(); i++) {
					if(likeLog.get(i).getUserID().equals(userID)) {
						ID = false;
						break;
					}
				}
				if(ID) {
					like.setUserID(userID);
					like.setContentTitle(content.getTitle());
					likedao.insert(like);
				}
			}
			view = "/ContentsCtrl?action=view&postID="+content.getPostID();
			response.sendRedirect(view);
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
			int likeNum = likedao.getLikeNum(c.getTitle());
			request.setAttribute("likeNum", likeNum);
			request.setAttribute("content", c);
			request.setAttribute("postID", postID);
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

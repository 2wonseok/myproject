package noticeboard.command;

import javax.servlet.http.HttpServletRequest;



import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.BoardPage;
import noticeboard.service.NoticeBoardListService;
import reply.service.ReplyService;

public class NoticeBoardListHandler implements CommandHandler {
	private static final String FORM_VIEW = "noticeBoardList";
	private NoticeBoardListService noticeBoardList = new NoticeBoardListService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		String searchKeyword = req.getParameter("searchKeyword");
		String searchField = req.getParameter("searchField");
		int pageNo = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		if (searchKeyword == "" || searchField == "") {
			BoardPage boardPage = noticeBoardList.getBoardPage(pageNo);
			req.setAttribute("noticeBoard", boardPage);
			return FORM_VIEW;
		}
		
		if (searchKeyword != null && searchField != null) {
			BoardPage boardPage = noticeBoardList.searchContent(pageNo, searchKeyword, searchField);
			req.setAttribute("searchResult", boardPage);
			req.setAttribute("searchKeyword", searchKeyword);
			req.setAttribute("searchField", searchField);
			return FORM_VIEW;
			
		} else {
			BoardPage boardPage = noticeBoardList.getBoardPage(pageNo);
			req.setAttribute("noticeBoard", boardPage);
			return FORM_VIEW;
		}
	}
}


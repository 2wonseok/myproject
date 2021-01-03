package freeboard.command;

import javax.servlet.http.HttpServletRequest;


import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.BoardPage;
import freeboard.model.FreeBoard;
import freeboard.service.FreeBoardListService;
import member.service.ListPage;
import reply.service.ReplyService;

public class FreeBoardListHandler implements CommandHandler {
	private static final String FORM_VIEW = "freeBoardList";
	private FreeBoardListService freeBoardList = new FreeBoardListService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		String searchKeyword = req.getParameter("searchKeyword");
		String searchField = req.getParameter("searchField");
		int replycnt = 0;
		int pageNo = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		if (searchKeyword == "" || searchField == "") {
			BoardPage boardPage = freeBoardList.getBoardPage(pageNo);
			req.setAttribute("freeBoard", boardPage);
			return FORM_VIEW;
		}
		
		if (searchKeyword != null && searchField != null) {
			BoardPage boardPage = freeBoardList.searchContent(pageNo, searchKeyword, searchField);
			req.setAttribute("searchResult", boardPage);
			req.setAttribute("searchKeyword", searchKeyword);
			req.setAttribute("searchField", searchField);
			return FORM_VIEW;
			
		} else {
			BoardPage boardPage = freeBoardList.getBoardPage(pageNo);
			req.setAttribute("freeBoard", boardPage);
			return FORM_VIEW;
		}
	}
}


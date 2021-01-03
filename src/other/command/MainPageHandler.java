package other.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.BoardPage;
import freeboard.service.FreeBoardListService;
import noticeboard.service.NoticeBoardListService;

public class MainPageHandler implements CommandHandler {
	private static final String FORM_VIEW = "mainPage";
	private FreeBoardListService freeBoardList = new FreeBoardListService();
	private NoticeBoardListService noticeBoardList = new NoticeBoardListService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		int pageNo = 1;
		
		BoardPage Notice = noticeBoardList.getMainPage(pageNo);
		BoardPage freeboard = freeBoardList.getSubPage(pageNo);
		
		req.setAttribute("Notice", Notice);
		req.setAttribute("freeBoard", freeboard);
		return FORM_VIEW;
	}

}

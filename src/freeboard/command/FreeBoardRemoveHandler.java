package freeboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.service.FreeBoardRemoveService;

public class FreeBoardRemoveHandler implements CommandHandler {
	FreeBoardRemoveService freeBoardRemove = new FreeBoardRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNo = req.getParameter("pageNo");
		int post_no = Integer.parseInt(req.getParameter("post_no"));
		
		freeBoardRemove.postDelete(post_no);
		res.sendRedirect("freeBoard.do?pageNo="+pageNo);
		return null;
	}

}

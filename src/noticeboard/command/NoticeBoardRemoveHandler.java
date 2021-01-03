package noticeboard.command;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import noticeboard.service.NoticeBoardRemoveService;

public class NoticeBoardRemoveHandler implements CommandHandler {
	private NoticeBoardRemoveService noticeBoardRemove = new NoticeBoardRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNo = req.getParameter("pageNo");
		int post_no = Integer.parseInt(req.getParameter("post_no"));
		
		noticeBoardRemove.postDelete(post_no);
		res.sendRedirect("noticeBoard?pageNo="+pageNo);
		return null;
	}

}

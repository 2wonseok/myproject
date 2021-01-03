package freeboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.service.FreeBoardRemoveService;
import reply.service.CommentReplyRemoveService;
import reply.service.ReplyRemoveService;

public class FreeBoardRemoveHandler implements CommandHandler {
	private FreeBoardRemoveService freeBoardRemove = new FreeBoardRemoveService();
	private ReplyRemoveService replyRemoveService = new ReplyRemoveService();
	private CommentReplyRemoveService commentReplyRemoveService = new CommentReplyRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNo = req.getParameter("pageNo");
		int post_no = Integer.parseInt(req.getParameter("post_no"));
		
		freeBoardRemove.postDelete(post_no);
		replyRemoveService.postRemove(post_no);
		commentReplyRemoveService.postRemove(post_no);
		res.sendRedirect("freeBoard?pageNo="+pageNo);
		return null;
	}

}

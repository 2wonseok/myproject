package reply.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.model.User;
import reply.service.CommentReplyRemoveService;

public class CommentReplyRemoveHandler implements CommandHandler {
	private CommentReplyRemoveService replyRemoveService = new CommentReplyRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String memberid = req.getParameter("memberid");
		String noVal = req.getParameter("replyid");
		int post_no = Integer.parseInt(req.getParameter("postNo"));
		String pageNo = req.getParameter("pageNo");
		int replyid = Integer.parseInt(noVal);
		User authUser = (User) req.getSession().getAttribute("authUser");

		if (!authUser.getId().equals(memberid)) {
			res.sendError(HttpServletResponse.SC_FORBIDDEN);
			return null;
		}
		
		replyRemoveService.remove(replyid);
		res.sendRedirect(req.getContextPath()+"/LwsProject/freeBoardView?pageNo="+pageNo+"&post_no="+post_no);
		return null;

	}

}

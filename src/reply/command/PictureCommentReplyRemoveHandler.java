package reply.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.command.CommandHandler;
import member.model.User;
import reply.service.PictureCommentReplyRemoveService;

public class PictureCommentReplyRemoveHandler implements CommandHandler {
	private PictureCommentReplyRemoveService replyRemoveService = new PictureCommentReplyRemoveService();
	
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
		res.sendRedirect(req.getContextPath()+"/LwsProject/pictureBoardView?pageNo="+pageNo+"&post_no="+post_no);
		return null;
	}

}

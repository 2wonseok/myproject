package reply.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.command.CommandHandler;
import member.model.User;
import reply.service.PictureCommentReplyWriterService;

public class PictureCommentReplyWriterHandler implements CommandHandler {
	private PictureCommentReplyWriterService replyWriterService = new PictureCommentReplyWriterService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		HttpSession session = req.getSession();
		User user = (User) session.getAttribute("authUser");
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		String replyid = req.getParameter("replyid");
		int post_no = Integer.parseInt(req.getParameter("postNo"));
		String userId = user.getId();
		String body = req.getParameter("body");
		String pageNo = req.getParameter("pageNo");
		
		if (body == null || body.isEmpty()) {
			errors.put("nobody", true);
			res.sendRedirect(req.getContextPath()+"/LwsProject/pictureBoardView?pageNo="+pageNo+"&post_no="+post_no);
		}
		
		replyWriterService.add(replyid, userId, body, post_no);

		res.sendRedirect(req.getContextPath()+"/LwsProject/pictureBoardView?pageNo="+pageNo+"&post_no="+post_no);
		
		return null;
	}

}

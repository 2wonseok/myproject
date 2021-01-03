package pictureboard.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import pictureboard.service.PictureBoardRemoveService;
import reply.service.PictureCommentReplyRemoveService;
import reply.service.PictureReplyRemoveService;

public class PictureBoardRemoveHandler implements CommandHandler {
	private PictureBoardRemoveService pictureBoardRemove = new PictureBoardRemoveService(); 
	private PictureReplyRemoveService replyRemoveService = new PictureReplyRemoveService();
	private PictureCommentReplyRemoveService commentReplyRemove = new PictureCommentReplyRemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNo = req.getParameter("pageNo");
		int post_no = Integer.parseInt(req.getParameter("post_no"));
		
		pictureBoardRemove.postDelete(post_no);
		replyRemoveService.postReplyRemove(post_no);
		commentReplyRemove.postCommentReplyremove(post_no);
		res.sendRedirect("pictureBoard?pageNo="+pageNo);
		return null;
	}

}

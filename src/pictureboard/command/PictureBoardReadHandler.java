package pictureboard.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import pictureboard.model.PictureBoard;
import pictureboard.service.PictureBoardReadService;
import reply.model.Reply;
import reply.service.ReplyService;

public class PictureBoardReadHandler implements CommandHandler {
	private static final String FORM_VIEW = "pictureBoardView";
	private PictureBoardReadService pictureBoardRead = new PictureBoardReadService();
	private ReplyService replyService = new ReplyService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return getProcess(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return postProcess(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String getProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String no = req.getParameter("post_no");
		int post_no = Integer.parseInt(no);
		String currentPage = req.getParameter("pageNo");
		String oper =  req.getParameter("oper");
		
		if (oper != null) {
			pictureBoardRead.likeCount(post_no, true);
			res.sendRedirect("pictureBoardView?pageNo="+currentPage+"&post_no="+post_no);
			return null;
		}
		
		if (no != null) {
			pictureBoardRead.readCount(post_no, true);
			List<Reply> replyList = replyService.getPictureReplyList(post_no);
			List<Reply> commentReply = replyService.getPictureCommentReply(post_no);
			PictureBoard view = pictureBoardRead.postRead(post_no);
			req.setAttribute("commentList", commentReply);
			req.setAttribute("replyList", replyList);
			req.setAttribute("post", view);
			req.setAttribute("currentPage", currentPage);
			return FORM_VIEW;
		}
		return null;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

}

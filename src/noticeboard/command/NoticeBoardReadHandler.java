package noticeboard.command;

import java.io.IOException;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.FreeBoard;
import noticeboard.service.NoticeBoardReadService;
import reply.model.Reply;
import reply.service.ReplyService;

public class NoticeBoardReadHandler implements CommandHandler {
	private static final String FORM_VIEW = "noticeBoardView";
	private NoticeBoardReadService noticeBoardRead = new NoticeBoardReadService();
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
			noticeBoardRead.likeCount(post_no, true);
			res.sendRedirect("noticeBoardView?pageNo="+currentPage+"&post_no="+post_no);
			return null;
		}
		
		if (no != null) {
			noticeBoardRead.readCount(post_no, true);
			List<Reply> replyList = replyService.getReplyList(post_no);
			FreeBoard view = noticeBoardRead.postRead(post_no);
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

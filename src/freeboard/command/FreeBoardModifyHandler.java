package freeboard.command;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.FreeBoard;
import freeboard.service.FreeBoardModifyService;
import freeboard.service.FreeBoardReadService;

public class FreeBoardModifyHandler implements CommandHandler {
	private static final String FORM_VIEW = "freeBoardModify";
	private FreeBoardReadService freeBoardRead = new FreeBoardReadService();
	private FreeBoardModifyService freeBoardModify = new FreeBoardModifyService();  
	
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

	private String getProcess(HttpServletRequest req, HttpServletResponse res) {
		String no = req.getParameter("post_no");
		int post_no = Integer.parseInt(no);
		String currentPage = req.getParameter("pageNo");
		
		if (no != null) {
			FreeBoard view = freeBoardRead.postRead(post_no);
			req.setAttribute("post", view);
			req.setAttribute("currentPage", currentPage);
			return FORM_VIEW;
		}
		return null;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String no = req.getParameter("post_no");
		int pageNo = Integer.parseInt(req.getParameter("pageNo"));
		int post_no = Integer.parseInt(no);
		String title = req.getParameter("title");
		String body = req.getParameter("body");
		
		FreeBoard fb = new FreeBoard();
		fb.setPost_no(post_no);
		fb.setTitle(title);
		fb.setBody(body);
		
		if (title == null) {
			getProcess(req, res);
			return FORM_VIEW;
		}
		
		freeBoardModify.postUpdate(fb);
		res.sendRedirect("freeBoardView.do?pageNo="+pageNo+"&post_no="+post_no);
		return null;
	}

}

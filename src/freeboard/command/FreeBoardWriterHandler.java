package freeboard.command;

import java.io.IOException;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.FreeBoard;
import freeboard.service.FreeBoardWriterService;

public class FreeBoardWriterHandler implements CommandHandler {
	private static final String FORM_VIEW = "freeBoardWriter";
	private FreeBoardWriterService freeBoardWriter = new FreeBoardWriterService();
	
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
		return FORM_VIEW;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("id");
		String name = req.getParameter("name");
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int notice = 1;
		
		if (req.getParameter("notice") != null) {
			notice = Integer.parseInt(req.getParameter("notice"));
		}
		
		FreeBoard fb = new FreeBoard();
		fb.setMemberid(id);
		fb.setName(name);
		fb.setTitle(title);
		fb.setBody(content);
		fb.setNotice(notice);
		
		if (title != null && !title.isEmpty()) {
			freeBoardWriter.insert(fb);
			res.sendRedirect("freeBoard.do");
			return null;
		}
		return null;
	}

}

package noticeboard.command;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import freeboard.model.FreeBoard;
import noticeboard.service.NoticeBoardWriterService;

public class NoticeBoardWriterHandler implements CommandHandler {
	private static final String FORM_VIEW = "noticeBoardWriter";
	private NoticeBoardWriterService freeBoardWriter = new NoticeBoardWriterService();
	
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
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		FreeBoard fb = new FreeBoard();
		fb.setMemberid(id);
		fb.setName(name);
		fb.setTitle(title);
		fb.setBody(content);
		
		if (title == null || title.isEmpty()) {
			errors.put("notitle", true);
			return FORM_VIEW;
		}
		
		freeBoardWriter.insert(fb);
		res.sendRedirect("noticeBoard");
		return null;
	}

}

package member.command;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.model.Member;
import member.service.MemberModifyService;

public class MemberModifyHandler implements CommandHandler {
	private static final String FORM_VIEW = "memberModify";
	private MemberModifyService modifyService = new MemberModifyService();
	
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
		String id = req.getParameter("id");
		
		if (id != null && !id.isEmpty()) {
			Member mem = modifyService.selectModify(id);
			req.setAttribute("modify", mem);
			return FORM_VIEW;
		}
		
		return null;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String confirmPw = req.getParameter("confirmPw");
		String password = req.getParameter("password");
		String id = req.getParameter("id");
		
		Member m = new Member();
		m.setMemberid(req.getParameter("id"));
		m.setBirth(req.getParameter("birth"));
		m.setEmail(req.getParameter("email"));
		m.setPhone(req.getParameter("phone"));
		m.setPassword(req.getParameter("password"));
		
		Map<String, Boolean> errors = new HashMap<>();
		
		if (!confirmPw.equals(password)) {
			errors.put("pw", true);
			Member mem = modifyService.selectModify(id);
			req.setAttribute("modify", mem);
			req.setAttribute("errors", errors);
			return FORM_VIEW;
		}
		
		if (m != null) {
			modifyService.memberUpdate(m);
			res.sendRedirect("memberView?id="+id);
			return null;
		}
		return FORM_VIEW;
		
	}
	
	

}

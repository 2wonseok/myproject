package member.command;

import java.util.HashMap;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.service.LoginFailException;
import member.service.RemoveService;
import member.model.Member;
import member.service.DuplicateIdException;
import controller.command.CommandHandler;

public class RemoveHandler implements CommandHandler {
	private static final String FORM_VIEW = "removeMemberForm";
	private RemoveService removeService = new RemoveService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		if (req.getMethod().equalsIgnoreCase("GET")) {
			return processForm(req, res);
		} else if (req.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(req, res);
		} else {
			res.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}
	
	public String processForm(HttpServletRequest req, HttpServletResponse res) {
		return FORM_VIEW;
	}
	
	public String processSubmit(HttpServletRequest req, HttpServletResponse res) throws Exception {
		Member mem = new Member();
		
		mem.setMemberid(req.getParameter("memberId").trim());
		mem.setPassword(req.getParameter("password").trim());

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		if (mem.getMemberid() == null || mem.getMemberid().isEmpty()) {
			errors.put("id", Boolean.TRUE);
		} 
		
		if (mem.getPassword() == null || mem.getPassword().isEmpty()) {
			errors.put("password", Boolean.TRUE);
		} 
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		
		try {
			HttpSession session = req.getSession(false);
			
			removeService.removeMember(mem);
			
			if (session != null) {
				session.invalidate();
			}
			
			res.sendRedirect(req.getContextPath() + "/LwsProject/mainPage");
			return null;
			
		} catch (DuplicateIdException e) {
			errors.put("PwNotMatch", Boolean.TRUE);
			return FORM_VIEW;
		}
		
	}
	
	
	
}
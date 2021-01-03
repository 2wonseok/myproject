package member.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.service.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;

public class JoinHandler implements CommandHandler {
	private static final String FORM_VIEW = "joinForm";
	private JoinService joinService = new JoinService();
	
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
		String memberId = req.getParameter("memberId");
		String password = req.getParameter("password");
		String confirmPassword =req.getParameter("confirmPassword");
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String gender = req.getParameter("gender");
		
		String email1 = req.getParameter("email1");
		String email2 = req.getParameter("email2");
		
		String email = email1+"@"+email2;
		
		String phone1 = req.getParameter("phone1");
		String phone2 = req.getParameter("phone2");
		String phone3 = req.getParameter("phone3");
		
		String phone = phone1+"-"+phone2+"-"+phone3;
		
		JoinRequest joinReq = new JoinRequest();
		
		joinReq.setMemberId(memberId);
		joinReq.setPassword(password);
		joinReq.setConfirmPassword(confirmPassword);
		joinReq.setName(name);
		joinReq.setBirth(birth);
		joinReq.setGender(gender);
		joinReq.setEmail(email);
		joinReq.setPhone(phone);
		
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		joinReq.validate(errors);
		
		if (phone1 == null || phone1.isEmpty() || phone2 == null || phone2.isEmpty()) {
			errors.put("phoneIsnull", true);
		}
		
		if (email1 == null || email1.isEmpty() || email2 == null || email2.isEmpty()) {
			errors.put("emailnull", true);
		}
		
		if (!password.equals(confirmPassword)) {
			errors.put("pwdNotMacth", true);
			return FORM_VIEW;
		}
		
		if (!errors.isEmpty()) {
			return FORM_VIEW;
		}
		
		try {
			joinService.join(joinReq);
			return "mainPage";
		} catch (DuplicateIdException e) {
			errors.put("duplicateId", Boolean.TRUE);
			return FORM_VIEW;
		}

		
	}


}

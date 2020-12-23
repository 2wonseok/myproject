package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.model.Member;
import member.service.FindService;

public class FindHandler implements CommandHandler {
	FindService findService = new FindService();
	
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
		String oper = req.getParameter("oper");

		if (oper.equals("id")) {
			return "findIdForm";
		} else { 
			return "findPwForm";
		}
		
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) {
		String oper = req.getParameter("oper");
		String findName = req.getParameter("findName");
		String findEmail = req.getParameter("findEmail");
		String findId = req.getParameter("findId");
		String findBirth = req.getParameter("findBirth");
		
		Member member = new Member();
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		if (oper.equals("findId")) {
			member.setName(findName);
			member.setEmail(findEmail);

			if (findName == null || findName.isEmpty() || findEmail == null || findEmail.isEmpty()) {
				errors.put("findErrors", true);
				return "findIdForm";
			}
			
			Member m = findService.memberFind(member);
			
			if (!findName.equals(m.getName()) && findEmail.equals(m.getEmail())) {
				errors.put("findErrors", true);
				return "findIdForm";
			}
			
			req.setAttribute("findRs", m);
			return "findIdForm";
			
		} else {
			member.setEmail(findEmail);
			member.setMemberid(findId);
			member.setBirth(findBirth);
			
			if (findId == null || findId.isEmpty() || findEmail == null || findEmail.isEmpty() || findBirth == null || findBirth.isEmpty()) {
				errors.put("findErrors", true);
				return "findPwForm";
			}
			
			Member m = findService.memberFind(member);
			
			if (!findId.equals(m.getMemberid()) && findEmail.equals(m.getEmail()) && findBirth.equals(m.getBirth())) {
				errors.put("findErrors", true);
				return "findPwForm";
			}
			
			req.setAttribute("findRs", m);
			return "findPwForm";
			
		}

		
	}

}

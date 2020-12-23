package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.model.Member;
import member.service.MemberViewService;

public class MemberViewHandler implements CommandHandler {
	private static final String FORM_VIEW = "memberView";
	private MemberViewService viewService = new MemberViewService();
	
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
		String currentPage = req.getParameter("pageNo");
		
		Member member = viewService.getMember(id);
		req.setAttribute("result", member);
		req.setAttribute("currentPage", currentPage);
		return FORM_VIEW;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String id = req.getParameter("memberid");
		int manager = Integer.parseInt(req.getParameter("manager"));
		
		viewService.updateMember(id, manager);
		getProcess(req, res);
		return FORM_VIEW;
	}

}

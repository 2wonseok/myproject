package member.command;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import member.model.Member;
import member.service.ListPage;
import member.service.MemberListService;

public class MemberListHandler implements CommandHandler {
	private static final String FORM_VIEW = "memberList";
	private MemberListService listService = new MemberListService();
	
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
		String pageNoVal = req.getParameter("pageNo");
		String searchKeyword = req.getParameter("searchKeyword");
		String searchField = req.getParameter("searchField");

		int pageNo = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		if (searchKeyword == "" || searchField == "") {
			ListPage listPage = listService.getListPage(pageNo);
			req.setAttribute("listPage", listPage);
			return FORM_VIEW;
		}
		
		if (searchKeyword != null && searchField != null) {
			ListPage member = listService.searchList(pageNo, searchKeyword, searchField);
			req.setAttribute("searchResult", member);
			req.setAttribute("searchKeyword", searchKeyword);
			req.setAttribute("searchField", searchField);
			return FORM_VIEW;
			
		}	else {
			ListPage listPage = listService.getListPage(pageNo);
			req.setAttribute("listPage", listPage);
			return FORM_VIEW;
		} 
		
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) {
		// TODO Auto-generated method stub
		return null;
	}

}

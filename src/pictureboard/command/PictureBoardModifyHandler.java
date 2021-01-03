package pictureboard.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.command.CommandHandler;
import pictureboard.model.PictureBoard;
import pictureboard.service.PictureBoardModifyService;
import pictureboard.service.PictureBoardReadService;

public class PictureBoardModifyHandler implements CommandHandler {
	private static final String FORM_VIEW = "pictureBoardModify";
	private PictureBoardReadService pictureBoardRead = new PictureBoardReadService();
	private PictureBoardModifyService pictureBoardModify = new PictureBoardModifyService();
	
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
			PictureBoard view = pictureBoardRead.postRead(post_no);
			req.setAttribute("post", view);
			req.setAttribute("currentPage", currentPage);
			return FORM_VIEW;
		}
		return null;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024 ; // 10MB
		String savaPath = "C:\\Users\\이원석\\Documents\\myworkspace\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myproject\\upload";

		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		try {
			multi = new MultipartRequest(req, savaPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String no = multi.getParameter("post_no");
		int pageNo = Integer.parseInt(multi.getParameter("pageNo"));
		int post_no = Integer.parseInt(no);
		String title = multi.getParameter("title");
		String body = multi.getParameter("body");
		String fileName= multi.getFilesystemName("uploardfile");
		
		if (title == null || title.isEmpty()) {
			errors.put("notitle", true);
			PictureBoard view = pictureBoardRead.postRead(post_no);
			req.setAttribute("post", view);
			req.setAttribute("currentPage", pageNo);
			return FORM_VIEW;
		}
		
		PictureBoard pb = new PictureBoard();
		pb.setPost_no(post_no);
		pb.setTitle(title);
		pb.setBody(body);
		pb.setUploadFile(fileName);
		
		pictureBoardModify.postUpdate(pb);
		res.sendRedirect("pictureBoardView?pageNo="+pageNo+"&post_no="+post_no);
		return null;
	}

}

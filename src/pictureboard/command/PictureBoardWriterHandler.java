package pictureboard.command;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.command.CommandHandler;
import pictureboard.model.PictureBoard;
import pictureboard.service.PictureBoardWriterService;

public class PictureBoardWriterHandler implements CommandHandler {
	private static final String FORM_VIEW = "pictureBoardWriter";
	private PictureBoardWriterService pictureBoardWriter = new PictureBoardWriterService();
	
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
		// TODO Auto-generated method stub
		return FORM_VIEW;
	}

	private String postProcess(HttpServletRequest req, HttpServletResponse res) throws IOException {
		MultipartRequest multi = null;
		int sizeLimit = 10 * 1024 * 1024 ; // 10MB
//		String savaPath = "C:\\imgfile";
		String savaPath = "C:\\Users\\이원석\\Documents\\myworkspace\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myproject\\upload";
		
		try {
			
			multi = new MultipartRequest(req, savaPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String fileName= multi.getFilesystemName("uploardfile");
		
		String memberid = multi.getParameter("id");
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String body = multi.getParameter("content");
		
		int count = 0;
		String regip = req.getRemoteAddr();
		
		PictureBoard pb = new PictureBoard();
		pb.setMemberid(memberid);
		pb.setName(name);
		pb.setTitle(title);
		pb.setBody(body);
		pb.setUploadFile(fileName);
		
		if (title != null && !title.isEmpty()) {
			pictureBoardWriter.insert(pb);	
			res.sendRedirect("pictureBoard.do");
			return null;
		}
		
		return FORM_VIEW;
	}

}

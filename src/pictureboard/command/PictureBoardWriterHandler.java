package pictureboard.command;

import java.io.File;
import java.io.FileFilter;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.file.Files;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import controller.command.CommandHandler;
import pictureboard.model.PictureBoard;
import pictureboard.service.PictureBoardWriterService;

public class PictureBoardWriterHandler implements CommandHandler {
	private static final String FORM_VIEW = "pictureBoardWriter";
	private static final String UPLOAD_DIR = "upload";
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
//		String savaPath = req.getContextPath()+"/upload";
		String applicationPath = req.getServletContext().getRealPath("");
		String uploadFilePath = applicationPath + UPLOAD_DIR;
//		System.out.println(applicationPath);
//		System.out.println(uploadFilePath);
//		String savaPath = "C:\\Users\\이원석\\Documents\\myworkspace\\eclipse-workspace\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\myproject\\upload";
		
		Map<String, Boolean> errors = new HashMap<>();
		req.setAttribute("errors", errors);
		
		File fileSaveDir = new File(uploadFilePath);
		
		// 파일 경로 없으면 생성
		if (!fileSaveDir.exists()) {
			fileSaveDir.mkdirs();
		}
		
		try {
			
			multi = new MultipartRequest(req, uploadFilePath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String fileName= multi.getFilesystemName("uploardfile");
		String memberid = multi.getParameter("id");
		String name = multi.getParameter("name");
		String title = multi.getParameter("title");
		String body = multi.getParameter("content");
		
//		int count = 0;
//		String regip = req.getRemoteAddr();
		
		PictureBoard pb = new PictureBoard();
		pb.setMemberid(memberid);
		pb.setName(name);
		pb.setTitle(title);
		pb.setBody(body);
		pb.setUploadFile(fileName);
		
		if (title == null || title.isEmpty()) {
			errors.put("notitle", true);
			return FORM_VIEW;
		}
		
		if (fileName == null || fileName.isEmpty()) {
			errors.put("nofile", true);
			return FORM_VIEW;
		}
		
		pictureBoardWriter.insert(pb);	
		res.sendRedirect("pictureBoard");
		return null;
	}

}

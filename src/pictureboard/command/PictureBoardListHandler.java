package pictureboard.command;

import java.io.FileInputStream;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;
import pictureboard.model.PictureBoard;
import pictureboard.model.PictureBoardPage;
import pictureboard.service.PictureBoardListService;

public class PictureBoardListHandler implements CommandHandler {
	private static final String FORM_VIEW = "pictureBoardList";
	private PictureBoardListService pictureBoardList = new PictureBoardListService();
	
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		String pageNoVal = req.getParameter("pageNo");
		int pageNo = 1;
		
		if (pageNoVal != null) {
			pageNo = Integer.parseInt(pageNoVal);
		}
		
		PictureBoardPage boardPage = pictureBoardList.getBoardPage(pageNo);
		req.setAttribute("pictureBoard", boardPage);
		return FORM_VIEW;
		
	}

}

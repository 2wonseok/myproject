package fileupload;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

/**
 * Servlet implementation class UploadServlet
 */
@WebServlet("/uploadServlet")
@MultipartConfig(
		location = "C:\\Users\\이원석\\Documents\\apache-tomcat-9.0.40\\uploadTemp",
		maxFileSize = 99999L,
		maxRequestSize = -1, 
		fileSizeThreshold = -1
		)

public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		resp.setContentType("text/html); charset=utf-8");
		
		PrintWriter writer = resp.getWriter();
		writer.println("<html><body>");
		
		String contentType = req.getContentType();
		if (contentType != null && contentType.toLowerCase().startsWith("multipart/")) {
			printPartInfo(req, writer);
		} else {
			writer.println("multipart가 아님");
		}
		writer.println("</body></html>");

	}

	private void printPartInfo(HttpServletRequest req, PrintWriter writer) throws IOException, ServletException {
		Collection<Part> parts = req.getParts();
		for (Part part : parts) {
			writer.println("<br/> name = " + part.getName());
			String contentType = part.getContentType();
			writer.println("<br/> contentType = " + contentType);
			if (part.getHeader("Content-Disposition").contains("filename=")) {
				writer.println("<br/> size = " + part.getSize());
				String fileName = part.getSubmittedFileName();
				writer.println("<br/> filename = " + fileName);
				if (part.getSize() > 0) {
					part.write("C:/Users/이원석/Documents/apache-tomcat-9.0.40/uploadTemp"+fileName);
					part.delete();
				}
			} else {
				String value = req.getParameter(part.getName());
				writer.println("<br/> value = " + value);
			}
			writer.println("<hr/>");
		}
		
	}

}

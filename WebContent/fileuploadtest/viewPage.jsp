<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.io.File"%> 
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%> 
<%@page import="com.oreilly.servlet.MultipartRequest"%> 
<% request.setCharacterEncoding("utf-8"); 
	final String saveFolder = ""; 
	final String encoding = "utf-8"; 
	final int maxSize = 10*1024*1024; //10mb 
	try{ //파일이 서버에 업로드되는 시점은 MultipartRequest 객체 생성 순간이다. 
		MultipartRequest multi = new MultipartRequest(request, saveFolder, maxSize, encoding, new DefaultFileRenamePolicy()); //request가 되는 순간 null로 변한다. 
		//out.print("성공"); 
		String fileName = multi.getFilesystemName("uploadFile"); 
		String original = multi.getOriginalFileName("uploadFile"); //filename은 중복이름이 들어올 경우 자동으로 index가 붙는데, index되기 전의 원본명 
		String type = multi.getContentType("uploadFile"); 
		File f = multi.getFile("uploadFile"); 
		int len = 0; 
			if(f!=null) { 
				len = (int)f.length(); 
			} 
		String file1 = multi.getParameter("file1"); 
		String file2 = multi.getParameter("file2"); 
		String title = multi.getParameter("title"); %> 
		
		저장된 파일 : <%=fileName%><br/> 
		실제 파일 : <%=original%><br/> 
		파일 타입: <%=type%><br/> 
		파일 크기 : <%=len%><br/> 
		파일명1 : <%=file1%><br/> 
		파일명2 : <%=file2%><br/> 
		title : <%=title%><br/> 
	<a href="fileSelect.jsp">파일선택</a> 
<% } catch (Exception e) { 
		e.printStackTrace(); 
	 } %>


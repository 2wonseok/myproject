package pictureboard.model;

import java.sql.Date;

public class PictureBoard {
	private int post_no;
	private String memberid;
	private String name;
	private String title;
	private String body;
	private Date regDate;
	private Date modDate;
	private int readCnt;
	private int likeCnt;
	private String uploadFile;
	
	public int getPost_no() {
		return post_no;
	}
	
	public void setPost_no(int post_no) {
		this.post_no = post_no;
	}
	
	public String getMemberid() {
		return memberid;
	}
	
	public void setMemberid(String memberid) {
		this.memberid = memberid;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getBody() {
		return body;
	}
	
	public void setBody(String body) {
		this.body = body;
	}
	
	public Date getRegDate() {
		return regDate;
	}
	
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
	public Date getModDate() {
		return modDate;
	}
	
	public void setModDate(Date modDate) {
		this.modDate = modDate;
	}
	
	public int getReadCnt() {
		return readCnt;
	}
	
	public void setReadCnt(int readCnt) {
		this.readCnt = readCnt;
	}
	
	public int getLikeCnt() {
		return likeCnt;
	}
	
	public void setLikeCnt(int likeCnt) {
		this.likeCnt = likeCnt;
	}
	
	public String getUploadFile() {
		return uploadFile;
	}
	
	public void setUploadFile(String uploadFile) {
		this.uploadFile = uploadFile;
	}

	
}

package reply.model;

import java.util.Date;

public class Reply {
	private int id;
	private String memberid;
	private int post_no;
	private String body;
	private Date regDate;
	private int commentReplyId;
	
	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getMemberid() {
		return memberid;
	}
	
	public void setMemberId(String memberid) {
		this.memberid = memberid;
	}
	
	public int getPost_no() {
		return post_no;
	}
	
	public void setPost_no(int post_no) {
		this.post_no = post_no;
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

	public int getCommentReplyId() {
		return commentReplyId;
	}

	public void setCommentReplyId(int commentReplyId) {
		this.commentReplyId = commentReplyId;
	}
	
	
}

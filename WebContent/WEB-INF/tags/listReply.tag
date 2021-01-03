<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name ="postNo" type="java.lang.Integer" %>
<%@ attribute name ="pageNo" type="java.lang.Integer" %>
<style>
	ol, ul {
	    list-style: none;
	}
	.recommView ul {
    border-top: 1px solid #dedede;
    width: 100%;
    margin-top: 15px;
    margin-bottom: 30px;
	}
	.recommView li {
    position: relative;
    padding: 20px 35px;
    margin-bottom: -40px;
	}
	.recommView li p.txt {
    font-size: 14px;
    color: #444444;
    line-height: 22px;
    margin-bottom: 20px;
    display: block;
    word-break: keep-all;
    word-wrap: break-word;
	}
	.recommView li p span {
    color: #999999;
    font-size: 13px;
    padding: 0 15px;
	}
	.recommView li p #datespan {
    color: #999999;
    font-size: 13px;
    padding: 0 15px;
    display: inline-block; 
    width: 133px; 
    white-space: nowrap; 
    overflow: hidden;
    margin-bottom: -6px;
	}
	.lws {
		display: flex;
	}
	.lws #txs_reply {
		padding: 10px 20px;
    width: 877px;
    color: #666666;
    font-size: 15px;
    margin-top: 14px;
    border: 1px solid #cccccc;
    line-height: 24px;
    height: 50px;
    box-sizing: content-box;
	}
	#btn_replyadd {
    color: #fff;
    font-size: 15px;
    border: none;
    background: #353535;
    padding: 0px 50px;
    margin-right: -20px;
    line-height: 45px;
    float: right;
    margin-left: 10px;
    width: 180px;
    height: 80px;
    margin-top: 11px;
	}
	.recommView ul li .replyform {
    clear: both;
    color: #999999;
    font-size: 15px;
    height: 30px;
    width: 50px;
    border: 1px solid #dedede;
    padding: 3px 10px;
    background-color: white;
  }
</style>
<script>
 	$(function() {
		var clicks = true;
		
 		$(".replyform").click(function() {
 			var now = $(this).parent().parent().next().is("[hidden]");
 			
 			if (now) {
 				$(this).parent().parent().next().removeAttr("hidden");
 			}
 			if (!now) {
 				$(this).parent().parent().next().attr("hidden", true);
 			}  
 		});
	}); 
</script>
<div class="recommView">
<c:forEach items="${replyList }" var="reply">
	<ul>
		<li style="border-top:none;">
			<p class="txt">
				${reply.body}
			</p>
			<p>
				<span>${reply.memberid}</span>
				<span id="datespan">${reply.regDate}</span>
				<span>
					<c:if test="${reply.memberid == authUser.id }">
						<a href="${root }/LwsProject/replyRemove?no=${reply.id }&memberid=${reply.memberid}&postNo=${postNo}&pageNo=${pageNo}" 
							onclick="return confirm('삭제하시겠습니까?')" style="color:red;">삭제</a>
					</c:if>
				</span>
				<span><input type="button" value="답글" class="replyform" ></span>
			</p>
			<div class="lws" hidden >
				<form action="commentAdd" method="post">
					<input type="hidden" name="replyid" value="${reply.id }" />
					<input type="hidden" name="postNo" value="${postNo }" />
					<input type="hidden" name="pageNo" value="${pageNo }" />
				  <textarea id="txs_reply" name="body" maxlength="100" placeholder="100글자 까지 입력 가능합니다." ></textarea>
				  <c:if test="${errors.nobody }">
				  	<small class="form-text text-primary">댓글이 입력되지 않았습니다.</small>
				  </c:if>
				  <input type="submit" value="답글달기" onclick="return confirm('등록하시겠습니까?')" id="btn_replyadd">
				</form>
		  </div> 
		</li>
	</ul>
	<c:forEach items="${commentList }" var="comment">
		<c:if test="${comment.id == reply.id }">
			<ul style="border-top: 1px solid #dedede; width: 95%; margin-top: -45px; margin-bottom: 30px; margin-left: 60px; ">
				<li style="border-top:none;">
					<p class="txt">
						${comment.body}
					</p>
					<p>
						<span>${comment.memberid}</span>
						<span id="datespan">${comment.regDate}</span>
						<span>
							<c:if test="${comment.memberid == authUser.id }">
								<a href="${root }/commentReplyRemove?replyid=${comment.commentReplyId }&memberid=${comment.memberid}&postNo=${postNo}&pageNo=${pageNo}" 
									onclick="return confirm('삭제하시겠습니까?')" style="color:red;">삭제</a>
							</c:if>
						</span>
					</p>
				</li>
			</ul>
		</c:if>
	</c:forEach>
</c:forEach>	
</div>
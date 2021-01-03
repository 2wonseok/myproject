<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name ="postNo" type="java.lang.Integer" %>
<%@ attribute name ="pageNo" type="java.lang.Integer" %>
<%@ attribute name ="replyId" type="java.lang.String" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	.lws {
		display: flex;
	}
	.recommWritebox {
    clear: both;
    width: 1200px;
    margin: 95px auto 40px;
    background: #f2f5fa;
    padding: 15px 30px;
    border: 1px solid #e7e9ee;
    text-align: center;
    color: #666666;
    font-size: 15px;
	}
	.recommWritebox textarea {
    padding: 10px 20px;
    width: 1030px;
    color: #666666;
    font-size: 15px;
    margin: 0;
    border: 1px solid #cccccc;
    line-height: 24px;
    height: 80px;
    box-sizing: content-box;
	}
	#btn_add {
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
}
</style>
<c:if test="${not empty sessionScope.authUser }">
	<div class="recommWritebox">
		<form action="${root }/LwsProject/replyWrite" method="post">
			<input type="hidden" name="replyid" value="${replyId }" />
			<input type="hidden" name="pageNo" value="${pageNo }" />
			<input type="hidden" name="no" value="${postNo }"/>
			<div class="lws">
				<!-- <textarea name="body" class="form-control"  placeholder="40글자 까지 입력 가능합니다." maxlength="200" style="width:95%; height:80px; display:flex"></textarea>&nbsp; -->
			  <textarea id="tx_reply" name="body" maxlength="200" placeholder="200글자 까지 입력 가능합니다." ></textarea>
			  <c:if test="${errors.nobody }">
			  	<small class="form-text text-primary">댓글이 입력되지 않았습니다.</small>
			  </c:if>
			  <input type="submit"  value="댓글달기" onclick="return confirm('등록하시겠습니까?')" id="btn_add">
			</div>
		</form>
	</div>	
	
</c:if>

<!-- 			<textarea name="body" cols="60" rows="5"></textarea>
			<input type="text" name="body" />
			<input type="submit" value="등록" /> -->
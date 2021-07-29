<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%
	String chkID = request.getParameter("chkID");
	
	String sql = "select custid from customers where custid = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,chkID);
	rs = pstmt.executeQuery();
	
	String msg = "이미 사용중인 아이디 입니다.<br/>  다른 아이디를 검색하세요.";
	String dis = "disabled = 'disabled'";
	
	if(!rs.next()){
		msg ="사용 가능한 아이디 입니다.";
		dis = " ";
	}
%>

<section class="row">
<div class="col-md-8 col-md-offset-2 text-center">
	<form name="frm_id" action="IDchk.jsp"
	method="post" class="form-inline">
		<input type="text" id="userid" name="chkID" value="<%=chkID%>" class="form-control" />
		<input type="submit" value="검색" class="btn btn-info" />
	</form>
	<p class="text-primary"><%=msg %></p>
	
	<input type="button" class="btn btn-primary"  value = "ID 적용" <%=dis %> 
	onclick="IDINput()"/>
	
	<input type="button" value="취소" class="btn btn-danger" onclick="self.close();" />	
	
</div>
</section>
<script>
function IDINput(){
	var val = document.frm_id.chkID.value;
	opener.JoinFrm.custid.value=val;
	opener.JoinFrm.isUnique.value="y";
	self.close();
}
</script>
<%@ include file="./include/Footer.jsp" %>





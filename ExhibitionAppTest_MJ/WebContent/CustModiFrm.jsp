<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<%
String chkcustid = request.getParameter("UIDChk");
String rscustid = "";
String email = "";
String rscustname = "";
String phone= "";
String custpwd = "";

String sql = "select * from customers where custid = ?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, chkcustid);
rs = pstmt.executeQuery();

if(rs.next()){
	rscustid = rs.getString("custid");
	email = rs.getString("email");
	custpwd = rs.getString("custpwd");
	rscustname = rs.getString("custname");
	phone= rs.getString("phone");
}
%>
<section class="row">
	<div class="col-md-12">
<br/><br/>
<h2 class="text-center"> "<span class="text-primary"> <%=rscustname %> </span>"  님 정보 수정</h2>
<form action="CustModiProc.jsp">
<table class="table table-striped table-condensed" method="post" >
	<tr>
		<th>아이디</th>
		<td>
		<input type="text" class="form-control" value="<%=rscustid %>" name="custid" disabled/>
		<input type="hidden" class="form-control" value="<%=rscustid %>" name="custid" />
		</td>
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" class="form-control" value="********"  name="pwd" disabled/></td> 
	</tr>
	<tr>
		<th>이 름</th>
		<td><input type="text" class="form-control" name="custname"value="<%=rscustname %>"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
		<input type="email" class="form-control" name="email" placeholder="ovoovvo@ovo.com" value="<%=email %>"/></td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td><input type="text" maxlength="13" name="phone"  class="form-control" placeholder="010-0000-0000 형식으로 입력하세요" value="<%=phone %>"/>
		</td>
	</tr>
	<tr>
		<th colspan="2">
			<input type="submit" value="정 보 수 정" class="btn btn-success btn-block" />
		</th>
	</tr>
</table>
</form>
</div>
</section>
<%@ include file="./include/Footer.jsp" %>
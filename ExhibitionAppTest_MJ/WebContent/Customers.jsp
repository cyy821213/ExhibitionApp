<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3 class="text-center">회원 목록</h3>
<div class="table-responsive table-wrap customer">
	<table class="table table-hover table-bordered text-center table-striped">
		<thead class="text-center">
			<tr class="active">
				<th>회원 아이디</th>
				<th>이&nbsp;&nbsp;&nbsp;름</th>
				<th>이 메 일</th>
				<th>연 락 처</th>
				<th>정보수정 / 탈퇴</th>
			</tr>
		</thead>
<%
String sql = "select * from customers order by custid";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		String rscustid= rs.getString("custid");
		String rscustname= rs.getString("custname");
		String email= rs.getString("email");
		String phone= rs.getString("phone");
		%>
		<tr>
		
			<td><%=rscustid %></td>
			<td><%=rscustname %></td>
			<td><%=email %></td>
			<td><%=phone %></td>
			<td>
<form action="" method="post" id="CustModiFrm">
	<input type="hidden" value="<%=rscustid%>" name="UIDChk"/>
	<input type="button" value="수 정" class="btn btn-success"  
	onclick="CustFunc('m','<%=rscustid%>')"/>
	<input type="button" value="삭 제" class="btn btn-danger" 
	onclick="CustFunc('d','<%=rscustid%>')"/>
</form>
			</td>
		</tr>
		<%
	}while(rs.next());
}else{out.println("조회실패");}

%>
	</table>
</div>
<%@ include file="./include/Footer.jsp" %>
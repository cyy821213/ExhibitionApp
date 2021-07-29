<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3 class="text-center">예매 내역</h3>
<section class="row">
<%
String sql = "select * from tickets";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
	do{
		int tkcode = rs.getInt("tkcode");
		String custinfo = rs.getString("custinfo"); 
		String dates = rs.getString("dates"); 
		String readate = rs.getString("readate"); 
		int tprice  = rs.getInt("tprice");
		int tcnt  = rs.getInt("tcnt");
		String payment = rs.getString("payment");
%>
<div class="col-md-6">
<table class="table table-bordered">
<tr>
	<th class="active">예매번호</th>
	<td><%=tkcode %></td>
</tr>
<tr>
	<th class="active">예매자정보</th>
	<td><%=custinfo %></td>
</tr>
<tr>
	<th class="active">관람일자</th>
	<td><%=dates %></td>
</tr>
<tr>
	<th class="active">예매일자</th>
	<td><%=readate %></td>
</tr>
<tr>
	<th class="active">(티켓)가격</th>
	<td><%=tprice %></td>
</tr>
<tr>
	<th class="active">관람인원</th>
	<td><%=tcnt %></td>
</tr>
<tr>
	<th class="active">결제수단</th>
	<td><%=payment %></td>
</tr>
<tr>
</table>
</div>
<%
		} while(rs.next());
	}else{
		out.println("조회실패");
	}
%>
</section>
<%@ include file="./include/Footer.jsp" %>
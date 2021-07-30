<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3 class="text-center">전시관 목록</h3>
<div class="table-responsive table-wrap customer">
	<table class="table table-hover table-bordered text-center table-striped">
		<thead class="text-center">
			<tr>
				<th class="text-center">전시관코드</th>
				<th class="text-center">전시관이름</th>
				<th class="text-center">위&nbsp;&nbsp;&nbsp;치</th>
				<th class="text-center">연락처</th>
				<th class="text-center">개관시간</th>
				<th class="text-center">휴관일</th>
				<th class="text-center">수정/삭제</th>
			</tr>
		</thead>
		<%
		String sql ="select * from explace order by placename";
		
		pstmt = conn.prepareStatement(sql);
		rs = pstmt.executeQuery();
		if(rs.next()){
			do{
				String codes = rs.getString("codes");
				String placename = rs.getString("placename");
				String rlocation = rs.getString("location");
				String contactno = rs.getString("contactno");
				String times = rs.getString("times");
				String holiday = rs.getString("holiday");
			%>
				<tr>
					<td><%=codes %></td>
					<td><%=placename %></td>
					<td><%=rlocation %></td>
					<td><%=contactno %></td>
					<!-- 
						times = s09e19
								012345
					
					 -->
					<td><%=times.substring(1, 3) %> 시~ <%=times.substring(4, 6) %> 까지</td> 
					<!-- (1,3)=> 10 / (4,6)=> 17  (6-1 이어야 10이 된다???) -->
					<td><%=holiday %></td>
					<td>
		<form action="ExplaceModiFrm.jsp" method="get">
			<input type="hidden" value="<%=codes %>" name="CodeChk"/>
			<input type="submit" value="수정" class="btn btn-success"/>
		</form>			
					</td>
				</tr>
			<%}while(rs.next());
			}else{out.println("조회실패");}
		%>
	</table>
</div>
<%@ include file="./include/Footer.jsp" %>
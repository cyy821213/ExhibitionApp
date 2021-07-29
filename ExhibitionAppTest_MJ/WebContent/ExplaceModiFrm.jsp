<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<br/><br/>
<h3>전시관 정보 수정</h3>
<%
	String codes = request.getParameter("CodeChk");
	// 전역 변수 : 설정해서 전시관 관련 정보 찍어줄 변수 생성. 
	String placename = "placename";
	String rslocation = "location";
	String contactno = "contactno";
	String times = "times";
	String holiday = "holiday";

	String sql = "select *  from explace where codes = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, codes);
	rs = pstmt.executeQuery();
	
	if(rs.next()){
		do{// 기존 정보 가져오는 구문 써주시고
			// 반복문에서 가져올 값들 작성
			codes = rs.getString("codes");
			placename = rs.getString("placename");
			rslocation = rs.getString("location");
			contactno = rs.getString("contactno");
			times = rs.getString("times");
			holiday = rs.getString("holiday");	
		%>
<section class="row">
<div class="col-md-12">
<form action="ExplaceModiproc.jsp" method="post" id="EpModiFrm">
	<table class="table table-response table-striped">
		<tr>
			<th>전시관 코드</th>
			<td>
				<h4 class="text-left"><%=codes %> <small class="text-danger">- 수정불가</small></h4>
				<input type="hidden" value="<%=codes %>" name="codes" />
			</td>
		</tr>
		<tr>
			<th>전시관이름</th>
			<td>
				<input type="text" name="placename" class="form-control" value="<%=placename%>"/>
			</td>
		</tr>
		<tr>
			<th>위치(수정불가)</th>
			<td>
				<h4 class="text-left"><%=rslocation %> <small class="text-danger">- 수정불가</small></h4>
				<input type="hidden" value="<%=rslocation %>" name="location" />
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input type="text" name="contactno" class="form-control" value="<%=contactno%>"/>
			</td>
		</tr>
		<tr>
			<th>개관시간</th>
			<td>
			<!--  (힌트)s10e19 : 10시 ~ 19시 까지
			out.println(변수명.substring(1,3) + "시 ~ " + 변수명.. substring(4,6))
			수정가능..
			-> 입력을 할때 2개 입력폼 쓰셔야함. (s10e19 따로따로)
			-> 시작시간 입력하는 필드,
			-> 종료시간 입력하는 필드-->
				<h4><%out.println(times.substring(1,3) + "시 ~ " + times.substring(4,6) + "까지"); %></h4>
				OPEN : <input type="text" name="times1" class="form-control" value="<%=times.substring(1,3)%>s"/>
				CLOSE : <input type="text" name="times1" class="form-control" value="<%=times.substring(4,6)%>e"/>
			</td>
		</tr>
		<tr>
			<th>휴관일</th>
			<td>
				<input type="text" name="holiday" class="form-control" value="<%=holiday%>"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<input type="submit" value="전시관 정보수정" class="btn btn-success btn-block"/>
			</th>
		</tr>
	</table>
</div>
</section>			
		<%}while(rs.next());
	}else{out.println("조회 실패");}
%>
<%@ include file="./include/Footer.jsp" %>
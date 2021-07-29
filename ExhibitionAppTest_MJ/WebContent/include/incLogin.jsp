<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<%if(isLogin){%>
<section class="row">
	<div class="col-md-12">
	<p class="text-right">
		<strong class="text-info"><%=custname %></strong> 님 환영합니다. &nbsp;
		<a href="./LogOut.jsp" class="btn btn-default btn-xs">로그아웃</a>
	</p>
	<nav class="text-center btn-group btn-group-justified" role="group">
		<a href="Ticket.jsp" class="btn btn-danger">예매내역</a>
		<a href="Exhibition.jsp" class="btn btn-warning">전시회목록</a>
		<a href="Explace.jsp" class="btn btn-success">전시관목록</a>
		<a href="Reservation.jsp" class="btn btn-info">관람관구매</a>
		<a href="Customers.jsp" class="btn btn-primary">회원관리</a>
	</nav>
	</div>
</section>
	<%}else{ %>
	<form method="post" action="" id="LoginFrm" class="form-inline text-center">
		<label>아이디</label>
		<input type="text" name="custid" placeholder="아이디를 입력하세요" class="form-control"/>
		<label>비밀번호</label>
		<input type="password" name="custpwd" placeholder="비밀번호를 입력하세요" class="form-control "/>
		<input type="button" value="로그인" class="btn btn-sm btn-primary" onclick="Login()"/>
		<a href="Join.jsp" class="btn btn-sm btn-info">회원가입</a>
	</form>
	<%} %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>
<section class="row">
	<div class="col-md-12">
<br/><br/>
<h2 class="text-center text-primary">회원가입</h2>
<form name="JoinFrm">
<table class="table table-striped table-condensed">
	<tr>
		<th>아이디</th>
		<td><input type="text" class="form-control"  placeholder="숫자, 영문만 입력 가능" name="custid"/></td>
		<td>
		<div class="form-group form-inline">
			<input type="button" class="form-control btn btn-danger btn-block" value="ID중복체크" onclick="IDchk()"/>
		</div>
		<input type="hidden" value="n" name="isUnique"/>	
		</td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td colspan="2"><input type="password" class="form-control" name="pwd" placeholder="숫자,특수문자,영문 포함 8자리 이상 입력"/></td> 
	</tr>
	<tr>
		<th>비밀번호 확인</th>
		<td colspan="2"><input type="password" class="form-control" name="pwdchk" placeholder="숫자,특수문자,영문 포함 8자리 이상 입력" /></td>
	</tr>
	<tr>
		<th>이 름</th>
		<td colspan="2"><input type="text" class="form-control" name="custname" placeholder="한글로만 입력 가능"/></td>
	</tr>
	<tr>
		<th>이메일</th>
		<td colspan="2">
		<input type="email" class="form-control" name="email" placeholder="ovoovvo@ovo.com"/></td>
	</tr>
	<tr>
		<th>휴대폰번호</th>
		<td colspan="2"><input type="text" maxlength="13" name="phone"  class="form-control" placeholder="010-0000-0000 형식으로 입력하세요"/>
		</td>
	</tr>
	<tr>
		<th colspan="3">
			<input type="button" value="회 원 가 입" onclick="JoinChk()" class="btn btn-success btn-block" />
		</th>
	</tr>
</table>
</form>
</div>
</section>
<%@ include file="./include/Footer.jsp" %>
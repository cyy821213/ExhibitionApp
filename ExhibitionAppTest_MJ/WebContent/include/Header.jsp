<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="dbconn.jsp" %>
<%
	String custid  = (String)session.getAttribute("UID");
	String custname = (String)session.getAttribute("UNAME");

	boolean isLogin = false;
	
	if(custid != null){
		isLogin = true;
	}else{custid="";}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="./resource/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="./resource/css/style.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="./resource/js/script.js"></script>
<script>
function IDchk(){ 
	var chkID = document.JoinFrm.custid.value;
	if(chkID == ""){ 
		alert("중복 검사 할 아이디를 입력 해주세요.");
		document.JoinFrm.custid.focus();
		return;
	}
	window.open("IDchk.jsp?chkID=" + chkID,"a","width=900,height=350");
}

function JoinChk(){	
	var regExpId = /^[0-9a-z]+$/;
	var regExpName = /^[가-힣]+$/;
	var regExpPwd = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
	var regExpPhone = /^01([0|1|6|7|8|9]?)-?([0-9]{3,4})-?([0-9]{4})$/;
	var regExpEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	
	var form = document.JoinFrm;
	var id = form.custid.value;
	var pwd1 = form.pwd.value;
	var pwd2 = form.pwdchk.value;
	var custname = form.custname.value;
	var phone = form.phone.value; 
	var email = form.email.value;
	var isUnique = form.isUnique.value;
	if(!regExpId.test(id)){
		alert("아이디는 숫자, 영문만 입력 가능");
		return false;
	}
	if(isUnique != "y"){
		alert("아이디 중복 확인을 해주세요");
		return false;
	}
	if(!(pwd1==pwd2)){
		alert("비밀번호-비밀번호확인이 일치하지 않습니다.");
		return false;
	}
	if(!regExpPwd.test(pwd2)){
		alert("영문,숫자,특수문자 포함 8자리 이상 입력");
		return false;
	}
	if(!regExpPhone.test(phone)){
		alert("휴대폰번호 입력양식을 확인하세요");
		return false;
	}
	if(!regExpEmail.test(email)){
		alert("이메일 입력을 확인해주세요~");
		return false;
	}
	if(!regExpName.test(custname)){
		alert("이름은 한글로만 입력 가능합니다.");
		return false;
	}
	document.JoinFrm.action="JoinProc.jsp";
	document.JoinFrm.submit();
}

function CustFunc(chk,value){
	var frm = document.getElementById("CustModiFrm");
	if(chk=="m"){
		frm.action="CustModiFrm.jsp?UIDChk="+value;
		frm.submit();
	}else if(chk=="d"){
		frm.action="CustDel.jsp?UIDChk="+value;
		frm.submit();
	}
}
</script>
</head>
<body>
<div class="container">
<h2 class="text-center text-primary">전시회 예약&amp;관리 프로그램</h2>
<br/>























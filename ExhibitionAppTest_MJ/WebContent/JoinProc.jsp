<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%

	String inustid = request.getParameter("custid");
	String pwd = request.getParameter("pwd");
	String names = request.getParameter("custname");
	String email = request.getParameter("email");
	String phone = request.getParameter("phone");

	String sql = "insert into customers values(?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,inustid);
	pstmt.setString(2,pwd);
	pstmt.setString(3,email);
	pstmt.setString(4,names);
	pstmt.setString(5,phone);
	
	int rscnt = pstmt.executeUpdate();
	
	if(rscnt > 0){
		response.sendRedirect("index.jsp");
	}
	
	
%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%
custid = request.getParameter("custid");
String custpwd = request.getParameter("custpwd");

String sql = "select custid, custpwd, custname from customers where custid=?";

pstmt = conn.prepareStatement(sql);
pstmt.setString(1,custid);
rs = pstmt.executeQuery();

String msg = "존재하지 않는 아이디 입니다.";

if(rs.next()){
	if(custpwd.equals(rs.getString("custpwd"))){ 
	session.setAttribute("UID", custid);
	session.setAttribute("UNAME", rs.getString("custname"));
		 response.sendRedirect("index.jsp");
	 }	
	msg = "비밀번호를 잘못 입력하였습니다.";
}

out.println("<script>");
out.println("alert('"+msg+"')");
out.println("location.replace('index.jsp')");
out.println("</script>");

%>
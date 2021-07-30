<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="include/Header.jsp"%>
<%

	String codes = request.getParameter("codes");
	String placename = request.getParameter("placename");
	String contactno = request.getParameter("contactno");
	
	String n1 = request.getParameter("n1"); //09
	String n2 = request.getParameter("n2"); //18
	String times = "s"+n1+"e"+n2; // s09e18
	
	String holiday = request.getParameter("holiday");
	
	
	String sql = "update explace set placename = ?, contactno = ?, times = ?, holiday = ? where codes = ?"; 
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, placename);
	pstmt.setString(2, contactno);
	pstmt.setString(3, times);
	pstmt.setString(4, holiday);
	pstmt.setString(5, codes);
	
	int rs1 = pstmt.executeUpdate();
	if(rs1 > 0){
		out.println("<script>alert('수정 사항을 반영 하였습니다.'); location.replace('Explace.jsp');</script>");
	}


%>
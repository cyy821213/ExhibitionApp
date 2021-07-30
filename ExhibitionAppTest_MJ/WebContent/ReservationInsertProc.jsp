<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file = "./include/Header.jsp" %>
<%
	String dates = request.getParameter("sdate");
	String readate = request.getParameter("readate");
	int tprice = Integer.parseInt(request.getParameter("exprice"));
	int tcnt = Integer.parseInt(request.getParameter("tcnt"));
	String payment  = request.getParameter("payment");
	String nams = custname+ "(" + custid +")" ;
	
	String sql1 = "insert into tickets value(null,?,?,now(),?,?,?)";
	pstmt = conn.prepareStatement(sql1);
	pstmt.setString(1, nams);
	pstmt.setString(2, dates);
	pstmt.setInt(3, tprice);
	pstmt.setInt(4, tcnt);
	pstmt.setString(5, payment);

	int rs1 = pstmt.executeUpdate();
	if(rs1 > 0 ){
		response.sendRedirect("Reservation.jsp");
	}
%>
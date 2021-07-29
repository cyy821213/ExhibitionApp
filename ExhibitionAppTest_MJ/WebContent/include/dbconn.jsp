<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%
request.setCharacterEncoding("utf-8");	

Connection conn = null;

String location = "localhost:3306/";
String driver = "com.mysql.jdbc.Driver";
String dbNAME = "ExhibitionAppDB";
String url = "jdbc:mysql://" + location + dbNAME;


PreparedStatement pstmt = null;
ResultSet rs = null;

try{
	Class.forName(driver);
	conn = DriverManager.getConnection(url, "root", "1234");
	
}catch (Exception ex){
	out.println("<h3>DB연결 실패</h3>");
	out.println("에러 : " + ex.getMessage());
	ex.printStackTrace();
}
%>

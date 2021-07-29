<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%try{
	if(pstmt!=null){pstmt.close();}
	if(rs!=null){rs.close();}
	if(conn!=null){conn.close();}
} catch(Exception e){
	e.printStackTrace();
	out.println("오류 메세지 : " + e.getMessage());
}%>
</div>
</body>
</html>
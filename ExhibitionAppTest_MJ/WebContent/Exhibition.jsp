<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>

<section class="row">
<br/><br/>
<div class="col-md-12">
<h3 class="text-center">전시회 목록</h3>
<%
String sql = "select * from exhibition";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
   do{
      String exidx = rs.getString("exidx");
      String extitle = rs.getString("extitle");
      String genre = rs.getString("genre");
      String author = rs.getString("author"); 
      String rating = rs.getString("rating");
      String texts = rs.getString("texts"); 
      String placename = rs.getString("placename");
      int exprice = rs.getInt("exprice");
      String sdate = rs.getString("sdate");
      String edate = rs.getString("edate");
      String docent = rs.getString("docent");
%>
<div class="col-md-12">
<form action="ExhibitionModiProc.jsp" method="post" name="ExFrm<%=exidx%>">
<table class="table">
<tr class="active">
   <th>전시회고유코드</th>
   <th colspan="2">전시회명</th>
   <th>장르</th>
   <th>작가</th>
   <th>관람등급</th>
</tr>
<tr>
   <td><input type="text" name="exidx" value="<%=exidx %>" class="inputStyle" disabled/></td>
   <td colspan="2">
   <input type="text" name="extitle" value="<%=extitle %>" class="inputStyle"/>
   </td>
   <td>
   <input type="text" name="genre" value="<%=genre %>" class="inputStyle"/>
   </td>
   <td>
   <input type="text" name="author" value="<%=author %>" class="inputStyle"/>
   </td>
   <td>
   <input type="text" name="rating" value="<%=rating %>" class="inputStyle"/></td>
</tr>
<tr class="active">
   <th colspan="2">전시장소 정보</th>
   <th>관람료</th>
   <th>전시시작일자</th>
   <th>전시종료일자</th>
   <th>도슨트</th>
</tr>
<tr>
   <td colspan="2">
   <input type="text" name="placename" value="<%=placename %>" class="inputStyle"/></td>
   <td><input type="text" name="exprice" value="<%=exprice %>" class="inputStyle"/></td>
   <td><input type="date" name="sdate" value="<%=sdate %>" class="inputStyle"/></td>
   <td><input type="date" name="" value="<%=edate %>" class="inputStyle"/></td>
   <td><input type="text" name="docent" value="<%=docent %>" class="inputStyle"/></td>
</tr>
<tr>
   <th colspan="1"  class="active">전시회 설명</th>
   <td colspan="3">
      <textarea rows="4" name="texts"><%=texts %></textarea>
   </td>
   <td colspan="2" class="ver">
   <input type="submit" value="수정" class="btn btn-block canvas"/>
   </td>
</tr>
</table>
</form>
</div>
<p class="line">&nbsp;</p>
<%
      } while(rs.next());
   }else{
      out.println("조회실패");
   }
%>
</section>
<%@ include file="./include/Footer.jsp" %>
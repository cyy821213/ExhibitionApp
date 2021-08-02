<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/Header.jsp" %>
<%@ include file="./include/incLogin.jsp" %>

<section class="row">
<br/><br/>
<div class="col-md-12">
<h3 class="text-center">관람권 예약</h3>
<%
String sql = "select * from exhibition";
pstmt = conn.prepareStatement(sql);
rs = pstmt.executeQuery();
if(rs.next()){
   do{
      String extitle = rs.getString("extitle");
      String genre = rs.getString("genre");
      String author = rs.getString("author"); 
      String rating = rs.getString("rating");
      String texts = rs.getString("texts"); 
      String placename = rs.getString("placename");
      int exprice = rs.getInt("exprice");
      String sdate = rs.getString("sdate");
      String docent = rs.getString("docent");
%>
<div class="col-md-12">
<form action="ReservationInsertProc.jsp" method="post" >
<table class="table">
<tr class="active">
   <th colspan="2">전시회명</th>
   <th>장르</th>
   <th>작가</th>
   <th>관람등급</th>
   <th>도슨트</th>
</tr>
<tr>
   <td colspan="2">
   <input type="text" name="extitle" value="<%=extitle %>" class="inputStyle" readonly/> </td>
   <td><input type="text" name="genre" value="<%=genre %>" class="inputStyle" readonly/></td>
   <td><input type="text" name="author" value="<%=author %>" class="inputStyle" readonly/></td>
   <td><input type="text" name="rating" value="<%=rating %>" class="inputStyle" readonly/></td>
   <td><input type="text" name="docent" value="<%=docent %>" class="inputStyle" readonly/></td>
</tr>
<tr class="active">
   <th colspan="2">전시장소 정보</th>
   <th>관람료</th>
   <th>관람일자</th>
   <th>티켓매수</th>
   <th>결재수단</th>
</tr>
<tr>
   <td colspan="2">
   <input type="text" name="placename" value="<%=placename %>" class="inputStyle" readonly/></td>
   <td><input type="text" name="exprice" value="<%=exprice %>" class="inputStyle" readonly/></td>
   <td><input type="date" name="sdate" value="<%=sdate %>" class="form-control" /></td>
   <td><input type="number" name="tcnt" value="1" class="form-control"/></td>
   <td>
   	<select name="payment" class="form-control">
   		<option value="신용카드" >신용카드</option>
   		<option value="계좌이체" >계좌이체</option>
   	</select>
   </td>
</tr>
<tr>
   <th colspan="1"  class="active">전시회 설명</th>
   <td colspan="3">
      <textarea rows="4" name="texts" readonly><%=texts %></textarea>
   </td>
   <td colspan="2" class="ver">
   <input type="submit" value="예매하기" class="btn btn-block btn-info style"/>
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
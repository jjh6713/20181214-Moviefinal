<%@ page contentType = "text/html; charset=utf-8" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<h1 style="text-align: center"> 영화 관리 </h1>

<%
	Paging set = new Paging();
	
	int pg = 1; //기본 페이지
	
	if(request.getParameter("pg")!=null) { //pg값 받아오면 저장
		pg = Integer.parseInt(request.getParameter("pg")); 
	}
	set.setStart(pg); //시작
	set.setStartBlock(pg); //시작블럭
	set.setEnd(pg); //끝
	set.setEndBlock(pg); //끝블럭
	
	ArrayList<Integer> ct = set.count();
	
	set.setAllPage(ct.get(1)); //전체 페이지
	
	if(set.getEndBlock() > set.getAllPage()) {
		set.MoreBlock();
	}
	ArrayList<MovieItem> item = BoardMethod.ItemCreate(set.getStart(),set.getEnd()); 
%>

<div class="container">
	<hr>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>영화이름</th>
			<th>영화감독</th>	
			<th>영화개봉일</th>	
			<th></th>

		</tr>
		</thead>
		<tbody>
		<%
			if(ct.get(1)==0){
				out.println("<tr>");
				out.println("<td>등록된 영화가 없습니다.</td>");
				out.println("</tr>");
			}else{
				int i=0;
				for(;i<item.size();i++){
					out.println("<tr>");
					out.println("<td>"+item.get(i).getItem_name()+"</td>");
					out.println("<td>"+item.get(i).getItem_director()+"</td>");
					out.println("<td>"+item.get(i).getItem_date()+"</td>");
					out.println("<td>");
					out.println("<button type=\"button\" class=\"btn btn-outline-dark\"><a href=\"main.jsp?KEY="+item.get(i).getItem_name()+"&CONTENTPAGE=contentSub/contentSub4_update.jsp\">수정</a></button>");
					out.println("<button type=\"button\" class=\"btn btn-outline-dark\"><a href=\"main.jsp?KEY="+item.get(i).getItem_name()+"&CONTENTPAGE=contentSub/contentSub4_delete.jsp\">삭제</a></button>");
					out.println("</td>");
					out.println("</tr>");
				}
			}
		 %>
		</tbody>
	</table>
	<hr/>
	<button type="button" class="btn btn-outline-dark"><a href="main.jsp?CONTENTPAGE=contentSub/contentSub4_insert.jsp">영화 추가</a></button>
	
	<div class="pager">
		<ul class="pagination justify-content-center">
       <%
			if(pg>set.getBLOCK()) {
				//out.println("<a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg=1\">◀◀</a>");
				out.println("<li class=\"page-item\"><a class=\"page-link\" aria-label=\"Previous\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub4.jsp?pg="+(set.getStartBlock()-1)+"\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
			}
			for(int i=set.getStartBlock(); i<= set.getEndBlock(); i++){
				if(i==pg){
					out.println("<li class=\"page-item active\"><a class=\"page-link  \">"+i+"</a></li>");
				}else{
					out.println("<li class=\"page-item\"><a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub4.jsp?pg="+i+"\">"+i+"</a></li>");
				}
			}
			if(set.getEndBlock()<set.getAllPage()){
				out.println("<li class=\"page-item\"><a class=\"page-link\" aria-label=\"Next\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub4.jsp?pg="+(set.getEndBlock()+1)+"\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li>");
				//out.println("<a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg="+set.getAllPage()+"\">▶▶</a>");
			}
		%>
		</ul>
	</div> 
</div>
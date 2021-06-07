<%@ page contentType = "text/html;" pageEncoding="UTF-8"%>
<%@page import="movie.*"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>

<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<h1 style="text-align: center"> 영화 리뷰 </h1>

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

	set.setAllPage(ct.get(2)); //전체 페이지

	if(set.getEndBlock() > set.getAllPage()) {
		set.MoreBlock();
	}
	
	ArrayList<MovieBoard> board = BoardMethod.BoardCreate(set.getStart(),set.getEnd());

%>

<div class="container">
	<hr>
	<table class="table table-hover">
		<thead>
		<tr>
			<th>No</th>
			<th>작성자</th>	
			<th>영화제목</th>	
			<th>100자평</th>
			<th>평점</th>
			<th>날짜</th>	
			<th>삭제</th>	
		</tr>
		</thead>
		<tbody>
		<%
			if(ct.get(2)==0){
				out.println("<tr>");
				out.println("<td>등록된 글이 없습니다.</td>");
				out.println("</tr>");
			}else{
				int i=0;
				for(;i<board.size();i++){
					out.println("<tr>");
					out.println("<td>"+board.get(i).getBoard_no()+"</td>"); // no
					out.println("<td>"+board.get(i).getMember_id()+"</td>"); //작성자
					out.println("<td>"+board.get(i).getItem_name()+"</td>"); //제목
					out.println("<td>"+board.get(i).getBoard_review()+"</td>"); // 리뷰
					out.println("<td>"+board.get(i).getBoard_rating()+"</td>");  //평점
					out.println("<td>"+board.get(i).getBoard_date()+"</td>"); //날자
					if(session.getAttribute("loginLv") != null){
						if(session.getAttribute("loginLv").equals("1")) {
							out.println("<td><button type=\"button\" class=\"btn btn-outline-dark\"><a href=\"main.jsp?KEY="+board.get(i).getBoard_no()+"&CONTENTPAGE=contentSub/contentSub3_delete.jsp\">삭제</a></button></td>");
						}else if((board.get(i).getMember_id()).equals(session.getAttribute("loginId"))){
							out.println("<td><button type=\"button\" class=\"btn btn-outline-dark\"><a href=\"main.jsp?KEY="+board.get(i).getBoard_no()+"&CONTENTPAGE=contentSub/contentSub3_delete.jsp\">삭제</a></button></td>"); //버튼
						}
					}
					out.println("</tr>");
				}
			}
		 %>
		</tbody>
	</table>
	<hr/>
	<button type="button" class="btn btn-outline-dark"><a href="main.jsp?CONTENTPAGE=contentSub/contentSub3_write.jsp">글쓰기</a></button>

	<div class="pager">
		<ul class="pagination justify-content-center">
       <%
			if(pg>set.getBLOCK()) {
				//out.println("<a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg=1\">◀◀</a>");
				out.println("<li class=\"page-item\"><a class=\"page-link\" aria-label=\"Previous\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg="+(set.getStartBlock()-1)+"\"><span aria-hidden=\"true\">&laquo;</span><span class=\"sr-only\">Previous</span></a></li>");
			}
			for(int i=set.getStartBlock(); i<= set.getEndBlock(); i++){
				if(i==pg){
					out.println("<li class=\"page-item active\"><a class=\"page-link  \">"+i+"</a></li>");
				}else{
					out.println("<li class=\"page-item\"><a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg="+i+"\">"+i+"</a></li>");
				}
			}
			if(set.getEndBlock()<set.getAllPage()){
				out.println("<li class=\"page-item\"><a class=\"page-link\" aria-label=\"Next\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg="+(set.getEndBlock()+1)+"\"><span aria-hidden=\"true\">&raquo;</span><span class=\"sr-only\">Next</span></a></li>");
				//out.println("<a class=\"page-link\" href=\"main.jsp?CONTENTPAGE=contentSub/contentSub3.jsp?pg="+set.getAllPage()+"\">▶▶</a>");
			}
		%>
		</ul>
	</div>  
</div>
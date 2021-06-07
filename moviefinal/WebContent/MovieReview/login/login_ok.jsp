<%@page import="movie.MovieMember"%>
<%@page import="movie.MemberMethod"%>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");

	int ck = MemberMethod.loginCheck(id,pw);
	String pass="";	
	
	if(ck == 1){
		pass="../main.jsp";
		MovieMember member = MemberMethod.SearchMember(id);
		session.setAttribute("loginId", member.getMember_id());
		session.setAttribute("loginLv", member.getMember_lv());
	}else if(ck == 0){
		pass="login.jsp?pass=0";
	}else if(ck == -1){
		pass="login.jsp?pass=-1";		
	}
	response.sendRedirect(pass);
%>


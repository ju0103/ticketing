<%@page import="ticketing.manager.ManagerDBBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	int p_code = Integer.parseInt(request.getParameter("p_code"));
	String path = request.getRealPath("upload");
	int size=1024*1024;
	int fileSize=0;
	String file="";
	String oriFile="";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file = multi.getFilesystemName(str);
	
	PerformanceBean board = new PerformanceBean();
	
	String mid = session.getAttribute("manager_id").toString();
	System.out.println("@@@### manager_pwd : "+ mid);
	String mpwd = multi.getParameter("delete_pwd");
	
	System.out.println("@@@### manager_pwd : "+ mpwd);
	
	String addr = multi.getParameter("p_area")+" ";
	String detailaddr = multi.getParameter("p_detailarea");
	String area = addr+detailaddr;
	
	
	if(file != null){
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
		
	board.setP_type(multi.getParameter("p_type"));
	board.setP_title(multi.getParameter("p_title"));
	board.setP_fname(multi.getParameter("p_fname"));
	board.setP_area(area);
	board.setP_date(multi.getParameter("p_date"));
	board.setP_performer(multi.getParameter("p_performer"));
	board.setP_price(Integer.parseInt(multi.getParameter("p_price")));
	board.setP_seat(Integer.parseInt(multi.getParameter("p_seat")));
	board.setP_description(multi.getParameter("p_description"));
	board.setP_rating(Integer.parseInt(multi.getParameter("p_rating")));
	board.setP_time(Integer.parseInt(multi.getParameter("p_time")));
	
	if(file != null){
		board.setP_fname(file);
		board.setP_fsize(fileSize);
		board.setP_rfname(oriFile);
	}
	
	PerformanceDBBean pdb = PerformanceDBBean.getInstance();
	int re = pdb.editBoard(board, mid, mpwd, p_code);
	if(re == 1){
		%>
		<script>
			alert("수정되었습니다.");
			document.location.href="manager_performance_List.jsp";
		</script>
		<%
	}else if(re ==0){
		%>
		<script>
			alert("비밀번호가 맞지 않습니다.");
			history.go(-1);
		</script>
		<%
	}
%>
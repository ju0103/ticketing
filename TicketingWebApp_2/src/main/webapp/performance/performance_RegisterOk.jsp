<%@page import="java.net.URLEncoder"%>
<%@page import="myUtil.HanConv"%>
<%@page import="ticketing.manager.ManagerDBBean"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ticketing.performance.PerformanceDBBean"%>
<%@page import="java.sql.Date"%>
<%@page import="ticketing.performance.PerformanceBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
	ManagerDBBean mnagerdb = ManagerDBBean.getInstance();
	String path = request.getRealPath("upload");
	int size=1024*1024;
	int fileSize=0;
	String file="";
	String oriFile="";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file = multi.getFilesystemName(str);
	
	String manager_id = session.getAttribute("manager_id").toString();
	String check_pwd = multi.getParameter("manager_pwd");
	int re = mnagerdb.managerCheck(manager_id, check_pwd);
	if(re==0){
%>
	<script>
		alert("비밀번호가 다릅니다.")
		history.go(-1);
	</script>
<%
	}else if(re==1){
	
	PerformanceBean board = new PerformanceBean();
	Timestamp regdate = new Timestamp(System.currentTimeMillis());
	
	String addr = multi.getParameter("p_area")+" ";
	String detailaddr = multi.getParameter("p_detailarea");
	String area = addr+detailaddr;
	
	
	if(file != null){
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
		board.setP_type(multi.getParameter("p_type"));
		board.setP_title(multi.getParameter("p_title"));
		board.setP_area(area);
		board.setP_date(multi.getParameter("p_date"));
		board.setP_performer(multi.getParameter("p_performer"));
		board.setP_price(Integer.parseInt(multi.getParameter("p_price")));
		board.setP_seat(Integer.parseInt(multi.getParameter("p_seat")));
		board.setP_description(multi.getParameter("p_description"));
		board.setP_rating(Integer.parseInt(multi.getParameter("p_rating")));
		board.setP_regdate(new Timestamp(System.currentTimeMillis()));
		board.setP_time(Integer.parseInt(multi.getParameter("p_time")));
		
		if(file != null){
			board.setP_fname(file);
			board.setP_fsize(fileSize);
			board.setP_rfname(oriFile);
		}
		
		PerformanceDBBean pdb = PerformanceDBBean.getInstance();
		if(pdb.insertBoard(board) == 1){
			
			response.sendRedirect("manager_performance_List.jsp");
		}else{
			response.sendRedirect("performance_RegisterForm.jsp");
		}
	}
%>

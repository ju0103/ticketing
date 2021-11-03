<%@page import="ticketing.info.BoardDBBean"%>
<%@page import="ticketing.info.BoardBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String path = request.getRealPath("upload");
	int size = 1024 * 1024;
	int fileSize = 0;
	String file = "";
	String oriFile = "";
	
	MultipartRequest multi = new MultipartRequest(request, path, size, "euc-kr", new DefaultFileRenamePolicy());
	Enumeration files = multi.getFileNames();
	String str = (String)files.nextElement();
	file = multi.getFilesystemName(str);
	
	if(file != null) {
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}
	BoardBean board=new BoardBean();
	
	board.setB_id(Integer.parseInt(multi.getParameter("b_id")));
	board.setB_ref(Integer.parseInt(multi.getParameter("b_ref")));
	board.setB_step(Integer.parseInt(multi.getParameter("b_step")));
	board.setB_level(Integer.parseInt(multi.getParameter("b_level")));
	board.setB_name(multi.getParameter("b_name"));
	board.setB_title(multi.getParameter("b_title"));
	board.setB_content(multi.getParameter("b_content"));
	board.setB_pwd(multi.getParameter("b_pwd"));
	
	if(file != null) {
		board.setB_fname(file);
		board.setB_fsize(fileSize);
		board.setB_rfname(oriFile);
	}
	
	board.setB_date(new Timestamp(System.currentTimeMillis()));

	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	
	board.setB_ip(ip);

	BoardDBBean db = BoardDBBean.getInstance();
	
	if(db.insertBoard(board) == 1){
		%>
		<script type="text/javascript">
			history.go(-2);
		</script>
		<%
	}
%>
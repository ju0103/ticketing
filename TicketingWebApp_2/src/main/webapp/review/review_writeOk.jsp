<%@page import="ticketing.review.ReviewDBBean"%>
<%@page import="ticketing.review.ReviewBean"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.jspsmart.upload.File"%>
<%@page import="com.jspsmart.upload.SmartUpload"%>
<%@page import="java.net.InetAddress"%>
<%@page import="java.sql.Timestamp"%>
<%@ page language="java" contentType="text/html; charset=euc-kr"
    pageEncoding="euc-kr"%>
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
	
	int p_code = Integer.parseInt(multi.getParameter("p_code"));

	if(file != null) {
		oriFile = multi.getOriginalFileName(str);
		fileSize = file.getBytes().length;
	}

	ReviewBean board = new ReviewBean();
	board.setPerform_code(p_code);
	board.setReview_id(Integer.parseInt(multi.getParameter("r_id")));
	board.setReview_name(multi.getParameter("r_name"));
	board.setReview_title(multi.getParameter("r_title"));
	board.setReview_content(multi.getParameter("r_content"));
	board.setReview_pwd(multi.getParameter("r_pwd"));
	
	if(file != null) {
		board.setReview_fname(file);
		board.setReview_fsize(fileSize);
		board.setReview_rfname(oriFile);
	}
	// set r_date	
	board.setReview_date(new Timestamp(System.currentTimeMillis()));
	// set r_ip
	InetAddress address = InetAddress.getLocalHost();
	String ip = address.getHostAddress();
	board.setReview_ip(ip);
	
	ReviewDBBean db = ReviewDBBean.getInstance();
	if(db.insertBoard(board, p_code) == 1){
		response.sendRedirect("review_list.jsp?p_code=" + p_code);
	} else {
		%>
		<script type="text/javascript">
			alert("error");
			history.go(-1);
		</script>
		<%
	}
%>
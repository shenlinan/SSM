<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <table width="60%" border="1" cellpadding="2" cellspacing="0">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>JOB</th>
        </tr>
        <tr>
            <td>${user.id }</td>
            <td>${user.name }</td>
            <td>${user.job }</td>
        </tr>
    </table><br>
    
    <a href="../index.jsp">返回</a>
</body>
</html>
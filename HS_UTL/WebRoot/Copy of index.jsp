<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:forward page="WEB-INF/pages/index.jsp"></jsp:forward>
</head>
<body>
查询所有：<br>
<a href="user/list">List All</a><br><br>
    <a href="user/index">Index page</a><br><br>
    新增：<br><form action="user/add">
        ID:<input type="text" name="id"><br>
        NAME:<input type="text" name="name"><br>
        JOB:<input type="text" name="job"><br>
        <input type="submit" value="提交">
    </form><br>
    
    删除：<br><form action="user/delete">
        输入要删除的ID：<input type="text" name="id"><input type="submit" value="提交"><br>
    </form><br>
    
    查询：<br><form action="user/get">
        输入要查询的ID：<input type="text" name="id"><input type="submit" value="提交"><br>
    </form><br>
    
    修改：<br><form action="user/update">
        根据ID来改，不支持修改ID，输入的名字，工作为修改值：<br>
        ID:<input type="text" name="id"><br>
        NAME:<input type="text" name="name"><br>
        JOB:<input type="text" name="job"><br>
        <input type="submit" value="提交">
    </form><br>
</body>
</html>
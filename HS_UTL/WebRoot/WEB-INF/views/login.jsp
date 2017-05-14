<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>HS-Under The Line.</title>

		<!-- Bootstrap Core CSS -->
		<link href="../vendor/bootstrap/css/bootstrap.min.css"
			rel="stylesheet">

		<!-- MetisMenu CSS -->
		<link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

		<!-- Custom CSS -->
		<link href="../dist/css/sb-admin-2.css" rel="stylesheet">

		<!-- Custom Fonts -->
		<link href="../vendor/font-awesome/css/font-awesome.min.css"
			rel="stylesheet" type="text/css">

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	</head>

	<body
		style="background-image: url(../css/img/login2.jpg); background-repeat: no-repeat; background-size: 100% 183%;">

		<div class="container">
			<div class="row">
				<div class="col-md-4 col-md-offset-4" style="right: -400px;">
					<div class="login-panel panel panel-default">
						<div class="panel-heading">
							<h3 class="panel-title">
								请登录
							</h3>
						</div>
						<div class="panel-body">
							<form role="form">
								<fieldset>
									<div class="form-group">
										<input id="userName" class="form-control" placeholder="电子邮箱"
											name="username" type="email" autofocus>
									</div>
									<div class="form-group">
										<input id="passWord" class="form-control" placeholder="密码"
											name="password" type="password" value="">
									</div>
									<div class="alert alert-danger" style="display: none;">
									</div>
									<div class="checkbox">
										<label>
											<input name="remember" type="checkbox" value="Remember Me">
											记住我
										</label>
									</div>
									<!-- Change this to a button or input when using this as a form -->
									<a href="javascript:volid(0);" class="btn btn-primary btn-success btn-block"
										id="login_btn">登录</a>
									<br>
									<button type="button" class="btn btn-link">
										忘记密码？
									</button>

									<!--<a href="register" style="margin-left: 100px;">免费申请通行证</a>-->
									<button type="button" class="btn btn-link"
										style="margin-left: 30%;" onclick=window.location.href='register';>
										免费申请通行证
									</button>
								</fieldset>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- jQuery -->
		<script src="../vendor/jquery/jquery.min.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

		<!-- Metis Menu Plugin JavaScript -->
		<script src="../vendor/metisMenu/metisMenu.min.js"></script>

		<!-- Custom Theme JavaScript -->
		<script src="../dist/js/sb-admin-2.js"></script>

		<script type="text/javascript">
	$(function() {

		$("#login_btn").click(function() {
			
			var userName = $("#userName").val();
			var passWord = $("#passWord").val();
			if("" == userName || "" == passWord)
			{
				 $(".alert-danger").html("电子邮箱或者密码为空！");
				 $(".alert-danger").show();
				 return;
			}
			$(".alert-danger").hide();
			$.ajax({  
		       url:"loginIn", 
		       type:"POST",  
		       data:{username : userName,password : passWord},
		       dataType: 'json',  
		       success:function(data)
		       {  
		          if(data.code == "200200")
		          {
		        	window.location.href = "../index.jsp";
		          }
		          else
		          {
		        	 $(".alert-danger").html("用户名或者密码不正确！");
		        	 $(".alert-danger").show();
		          }
		       }, 
		       error:function(data)
		       {  
		          $(".alert-danger").html("系统内部错误，请稍候重试！");
		          $(".alert-danger").show(); 
		       }
		       });  
		});
	});
	
</script>
	</body>
</html>
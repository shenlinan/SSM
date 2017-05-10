<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HS-Under The Line.</title>

    <!-- Bootstrap Core CSS -->
    <link href="../vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="../vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="../dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="../vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script type="text/javascript">
	//注册
		function regist(){
			 $(".alert-danger").hide();
			var userName = $("#userName").val();
			var passWord = $("#passWord").val();
			var rePassWord = $("#rePassWord").val();
			if("" == userName || "" == passWord)
			{
				 $(".alert-danger").html("电子邮箱或者密码为空！");
				 $(".alert-danger").show();
				 return;
			}
			
			if(passWord != rePassWord)
			{
				$(".alert-danger").html("两次密码不一致！");
				 $(".alert-danger").show();
				 return;
			}
			
			$.ajax({type:'post',
			        url:'regist.action',
			        data:{userName:userName,passWord:passWord},
			        dataType:'json',
			        success:function(info){
			        	if(info.msg == "1"){
			        	 	alert("reg success!");
			        	}else{
			        		$(".alert-danger").html("注册失败！");
				 			$(".alert-danger").show();
			        	}
			        },
			        error:function(){alert("reg failed!");}});
		}
		
		function showModalLabel()
		{
			$("#myModal").show();
		}
</script>
</head>

<body style="background-image: url(../css/img/regedit4.jpg);background-repeat: no-repeat;background-size: 100% 183%;">

    <div class="container" >
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">邮箱注册</h3>
                    </div>
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input id="userName" class="form-control" placeholder="电子邮箱" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input id="passWord" class="form-control" placeholder="密码" name="password" type="password" value="">
                                </div>
                                <div class="form-group">
                                    <input id="rePassWord" class="form-control" placeholder="确认密码" name="repassword" type="password" value="">
                                </div>
                                <div class="alert alert-danger" style="display: none;">
                            	</div>
                            	 <div class="checkbox" >
                                    <label>
                                        <input name="agree" type="checkbox" value="">我同意该<a class="btn btn-outline btn-info btn-xs" data-toggle="modal" data-target="#myModal">隐私政策</a>中规定的各项条款
                                    </label>
                                </div>
                                <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                                <div class="modal-dialog">
                                    <div class="modal-content">
                                        <div class="modal-header">
                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                                            <h4 class="modal-title" id="myModalLabel">隐私政策</h4>
                                        </div>
                                        <div class="modal-body">
                                  		      这里是内容。。。
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">确定</button>
                                        </div>
                                    </div>
                                    <!-- /.modal-content -->
                                </div>
                                <!-- /.modal-dialog -->
                            </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="#" class="btn btn-primary btn-success btn-block" onclick="regist()">注册</a>
                                <button type="button" class="btn btn-outline btn-primary btn-block" onclick="window.location.href = 'login'">已有通行证了？</button>
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

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>修改密码</title>
</head>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css"/>
	<style type="text/css">
		.login-box{
			width: 600px;
			background-color: #f8f8f8;
			opacity:0.9;
			padding: 40px;
			margin: 0 auto;
			border: 6px;
			margin-top: 150px;
			text-align:center;
		}
		input{
			margin: 10px;
			margin-bottom:40px;
			background-color: white;
			opacity:1;
		}
		.image{
			width:320px;
			z-index:100;
			position:absolute;
			top:80px;
			left:380px;
		}
		.image1{
			width:600px;
			z-index:-100;
			position:absolute;
			top:200px;
			left:800px;
		}
	</style>
	<body>
	<div id="container">
	<header id="top"> <!--头部通栏-->
	<div class="container-fluid top-bar">
		<div class="row">
			<div class="col-md-8"></div>
			<div class="col-md-4 text-right">
				<table>
					<tr>
						<%
							if (session.getAttribute("u_name") == null) {
						%>
						<td>欢迎，请<a href="login&regist.jsp" style="color: red">登录</a>
						</td>
						
						<%
							} else {
						%>
						<td>欢迎,<strong
							style="color: red; font-size: 14px; margin-left: 10px"><%=session.getAttribute("u_name")%></strong></td>
							<td><a href="Out.do">登出 </a>  </td>

						<%
							}
						%>

						<td><a href="personal.do">我的主页</a></td>
						<td
							onclick="location.href='card.do?u_id=<%=session.getAttribute("u_id")%>'">
							<img src="img/购物 车.png" />&nbsp; 购物车
						</td>
						<td onclick="location.href='index.do'">首页</td>
						
					</tr>
				</table>
			</div>
		</div>
	</div>
</header>
		<img class="image1" alt="" src="./img/upPwd1.png">
		<img class="image" alt="" src="./img/upPwd.png">
		
		<div class="login-box">
		        <h2>修改密码</h2><br/>
		        <form id="form3" name="form3">
		          <div class="user-box">
		            <input class="form-control" type="password" name="old_pwd" required onclick="isnull()" placeholder="请输入原密码">
		          </div>
		          <div class="user-box">
		            <input class="form-control" type="password" name="new_pwd" required onclick="isnull()" placeholder="请输入新密码">
		              <font id="see"></font>
		          </div>
		            <a>
		                <input type="button" onclick="change_p(this.form)" value="SUBMIT" class="btn btn-primary">
		                <span></span>
		                <span></span>
		                <span></span>
		            </a>
		        </form>
		</div>
		
</div>
    <script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
    <script>

        function  change_p(form3) {
        	var old_pwd=form3.old_pwd.value
        	var new_pwd=form3.new_pwd.value
            if(form3.old_pwd.value==""||form3.new_pwd.value==""){
                document.getElementById("see").innerText="密码框不能为空";
            }

            else if(form3.old_pwd.value==form3.new_pwd.value){
                document.getElementById("see").innerText="新密码与旧密码相同";
            }

            else {
                $.ajax({
                    type: "POST",
                    dataType: "text",
                    url: "user/updataPwd1.do",
                    data: "old_pdw="+old_pwd+"&new_pwd="+new_pwd,
                    success: function (result) {
                        if (result == "0"){
                            document.getElementById("see").innerText = "旧密码不正确！";
                        }
                        if(result == "1"){
                            document.getElementById("see").innerText = "密码修改成功！";
                        }
                    },
                    error: function () {
                        alert("修改异常，请稍后再试！");
                    }
                });
            }
        }

        function isnull()
        {
            document.getElementById("see").innerText="";
        }
    </script>
</body>
</html>
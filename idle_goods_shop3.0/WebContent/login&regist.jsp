<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="${pageContext.request.contextPath}/resources/css/l&r.css" rel="stylesheet" type="text/css" media="all" />
<!--js-->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<!-- 登陆js -->
<script type="text/javascript">
	function judge(){
		var name=$("#name").val();
		var pwd=$("#pwd").val();
		var identity = $('input[name="identity"]:checked').val();
		var checkNum=$("#checkNum").val();
		//alert(identity+name+pwd);
		if(identity==1){
			//location.href="userIndex.jsp";
			//alert("用户用户！");
			if(name && pwd){  //name和pwd非空
				$.ajax({
					url:'user/login.do',
					data:'u_sid='+name+'&u_pwd='+pwd+'&checkNum='+checkNum,
					dataType:'json',
					type:'post',
					success:function(result){
						if(result!=null){
							if(result==0){
								alert("验证码输入错误！请重新输入！");
							}else{
								if(result==1){
									alert("登陆成功！");
									location.href="index.do";
								}
								if(result==2){
									alert("账号审核中！");
									location.href="login&regist.jsp";
								}
								if(result==3){
									alert("账号封禁中！");
									location.href="login&regist.jsp";
								}
								if(result==4){
									alert("密码错误！");
									location.href="login&regist.jsp";
								}if(result==5){
									alert("账户不存在！");
									location.href="login&regist.jsp";
								}
							}
						}
					}
				});
			}else{
				alert("请认真填写信息！");
			}
		}else if(identity==2){
			//alert(identity+"管理员管理员！");
			if(name && pwd){ //name和pwd非空
				$.ajax({
					url:'admin/login.do',
					data:'a_name='+name+'&a_pwd='+pwd+'&checkNum='+checkNum,
					dataType:'json',
					type:'post',
					success:function(result){
						if(result!=null){
							if(result==0){
								alert("验证码输入错误！请重新输入！");
							}else{
								if(result==1){
									alert("登陆成功！");
									location.href="manager.jsp";
								}
								if(result==2){
									alert("密码错误！");
									location.href="login&regist.jsp";
								}
								if(result==3){
									alert("账户不存在！");
									location.href="login&regist.jsp";
								}
							}
						}
					}
				});
			}else{
				alert("请认真填写信息！");
			}
		}else{
			alert("请认真填写信息！");
			location.href="login&regist.jsp";
		}
	}
	
	function getPic(){
        $("#checkCode").attr("src","user/checkCode.do?flag="+Math.random());
    };
</script>
<!-- 注册js -->
<style>
.sid_error{
    
}
</style>
<script type="text/javascript">
    function check(){
    	var u_sid=$("#u_sid");
    	//var isok=$("#isok");
    	var sid=u_sid.val();
    	//alert(sid);
    	$.ajax({
			url:'user/findById.do',
			data:'u_sid='+sid,
			dataType:'text',
			type:'post',
			success:function(result){
				//var tip="";
				if(result!=null){
					if(result==1){
						//tip="账号已存在";
						//isok.html("账号已存在");
						alert("账号已存在");
						//u_sid.addClass("sid_error");
					}else{
						//tip="";
						//isok.html(tip);
						//u_sid.removeClass("sid_error");
					}
				}
			}
		});
    }
	function reg(){
		var u_name=$("#u_name").val();
		var u_sid=$("#u_sid").val();
		var u_pwd=$("#u_pwd").val();
		var u_margin=$("#u_margin").val();
		var u_class=$("#u_class").val();
		//alert(u_name+u_sid+u_pwd+u_margin+u_class);
		if(u_name && u_sid && u_pwd && u_margin && u_class){
			$.ajax({
				url:'user/reg.do',
				data:'u_name='+u_name+'&u_pwd='+u_pwd+'&u_sid='+u_sid+'&u_class='+u_class+'&u_margin='+u_margin,
				dataType:'text',
				type:'post',
				success:function(result){
					if(result!=null){
						alert("注册成功！请耐心等待审核！");
						location.href="login&regist.jsp";
					}
				}
			});
		}else{
			alert("请认真填写信息！");
		}
	}
</script>
<!-- 切换登陆注册js -->
<script src="${pageContext.request.contextPath}/resources/js/easyResponsiveTabs.js" type="text/javascript"></script>
	<script type="text/javascript">
		$(document).ready(function () {
			$('#horizontalTab').easyResponsiveTabs({
				type: 'default',
				width: 'auto',
				fit: true   
			});
		});
	   </script>
<!--//js-->
</head>
<body>
	<!-- main -->
	<div class="main">
		<div class="logo"></div>
		<div class="main-info">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
					<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab"><h2><span>登陆</span></h2></li>
						<li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>注册</span></li>
						<div class="clear"> </div>
					</ul>				  	 
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-0">
							<div class="login-top">
								<form>
									<input type="text" class="name" name="name" id="name" placeholder="账号" required=""/>
									<input type="password" class="password" name="pwd" id="pwd" placeholder="密码" required=""/>
									<input type="text" class="checkNum" name="checkNum" id="checkNum" placeholder="验证码"><img src="user/checkCode.do" id="checkCode" title="看不清，点击换一张" alt="" width="100" height="32" style="height:43px;cursor:pointer;" onclick="getPic()"/>	
									<input type="radio" name="identity" id="identity1" value="1"><label for="identity1"><span></span>学生</label>
									<input type="radio" name="identity" id="identity2" value="2"><label for="identity2"><span></span>管理员</label>		
								<div class="login-bottom">
									<ul>
										<li>
											<a href="forgetPwd.jsp">忘记密码?</a>
										</li>
										<li>
											<input type="button" value="登陆" onclick="judge()"/>
										</li>
									</ul>
									<div class="clear"></div>
								</div>	
								</form>
							</div>
						</div>
						<div class="tab-1 resp-tab-content" aria-labelledby="tab_item-1">
							<div class="login-top sign-top">
								<form>
									<input type="text" class="name active" name="u_name" id="u_name" placeholder="姓名" required=""/>
									<input type="text" class="sid" name="u_sid" id="u_sid"  onchange="check()" placeholder="学号" required=""/>
									<input type="password" class="password" name="u_pwd" id="u_pwd" placeholder="密码" required=""/>		
									<input type="text" class="margin" name="u_margin" id="u_margin" placeholder="专业" required=""/>
									<input type="text" class="class" name="u_class" id="u_class" placeholder="班级" required=""/>
								<div class="login-bottom">
									<ul>
										<li>
											<a href="forgetPwd.jsp">忘记密码?</a>
										</li>
										<li>
											<input type="button" value="注册" onclick="reg()" />
										</li>
									</ul>
									<div class="clear"></div>
								</div>
							</form>	
							</div>
						</div>
					</div>	
				</div>
				<div class="clear"> </div>
			</div>
		</div>	
		<!--copyright-->
		<div class="copyright">
			<p>COPYRIGHT &copy; 陈益 &emsp; 董丽荣 &emsp; 王晏</p>
			<p>南昌大学软件学院</p>
			<p>电话：19979404672&emsp; &emsp;邮箱1159428961@qq.com</p>
		</div>
		<!--//copyright-->
	</div>	
</body>
</html>

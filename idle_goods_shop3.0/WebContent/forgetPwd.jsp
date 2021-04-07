<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>忘记密码</title>
</head>
<link href="${pageContext.request.contextPath}/resources/css/l&r.css" rel="stylesheet" type="text/css" media="all" />
<!--js-->
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">
	function updatePwd(){
		var u_sid=$("#u_sid").val();
		var u_pwd=$("#u_pwd").val();
		var u_pwd1=$("#u_pwd1").val();
		var checkNum=$("#checkNum").val();
		alert(u_sid+u_pwd+u_pwd1+checkNum);
		if(u_sid && u_pwd && u_pwd1 && checkNum){
			if(u_pwd!=u_pwd1){
				alert("密码输入不一致！请重新输入！");
			}else{
				 $.ajax({
					url:'user/updatePwd.do',
					data:'u_sid='+u_sid+'&u_pwd='+u_pwd+'&checkNum='+checkNum,
					dataType:'json',
					type:'post',
					success:function(result){
						if(result!=null){  
							if(result==0){
								alert("验证码输入错误！请重新输入！");
							}else{
								if(result==1){
									alert("修改密码成功！");
									location.href="login&regist.jsp";
								}
								if(result==2){
									alert("账号处于审核中，请耐心等待审核！");
								}
								if(result==3){
									alert("账号已被封禁，禁止修改密码！");
								}
								if(result==4){
									alert("该账号不存在，请重新输入账号！");
								}
							}
						}
					}
					
				}); 
			}
		}else{
			alert("输入信息不完整！请认真填写信息！");
		}
		
	}
	
    function getPic(){
        $("#checkCode").attr("src","user/checkCode.do?flag="+Math.random());
    };
</script>
<body>
	<!-- main -->
	<div class="main">
		<div class="logo"></div>
		<div class="main-info">
			<div class="sap_tabs">
				<div id="horizontalTab" style="display: block; width: 100%; margin: 0px;">
				<ul class="resp-tabs-list">
						<li class="resp-tab-item" aria-controls="tab_item-0" role="tab" style="width:100%;"><h2><span>忘记密码</span></h2></li>
						<!-- <li class="resp-tab-item" aria-controls="tab_item-1" role="tab"><span>注册</span></li> -->
						<div class="clear"> </div>
					</ul>
					<div class="resp-tabs-container">
						<div class="tab-1 resp-tab-content" style="display: block;">
                            <div class="login-top">
                                <form>
                                    <input type="text" class="name" name="u_sid" id="u_sid" placeholder="账号" required=""/>
                                    <input type="text" class="password" name="u_pwd" id="u_pwd" placeholder="新密码" required=""/>
                                    <input type="password" class="password" name="u_pwd1" id="u_pwd1" placeholder="请再输入一次新密码" required=""/>
                                    <input type="text" class="checkNum" name="checkNum" id="checkNum" placeholder="验证码"><img src="user/checkCode.do" id="checkCode" title="看不清，点击换一张" alt="" width="100" height="32" style="height:43px;cursor:pointer;" onclick="getPic()"/>	
                                <div class="login-bottom">
                                    <ul>
                                        <li>
                                            <a href="login&regist.jsp">返回登陆账号</a>
                                        </li>
                                        <li>
                                            <input type="button" name="" id="" value="确定" onclick="updatePwd()" />
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
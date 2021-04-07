<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/buy.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index.css" />
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/index.js"></script>
<script type="text/javascript">
function inCard(g_id,u_id){
	if(confirm("确认加入购物车吗？")){
		//alert(g_id+u_id);
		//alert(u_id=="null");
		
		if(u_id=="null"){
			alert("请先登录");
			location.href="login&regist.jsp";
		}else{
			
			$.ajax({
				url:'inCard.do',
				data:'g_id='+g_id+'&u_id='+u_id,
				dataType:'text',
				type:'post',
				success:function(result){
					if(result==1){
						
						alert("添加到购物车成功");
					}else{
						alert("不能购买该商品");
					}
				}
			}); 
		}
	}
	else{
		return;
	}
}
</script>
<style type="text/css">
.image{
			width:320px;
			z-index:-100;
			position:absolute;
			top:80px;
			left:380px;
		}
		.image1{
			width:600px;
			z-index:-1000;
			position:absolute;
			top:200px;
			left:800px;
		}</style>
</head>
<body>
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
	<div id="content">
		<div class="content1 ">
			
				<div class="img">
					<img src=" ${goods.url}"/>
				</div>
				<div class="box">
				<div class="detail">
					<div>
						<h5>商品名:</h5>
						<span class="name">${goods.g_name }</span>
					</div>
					<div>
						<h5>价格:</h5>
						<span class="price">￥ ${goods.g_price }</span>
					</div>
					<div>
						<h5>商品描述:</h5>
						<span>${goods.g_detail }</span>
					</div>
					<div>
					
						<h5>发布人信息:</h5>
					<a href="setUs.do?se_id=${goods.seller.u_id}">
						<br/>
						<p>	
						<span>姓名：${goods.seller.u_name }</span>						
						</p>
							<p>	<span>专业：${goods.seller.u_margin }</span></p>
							<p>	<span>学号：${goods.seller.u_sid }</span></p>
							<p>	<span>班级：${goods.seller.u_class }</span></p>
					</a>
					</div>
					<div>
						<button  onclick="inCard(${goods.g_id},'<%=session.getAttribute("u_id")%>')">加入购物车</button>
					</div>

				</div>
				</div>
				
			

		</div>
	</div>
<!-- <img src="img/表情.png" id="mouseflow" /> -->
<img class="image1" alt="" src="./img/upPwd1.png">
		<!-- <img class="image" alt="" src="./img/upPwd.png"> -->
	<footer> </footer>


</body>
</html>
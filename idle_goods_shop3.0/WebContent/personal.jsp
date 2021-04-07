<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/vue.min.js"></script>
<script src="https://cdn.staticfile.org/popper.js/1.15.0/umd/popper.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/init.css"/>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/2.css"/>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/index.css" />
</head>

<script type="text/javascript">

function loadAll(){
	$.ajax({
		url:'user/findByuId.do',
		data:'se_id=0',
		dataType:'json',
		type:'post',
		success:function(result){
			let u_name,u_class,u_sid
			for(var p in result){
				if(p=="u_name"){
					u_name = result[p]
				}  
				if(p=="u_class"){
					u_class = result[p]
				}  
				if(p=="u_sid"){
					u_sid = result[p]
				}  
            }
			addHead(u_name,u_class,u_sid)
		}
	});
}

function loadAll2(){
	$.ajax({
		url:'findGoodsByBuyer1.do',
		data:'se_id=0',
		dataType:'json',
		type:'post',
		success:function(result){
			for(var p in result){
				if(p=="list"){
					var g_name,g_price,g_detail,url,t_name,u_name
					for(var index in result[p]){
				        g_name=result[p][index].g_name
				        g_price=result[p][index].g_price
				        g_detail=result[p][index].g_detail
				        url=result[p][index].url
				        t_name=result[p][index].type.t_name
				        u_name=result[p][index].seller.u_name
				        addGoods(g_name,g_price,g_detail,url,t_name,u_name,"collapseOne")
				}
				}
            }
		
		}
	});
}
function loadAll3(id){
	$.ajax({
		url:'findGoodsBySelled.do',
		data:'se_id=0',
		dataType:'json',
		type:'post',
		success:function(result){
			for(var p in result){
				if(p=="list"){
					var g_name,g_price,g_detail,url,t_name,u_name
					for(var index in result[p]){
				        g_name=result[p][index].g_name
				        g_price=result[p][index].g_price
				        g_detail=result[p][index].g_detail
				        url=result[p][index].url
				        t_name=result[p][index].type.t_name
				        u_name=result[p][index].seller.u_name
				        addGoods(g_name,g_price,g_detail,url,t_name,u_name,"collapseTwo")
				}
				}
            }
		
		}
	});
}
function loadAll4(){
	$.ajax({
		url:'findGoodsBySeller1.do',
		data:'se_id=0',
		dataType:'json',
		type:'post',
		success:function(result){
			for(var p in result){
				if(p=="list"){
					var g_name,g_price,g_detail,url,t_name,u_name
					for(var index in result[p]){
				        g_name=result[p][index].g_name
				        g_price=result[p][index].g_price
				        g_detail=result[p][index].g_detail
				        url=result[p][index].url
				        t_name=result[p][index].type.t_name
				        u_name=result[p][index].seller.u_name
				        addGoods(g_name,g_price,g_detail,url,t_name,u_name,"collapseThree")
				}
				}
            }
		
		}
	});
}

function loadAll5(){
	$.ajax({
		url:'findEvaBySeId.do',
		data:'se_id=0',
		dataType:'json',
		type:'post',
		success:function(result){
			var g_url,g_name,e_content,e_score,u_name
			for(var p in result){
				if(p=="list"){
					for(var index in result[p]){
						g_url=result[p][index].goods.url
						g_name=result[p][index].goods.g_name
						e_content=result[p][index].e_content
						e_score=result[p][index].e_score
						u_name=result[p][index].buyer.u_name
						addEva(g_url,g_name,e_content,e_score,u_name)
				}
				}
            }
		
		}
	});
}

function addEva(g_url,g_name,e_content,e_score,u_name){
	var star=[
		"💗",
		"💗💗",
		"💗💗💗",
		"💗💗💗💗",
		"💗💗💗💗💗"
	]
	var stars = star[e_score-1]
	var div = document.createElement('div')
	div.className="in_card"
	div.innerHTML='<div class="card mb-3" style="max-width: 540px;">'+
						'<div class="row no-gutters">'+
							'<div class="col-md-4">'+
								'<img class="g_img" src="'+g_url+'" class="card-img" alt="...">'+
							'</div>'+
							'<div class="col-md-8">'+
								'<div class="card-body">'+
									'<h5 class="card-title">'+g_name+'</h5>'+
									'<p class="card-text">'+e_content+'</p>'+
									'<p class="card-text"><small class="text-muted">'+
										'<span >'+stars+'</span>&nbsp;'+u_name+
										'</small>'+
									'</p>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>'
	var card1=document.getElementById("card1")
	card1.insertBefore(div, card1.firstChild);
}

function addGoods(g_name,g_price,g_detail,url,t_name,u_name,collapse){
	if(u_name!=""||u_name!=null){
		u_name="卖家姓名："+u_name
	}
	if(g_detail==""||g_detail==null){
		g_detail="暂无描述哦！"
	}
	var div = document.createElement('div')
	div.className="card-body"
	div.innerHTML='<div class="card mb-3">'+
						'<div class="row no-gutters">'+
							'<div class="col-md-4">'+
								'<img class="c_img" src="'+url+'" class="card-img" alt="...">'+
							'</div>'+
							'<div class="col-md-8">'+
								'<div class="card-body">'+
									'<h3 class="card-title">商品名：'+g_name+'</h3>'+
									'<p class="card-text">商品描述：'+g_detail+'</p>'+
									'<p class="card-text">商品价格：'+g_price+'</p>'+
									'<p class="card-text"><small class="text-muted">'+
									'&nbsp;&nbsp;'+u_name+'&nbsp;&nbsp;商品类别：'+t_name+
									'</small>'+
								'</p>'+
								'</div>'+
							'</div>'+
						'</div>'+
					'</div>'
	var collapse=document.getElementById(collapse)
	collapse.insertBefore(div, collapse.firstChild);
}

function addHead(u_name,u_class,u_sid){
	var ul=document.createElement('ul');
	ul.className="head_ul";
	ul.innerHTML= '<li><img src="img/tx.jpg"></li>'+
    				'<li><img src="img/购物.png"></li>'+
    				'<li>姓名:'+u_name+'</li>'+
    				'<li>班级:'+u_class+'</li>'+
                    '<li>学号:'+u_sid+'</li>'
    var head=document.getElementById("head")
    head.insertBefore(ul, head.firstChild);
}

</script>

<body onload="loadAll(),loadAll2(),loadAll3(),loadAll4(),loadAll5()">

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

	<div class="container" style="margin-top:40px;">
    <div class="row" id="person">
        <!-- 收到的评价 -->
        <div class="eva col-lg-3" id="star">
            <div class="card-header">
                	我收到的评价
            </div>
            <div id="card1">
				
            </div>
        </div>
        <!-- 个人信息栏 -->
        <div class="personal_tab col-lg-7">
            <div class="head" id="head">
              
            </div>
            <div class="head2">
                <ul>
                    <li><a href="card.do?u_id=<%=session.getAttribute("u_id")%>">购物车</a></li>
                    <li><a href="findGoodsByBuyer.do">我的订单</a></li>
                    <li><a href="changePwd.jsp">修改密码</a></li>
                    <li><a href="findGoodsBySeller.do">我的发布</a></li>
                </ul>
            </div>
            <div class="box">
                <div id="accordion">
                    <div class="card">
                        <div class="card-header">
                            <a class="card-link" data-toggle="collapse" href="#collapseOne">
                                	我买到的
                            </a>
                        </div>
                        <div id="collapseOne" class="collapse show" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseTwo">
                                我卖出的
                            </a>
                        </div>
                        <div id="collapseTwo" class="collapse" data-parent="#accordion">
                        </div>
                    </div>
                    <div class="card">
                        <div class="card-header">
                            <a class="collapsed card-link" data-toggle="collapse" href="#collapseThree">
                                我发布的
                            </a>
                        </div>
                        <div id="collapseThree" class="collapse" data-parent="#accordion">
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- 导航 -->
		<div class="link col-lg-2" id="link">
			<div class="card mb-3" style="background-color: #F8FFFA;">
				<h3 class="card-title c_title">我的日历</h3>
				<div class="card-body">		    
				    <p class="card-text c_text">{{d}}</p>
					<p class="card-text c_text">星期{{day}}</p>
					<p class="card-text c_text">{{y}}-{{m}}</p>
				</div>
			</div>
		</div>
    </div>
</div>
 

<script type="text/javascript">
    var mydata = new Date()
	var m = mydata.getMonth()+1
	var d = mydata.getDate()
	var y= mydata.getFullYear();
	var day = mydata.getDay(); 
	var link = new Vue({
		el:"#link",
		data:{
			month:m,
			data:d,
			year:y,
			day:day
		}
	})
</script>
</body>

</html>
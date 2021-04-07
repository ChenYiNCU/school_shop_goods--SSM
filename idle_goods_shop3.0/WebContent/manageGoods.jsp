<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="java.io.*,java.util.List,java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/manageGoods.css" />
<script src="https://cdn.bootcss.com/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<%-- <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/manageGoods.js" ></script> --%>
<script type="text/javascript">
	function changeType(e,t_id){
		var td=e.parentNode.parentNode.children[1];
		var str=td.innerHTML;
		//alert(str);
	    td.innerHTML='<input type="text" value="'+str+'"/>';
	    var input=td.children[0];
		input.select();
		input.onblur=function(){
			var name=this.value;
			//alert(name);
			if(name !=''){  //name非空
				//alert(t_id);
				$.ajax({
					url:'changeType.do',
					data:'t_name='+name+'&t_id='+t_id,
					dateType:'text',
					type:'post',
					success:function(result){
						if(result!=null){
							if(result==0){    //名字存在，不能改								
								name=str;
								alert("类型名字已经存在");	
								$(td).html(name);
								//alert(td);
							}
							if(result==1){
								alert("修改成功");
								
								$(td).html(name);
							}	
						}
					}
				});
				//alert('11');
				//this.parentNode.innerHTML=name;
				
			}else{
				alert("不能为空");
				name=str;
				this.parentNode.innerHTML=name;
			}
			//alert('11');
		}
	}
	
	function addType(e,index1,index2){
		var input=e.parentNode.children[0];
		var t_name=input.value;
		//alert(t_name);
		if(t_name !=''){
			//alert('456');
			$.ajax({
				url:'addType.do',
				data:'t_name='+t_name,
				dateType:'text',
				type:'post',
				success:function(result){
					if(result!=null){
						if(result==0){    //名字存在，不能添加							
							alert("类型名字已经存在");								
							//alert(td);
						}
						if(result==1){
							//$(input).html('');
							alert("添加成功");
							location.href="manageGoods.do?index1="+index1+"&index2="+index2;
							
							
						}	
					}
				}
			});
			
		}else{
			alert("类型名不能为空");
		}
		
	}
	
	</script>
</head>
<body>
	<div class="manage">
		<p>
			待审核<span>${sumG}</span>件商品
		</p>
		<div class="magoods">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>商品名</th>
						<th>图片</th>
						<th>价格</th>
						<th>商品描述</th>
						<th>卖家学号</th>
						<th>卖家名字</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list1}" var="goods">
						<tr>
							<td>${goods.g_name}</td>
							<td><img src=".${goods.url }" /></td>
							<td>${goods.g_price }</td>
							<td>${goods.g_detail}</td>
							<td>${goods.seller.u_sid }</td>
							<td>${goods.seller.u_name }</td>
							<td>
								<button onclick="location.href='pass.do?g_id=${goods.g_id}'">通过</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<nav aria-label="Page navigation ">
			<ul class="pagination ">
				<li><a href="manageGoods.do?index1=1">首页</a></li>
				<c:if test="${index1>1}">
					<li><a href="manageGoods.do?index1=${index1-1}">上一页</a></li>
				</c:if>

				<c:if test="${index1<totalGP}">
					<li><a href="manageGoods.do?index1=${index1+1}">下一页</a></li>
				</c:if>


				<li><a href="manageGoods.do?index1=${totalGP}">末页</a></li>
				<em>当前${index1}页,共${totalGP}页</em>
			</ul>
			</nav>
		</div>
		<p>添加分类</p>
		<div class="addtype">
			类型名： <input type="text" />
			<button onclick="addType(this,${index1},${index2})">添加</button>
		</div>

		<p>修改商品分类</p>
		<div class="mytype">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>类型编号</th>
						<th>类型名</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>

					<c:forEach items="${list2}" var="t">
						<tr>
							<td>${t.t_id}</td>
							<td>${t.t_name}</td>
							<td>
								<button onclick="changeType(this,${t.t_id })">修改</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>

			<nav aria-label="Page navigation ">
			<ul class="pagination ">
				<li><a href="manageGoods.do?index2=1">首页</a></li>
				<c:if test="${index2>1}">
					<li><a href="manageGoods.do?index2=${index2-1}">上一页</a></li>
				</c:if>
				<c:if test="${index2<totalTP}">
					<li><a href="manageGoods.do?index2=${index2+1}">下一页</a></li>
				</c:if>
				<li><a href="manageGoods.do?index2=${totalTP}">末页</a></li>
				<em>当前${index2}页,共${totalTP}页</em>
			</ul>
			</nav>
		</div>
	</div>
</body>
</html>
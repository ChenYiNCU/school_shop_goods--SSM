<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户管理</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">  
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/manageUsers.css">
</head>
<script type="text/javascript">
	function examine(id){
		//alert(id);
		if(confirm("确认是否通过审核？")){
			location.href="examine.do?u_id="+id;
		}
	}
	function reopen(id){
		if(confirm("是否解除对该账号的封禁？")){
			location.href="reopen.do?u_id="+id;
		}
	}
	function freeze(id){
		if(confirm("是否对该账号进行封禁？")){
			location.href="freeze.do?u_id="+id;
		}
	}
	function findUserById(id){
		$.ajax({
			url:'findUserById.do',
			data:'u_id='+id,
			dataType:'json',
			type:'post',
			success:function(result){
				//alert(result.id);
				var input="";
				input+="<p><input type='hidden' name='u_id' value='"+result.u_id+"'></p>";
				input+="<p>姓名：<input type='text' name='u_name' value='"+result.u_name+"'></p>";
				input+="<p>密码：<input type='text' name='u_pwd' value='"+result.u_pwd+"'></p>";
				input+="<p>学号：<input type='text' name='u_sid' value='"+result.u_sid+"'></p>";
				input+="<p>专业：<input type='text' name='u_margin' value='"+result.u_margin+"'></p>";
				input+="<p>班级：<input type='text' name='u_class' value='"+result.u_class+"'></p>";
				$("#for").html(input);
			}
		});
	}
	
	function update(id){
		if(confirm("是否修改该账户信息？")){
			location.href="update.do?u_id="+id;
		}
	}
	
	function del(id){
		if(confirm("是否删除该用户信息？")){
			location.href="del.do?u_id="+id;
		}
	}
	
	function findLike(){
		var find=$("#find").val();
		//alert(find);
		location.href="findLike.do?find="+find;
	}
	function findFlag(){
		var find_id=$("#find_id option:selected").val();
		//alert(find_id);
		location.href="findFlag.do?u_flag="+find_id;
	}
	function check(){
    	var u_sid=$("#u_sid");
    	//var isok=$("#isok");
    	var sid=u_sid.val();
    	//alert(sid);
    	$.ajax({
			url:'findById.do',
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
</script>
<body>
<div id="container">
<header>
	<p class="title">用户管理</p>
</header>
<div class="main">
		<div class="container">
			<div class="row">
				<div class="col-md-12"><button class="btn btn-primary" data-toggle="modal" data-target="#myModal2">添加用户</button></div>
			</div>
			<div class="row find">
				<div class="col-md-6">
					<!-- 搜索表单 -->
					<form>
						<input class="search" type="text" name="find" id="find" placeholder="输入学号搜索"> 
						<input class="btn btn-primary" type="button" onclick="findLike()" value="搜索">
					</form>
				</div>
				<div class="col-md-6">
					<form>
						<select name="find_id" id="find_id" class="search2" onchange="findFlag()">
							<option value="">账号状态</option>
							<option value="-1">所有账号</option>
							<option value="0">未审核账号</option>
							<option value="1">正常账号</option>
							<option value="2">异常账号</option>
						</select>
					</form>
				</div>
			</div>
		</div>
		<c:choose>
		<c:when test="${list.size()!=0}">
		<div class="table-responsive">
			<table class="table table-hover text-center">
				<thead>
					<tr>
						<th>编号</th>
						<th>姓名</th>
						<th>密码</th>
						<th>学号</th>
						<th>班级</th>
						<th>专业</th>
						<!-- <th>状态编号</th> -->
						<th>账号状态</th>
						<th class="cz-width">操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach items="${list }" var="u">
					<tr style="border:1px solid silver">
						<td>${u.u_id }</td>
						<td>${u.u_name }</td>
						<td>${u.u_pwd }</td>
						<td>${u.u_sid }</td>
						<td>${u.u_class }</td>
						<td>${u.u_margin }</td>
						<%-- <td>${u.u_flag }</td> --%>
						<c:if test="${u.u_flag==0}">
							<td>审核中</td>
						</c:if>
						<c:if test="${u.u_flag==1}">
							<td>正常</td>
						</c:if>
						<c:if test="${u.u_flag==2}">
							<td>异常</td>
						</c:if>
						<td>
							<c:if test="${u.u_flag==0}">
								<button type="button" class="btn btn-primary" onclick="examine(${u.u_id})">通过</button>
							</c:if>
							<c:if test="${u.u_flag==2}">
								<button type="button" class="btn btn-primary" onclick="reopen(${u.u_id})">解封</button>
							</c:if>
							<c:if test="${u.u_flag!=2 && u.u_flag!=0}">
								<button type="button" class="btn btn-primary" onclick="freeze(${u.u_id})">封号</button>
							</c:if>
							<button class="btn btn-primary" data-toggle="modal" data-target="#myModal" onclick="findUserById(${u.u_id})">修改信息</button>
							<c:if test="${u.u_flag!=2 && u.u_flag!=0}">
								<button type="button" class="btn btn-primary" onclick="del(${u.u_id})">删除</button>
							</c:if>	
						</td>
					</tr>
					</c:forEach>
			</tbody>
		</table>
		</div>
			 	
	<div class="page">
		<c:choose>
			<c:when test="${(find==null || find=='') && (find_id==null || find_id=='' || find_id==-1)}"> 
			<!-- <p>全部</p> -->
			<div class="page-pos">
				<ul class="pagination">
					<li><a href="findAllUsers.do?index=1">首页</a></li>
					<c:if test="${index>1 }">
						<li><a href="findAllUsers.do?index=${index-1 }">&laquo; 上一页</a></li>
					</c:if>
				    <c:if test="${index<total}">
				    	<li><a href="findAllUsers.do?index=${index+1}">下一页 &raquo;</a></li>
				    </c:if>
				    <li><a href="findAllUsers.do?index=${total }">尾页</a></li>
				</ul>
			</div>
			</c:when>
		<c:otherwise>
		<c:if test="${find_id==null || find_id==''}">
			<!-- <p>搜索</p> -->
			<div class="page-pos">
				<ul class="pagination">
					<li><a href="findLike.do?find=${find }&index=1">首页</a></li>
					<c:if test="${index>1 }">
						<li><a href="findLike.do?find=${find }&index=${index-1 }">&laquo; 上一页</a></li>
					</c:if>
				    <c:if test="${index<total}">
				    	<li><a href="findLike.do?find=${find }&index=${index+1}">下一页 &raquo;</a></li>
				    </c:if>
				    <li><a href="findLike.do?find=${find }&index=${total }">尾页</a></li>
				</ul>
			</div>
		</c:if>
		<c:if test="${find==null || find=='' }">
			<!-- <p>状态</p> -->
			<div class="page-pos">
				<ul class="pagination">
					<li><a href="findFlag.do?u_flag=${find_id }&index=1">首页</a></li>
					<c:if test="${index>1 }">
						<li><a href="findFlag.do?u_flag=${find_id }&index=${index-1 }">&laquo; 上一页</a></li>
					</c:if>
				    <c:if test="${index<total}">
				    	<li><a href="findFlag.do?u_flag=${find_id }&index=${index+1}">下一页 &raquo;</a></li>
				    </c:if>
				    <li><a href="findFlag.do?u_flag=${find_id }&index=${total }">尾页</a></li>
				</ul>
			</div>
		</c:if>
		</c:otherwise>
		</c:choose>
	</div>
	</c:when> 
		<c:otherwise>
			<p class="not-found">无搜索结果</p>
		</c:otherwise>	
	</c:choose>
</div>

<!-- 修改用户信息模态框（Modal） -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					用户信息
				</h4>
			</div>
		<!-- 表单 -->
		<form action="update.do" method="post">
			<div class="modal-body" id="for">
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交更改
				</button>
			</div>
		</form>		
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

<!-- 添加用户信息模态框（Modal） -->
<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					用户信息
				</h4>
			</div>
		<!-- 表单 -->
		<form action="addUser.do" method="post">
			<div class="modal-body">
				<p>姓名：<input type="text" name="u_name"></p>
				<p>密码：<input type="text" name="u_pwd"></p>
				<p>学号：<input type="text" name="u_sid" id="u_sid" onchange="check()"></p>
				<p>专业：<input type="text" name="u_margin"></p>
				<p>班级：<input type="text" name="u_class"></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="submit" class="btn btn-primary">
					提交
				</button>
			</div>
		</form>		
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>

</div>
</body>
</html>
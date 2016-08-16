<#assign base = request.contextPath />
<!DOCTYPE html>

<html lang="en">
<base id="base" href="${base}">
<title>Spring Boot - hello</title>

<link href="//cdn.jsdelivr.net/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">
<script type="text/javascript" src="//code.jquery.com/jquery-1.12.3.js"></script>
<script type="text/javascript"
	src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap/latest/css/bootstrap.css" />
<script type="text/javascript"
	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"
	src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
<body>
	<div class="row" align="center">
		<div class="page-header">
			<h1>Sprint Boot: Hello 禾唐</h1>
		</div>
		<div class="col-xs-6 col-sm-8">
			<table id="accountTables" class="table table-striped table-bordered"
				cellspacing="0">
				<thead>
					<tr>
						<th class="col-xs-1">编码</th>
						<th class="col-xs-1">名称</th>
						<th class="col-xs-2">创建时间</th>
						<th class="col-xs-1">状态</th>
						<th class="col-xs-2">帐号类型</th>
						<th class="col-xs-2">最后登录时间</th>
						<th class="col-xs-4">备注</th>
					</tr>
				</thead>
				<tbody>
					<#list model["infos"] as info>
					<tr>
						<td>${info.id}</td>
						<td>${info.name}</td>
						<td>${info.createTime}</td>
						<td>${info.status}</td>
						<td>${info.countType}</td>
						<td>${info.lastTime}</td>
						<td>${info.remark}</td>
					</tr>
					</#list>

				</tbody>
			</table>
		</div>
		<div align="left" class="col-xs-6 col-sm-4">
			<form class="form-horizontal" align="left">
				<div class="form-group">
					<label for="inputId" class="col-sm-4 control-label">编码:</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="inputId"
							placeholder="ID">
					</div>
				</div>
				<div class="form-group">
					<label for="inputName" class="col-md-4 control-label">名称:</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="inputName"
							placeholder="名称">
					</div>
				</div>
				<div class="form-group">
					<label for="inputCreateTime" class="col-md-4 control-label">创建时间:</label>
					<div class="col-md-4">
						<input type="text" data-provide="datepicker"
							data-date-end-date="8d" name="createTime" class="form-control"
							id="inputCreateTime">
					</div>
				</div>
				<div class="form-group">
					<label for="inputStatus" class="col-md-4 control-label">状态:</label>
					<div class="col-md-4">
						<label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="statusOpen" value="open">
							开启
						</label> <label class="radio-inline"> <input type="radio"
							name="inlineRadioOptions" id="statusClose" value="close">
							封存
						</label>
					</div>
				</div>

				<div class="form-group">
					<label for="selectType" class="col-md-4 control-label">帐号类型:</label>
					<div class="col-md-4">
						<select class="form-control select2" id="selectAccountType">
							<option value="manager" selected="selected">管理员</option>
							<option value="user">普通会员</option>
							<option value="vip">VIP会员</option>
						</select>
					</div>
				</div>
				<div class="form-group">
					<label for="inputLastTime" class="col-md-4 control-label">最后登录时间:</label>
					<div class="col-md-4">
						<input type="text" class="form-control" id="inputLastTime"
							placeholder="最后登录时间" readonly="readonly" value=${model.time }>
					</div>
				</div>
				<div class="form-group">
					<label for="inputRemark" class="col-md-4 control-label">备注:</label>
					<div class="col-md-4">
						<textarea class="form-control" rows="3" id="inputRemark"></textarea>
					</div>
				</div>
			</form>
			<div>
				<div >
					<input class="btn btn-primary  col-md-2 col-md-offset-1"
						type="button" value="添加" id="add">
				</div>

				<div >
					<input class="btn btn-success  col-md-2 col-md-offset-1"
						type="button" value="修改" id="update">
				</div>
				<div>
					<input class="btn btn-danger  col-md-2 col-md-offset-1"
						type="button" value="删除" id="delete">
				</div>
			</div>
		</div>

		<!-- <div class="container">
			<input type="text" name="daterange" value="2016-01-01 - 2016-12-31" />
		</div> -->
	</div>
	<footer class="footer">

		<div class="container"></div>

		<div class="container">
			<p class="text-muted">&copy;2016 jessyon</p>
		</div>
	</footer>



</body>
<script type="text/javascript">
	$(function() {
		
		
		$('input[name="daterange"]').daterangepicker({
			locale : {
				format : 'YYYY-MM-DD'
			}
		});
		$('input[name="createTime"]').daterangepicker({
			singleDatePicker : true,
			showDropdowns : true,
			locale : {
				format : 'YYYY-MM-DD'
			}
		});
		$('#accountTables').DataTable();
		$('#add').click(function() {

			var $id = $('#inputId').val();
			var $name = $('#inputName').val();
			var $createTime = $('#inputCreateTime').val();
			var $countType = $('#selectAccountType').val();
			var $status = $('input[name="inlineRadioOptions"]:checked').val();
			var $lastTime = $('#inputLastTime').val();
			var $remark = $('#inputRemark').val();
			
			var $info = {
				"id" : $id,
				"name" : $name,
				"createTime" : $createTime,
				"status" : $status,
				"countType" : $countType,
				"lastTime" : $lastTime,
				"remark" : $remark
			}
			var $info = JSON.stringify($info);

			$.ajax({
				url : "/add",
				method : "post",
				contentType : "application/json",
				data : $info,
				success : function(data) {
					alert("添加成功");
				},
				error : function(data) {
					alert("发送数据失败")
					
				}
			})
		});
		
		$('#update').click(function() {

			var $id = $('#inputId').val();
			var $name = $('#inputName').val();
			var $createTime = $('#inputCreateTime').val();
			var $countType = $('#selectAccountType').val();
			var $status = $('input[name="inlineRadioOptions"]:checked').val();
			var $lastTime = $('#inputLastTime').val();
			var $remark = $('#inputRemark').val();

			var $info = {
				"id" : $id,
				"name" : $name,
				"createTime" : $createTime,
				"status" : $status,
				"countType" : $countType,
				"lastTime" : $lastTime,
				"remark" : $remark
			}
			var $info = JSON.stringify($info);

			$.ajax({
				url : "/update",
				method : "post",
				contentType : "application/json",
				data : $info,
				success : function(data) {
					alert("修改成功");
				},
				error : function(data) {
					alert("发送数据失败")
				}
			})
		});
		$('#delete').click(function() {

			var $id = $('#inputId').val();

			var $info = {
				"id" : $id,
			}
			var $info = JSON.stringify($info);

			$.ajax({
				url : "/delete",
				method : "post",
				contentType : "application/json",
				data : $info,
				success : function(data) {
					alert("删除成功");
				},
				error : function(data) {
					alert("发送数据失败");
					
				}
			})
		});


	});
</script>
</html>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

    <html>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">



	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
  <style>
     
       body > div.container{
        	border: 7px solid #D5CDB1;
            margin-top: 60px;
        }
    </style>
  <script>
	
		<!--  ///////////////////////// CSS ////////////////////////// -->
	



function fncAddProduct(){
	//Form ��ȿ�� ����
 	//var name = document.detailForm.prodName.value;
	//var detail = document.detailForm.prodDetail.value;
	//var manuDate = document.detailForm.manuDate.value;
	//var price = document.detailForm.price.value;
	
	var name = $("input[name='prodName']").val();
	var detail = $("input[name='prodDetail']").val();
	var manuDate = $("input[name='manuDate']").val();
	var price = $("input[name='price']").val();
	
	
	
	if(name == null || name.length<1){
		alert("��ǰ���� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(detail == null || detail.length<1){
		alert("��ǰ�������� �ݵ�� �Է��Ͽ��� �մϴ�.");
		return;
	}
	if(manuDate == null || manuDate.length<1){
		alert("�������ڴ� �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}
	if(price == null || price.length<1){
		alert("������ �ݵ�� �Է��ϼž� �մϴ�.");
		return;
	}

	//document.detailForm.action='/product/addProduct';
	//document.detailForm.submit();
	$("form").attr("method","POST").attr("action","/product/addProduct").submit();
}

//function resetData(){
	//document.detailForm.reset();
//}
	$(function () {
		$("a[href='#' ]").on("click",function(){
			$("form")[0].reset();
		});
	});

	$(function () {
		$("button.btn.btn-primary" ).on("click",function(){
			fncAddProduct();	
		});
	});

    $(function() {
        $("#datepicker").datepicker();                          
    });
	
	
</script>
</head>

<body>

<jsp:include page="/layout/toolbar.jsp" />


<!--  ȭ�鱸�� div Start /////////////////////////////////////-->
<div class="container">

	<h1 class="bg-primary text-center">��ǰ���</h1>
					
	<!-- form Start /////////////////////////////////////-->				
			
		<form class="form-horizontal" enctype="multipart/form-data">
		
			<div class="form-group">
			<label for="prodName" class="col-sm-offset-1 col-sm-3 control-label">�� ǰ ��</label>
			<div class="col-sm-4">
		      <input type="text" class="form-control" id="prodName" name="prodName" placeholder="��ǰ�̸��Է��ϼ���.">
		    </div>
			</div>
			
			<div class="form-group">
			<label for="prodDetail" class="col-sm-offset-1 col-sm-3 control-label">��ǰ������</label>
			<div class="col-sm-4">
		      <input type="text" class="form-control" id="prodDetail" name="prodDetail" placeholder="��ǰ�������Է��ϼ���.">
		    </div>
			</div>
			
			<div class="form-group">
			<label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">��������</label>
			<div class="col-sm-4">
		      <input type="text" class="form-control" id="datepicker" name="manuDate" placeholder="�������ڸ��Է��ϼ���.">
		    </div>
			</div>
		
			<div class="form-group">
			<label for="price" class="col-sm-offset-1 col-sm-3 control-label">����</label>
			<div class="col-sm-4">
		      <input type="text" class="form-control" id="price" name="price" placeholder="�������Է��ϼ���.">
		    </div>
			</div>
				
			<div class="form-group">
			<label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">��ǰ�̹���</label>
			<div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" placeholder="�̹���">
		    </div>
			</div>
			
			<div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >��&nbsp;��</button>
			  <a class="btn btn-primary btn" href="#" role="button">��&nbsp;��</a>
		    </div>
		  </div>		
		</form>		
		
</body>
</html>
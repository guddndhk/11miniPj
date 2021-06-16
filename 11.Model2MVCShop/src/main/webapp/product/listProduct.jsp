<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0" />

<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Bootstrap Dropdown Hover CSS -->
<link href="/css/animate.min.css" rel="stylesheet">
<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
<!-- Bootstrap Dropdown Hover JS -->
<script src="/javascript/bootstrap-dropdownhover.min.js"></script>

<!-- jQuery UI toolTip 사용 CSS-->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- jQuery UI toolTip 사용 JS-->
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<style>
body {
	padding-top: 50px;
}
</style>


<link rel="stylesheet" href="/css/admin.css" type="text/css">


<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	//=====기존Code 주석 처리 후  jQuery 변경 ======//
// 검색 / page 두가지 경우 모두 Form 전송을 위해 JavaScrpt 이용  
	function fncGetList(currentPage) {
		//document.getElementById("currentPage").value = currentPage;	
		$("input[name='currentPage']").val(currentPage)
		//document.detailForm.submit();
		$("form[name='detailForm']").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${menu}").submit();
			
	}

	
	$(function(){
		// 검색
// 		$('.btn btn-default:contains("검색")').on("click", function(){
		$('#ok').on("click", function(){
			alert("로딩중..");
			fncGetList(1);
		});
		
		//menager&search
		$('.manage').on('click',function(){
			
			self.location ="/product/updateProduct?prodNo="+$(this).attr('prodNo');
			
		});
	

		
		
		$('.search').on("click" ,function(){
			
			//self.location=$('.product', $(this)).text();
			var prodNo =  $(this).attr('prodNo').trim();
			
			$.ajax(
					{
						url : "/product/json/getProduct/"+prodNo ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						success : function(JSONData , status) {
							//Debug...
							alert("로딩중..");
							//Debug...
							//alert("JSONData.fileName : \n"+JSONData);
							
							var displayValue = "<h3>"
												+"상품번호	 : "+JSONData.prodNo+"<br/>"
												+"상품이름 : "+JSONData.prodName+"<br/>"
												+"상세정보 : "+JSONData.prodDetail+"<br/>"
												+"가격    : "+JSONData.price+"<br/>"
												+"제조일자   : "+JSONData.manuDate+"<br/>"
												+"이미지  : <img src='/images/uploadFiles/"+JSONData.fileName+"'/><br/>"
												+"</h3>";
												
							//Debug...	
							//alert(displayValue);
							$("h3").remove();
							$( "#"+JSONData.prodNo+"" ).html(displayValue);
							
						}	
				
			  });
			
			
		});
		
		
		//==> UI 수정 추가부분  :  userId LINK Event End User 에게 보일수 있도록 
		$( ".ct_list_pop td:nth-child(3)" ).css("color" , "green");
		$("h7").css("color" , "green");
		
		$(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");
		
	});
	
	
</script>
</head>

<body>

	<jsp:include page="/layout/toolbar.jsp" />

	<div class="container">

		<div class="page-header text-info">
			<h3>${!empty menu && menu == 'manage' ? "상품관리" : "상품목록조회"}</h3>
		</div>
		<form name="detailForm">

			<div class="row">

				<div class="col-md-6 text-left">
					<p class="text-primary">전체 ${resultPage.totalCount } 건수, 현재
						${resultPage.currentPage} 페이지</p>
				</div>
			</div>
				
				<div class="col-md-6 text-right">

					<div class="form-group">
						<select class="form-control" name="searchCondition">
							<option value="0"
								${ search.searchCondition eq '0' ? 'selected' : '' }>상품번호</option>
							<option value="1"
								${ search.searchCondition eq '1' ? 'selected' : '' }>상품명</option>
						</select>
					</div>

					<div class="form-group">
						<label class="sr-only" for="searchKeyword">검색어</label> <input
							type="text" class="form-control" id="searchKeyword"
							name="searchKeyword" placeholder="검색어"
							value="${! empty search.searchKeyword ? search.searchKeyword : "" }"  >
					</div>
				</div>
				
					<button type="button" id="ok" class="btn btn-default">검색</button>

					<!-- PageNavigation 선택 페이지 값을 보내는 부분 -->
					<input type="hidden" id="currentPage" name="currentPage" value="" />
		</form>
	</div>

	


	<table class="table table-hover table-striped">

		<thead>

			<tr>
				<th align="center">No</th>
				<th align="left"></th>
				<th align="left">상품명<br> <h7>(상품명 클릭:간략정보)</h7>
				</th>
				<th align="left"></th>
				<th align="left">가격</th>
				<th align="left"></th>
				<th align="left">등록일</th>
				<th align="left"></th>
				<th align="left">현재상태</th>
			</tr>
		</thead>

		<tbody>

			<c:set var="i" value="0" />
			<c:forEach var="product" items="${list}">
				<c:set var="i" value="${ i+1 }" />


				<tr>
					<td align="center">${ i }</td>
					<td></td>
					<td align="left"><c:if test="${menu=='manage'}">
							<div class="manage" prodNo="${product.prodNo}">${product.prodName}</div>
							<!-- <div style="display : none" class="product">/product/updateProductView?prodNo=${product.prodNo}&$menu=manage</div> -->
							<!--<a href="/product/updateProductView?prodNo=${product.prodNo}&${! empty menu && menu == 'manage' ? 'menu=manage' : 'menu=search'}">${product.prodName} </a> -->
						</c:if> <c:if test="${menu=='search'}">
							<div class="search" prodNo="${product.prodNo}">${product.prodName}</div>
							<!-- <div style="display : none" class="product">/product/getProduct?prodNo=${product.prodNo}&$menu=search</div> -->
							<!-- <a href="/product/getProduct?prodNo=${product.prodNo}&${! empty menu && menu == 'search' ? 'menu=search' : 'menu=manage'}">${product.prodName} </a>-->
						</c:if></td>
					<td></td>
					<td align="left">${product.price}</td>
					<td></td>
					<td align="left">${product.regDate}</td>
					<td></td>
				</tr>
				<tr>
					<td id="${product.prodNo}" colspan="11" bgcolor="D6D7D6" height="1"></td>
				</tr>
			</c:forEach>

		</tbody>

	</table>



	<!--  페이지 Navigator 끝 -->





	<jsp:include page="../common/pageNavigator_new.jsp" />


</body>

</html>

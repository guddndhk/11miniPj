<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" >
  </script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js">
  </script>
</head>
<body>

	<p>
	<p>아임 서포트 첫번째 테스트</p>
	<button id="check_module" type="button">아임 서포트 첫번째 테스트</button>



	<script>
		$("#check_module").click(function() {
			IMP.init('imp18633009');
			
			IMP.certification({
			    merchant_uid : 'merchant_' + new Date().getTime() //본인인증과 연관된 가맹점 내부 주문번호가 있다면 넘겨주세요
			}, function(rsp) {
			    if ( rsp.success ) {
			    	 // 인증성공
			        console.log(rsp.imp_uid);
			        console.log(rsp.merchant_uid);
			        
			        $.ajax({
							type : 'POST',
							url : '/certifications/confirm',
							dataType : 'json',
							data : {
								imp_uid : rsp.imp_uid
							}
					 }).done(function(rsp) {
					 		// 이후 Business Logic 처리하시면 됩니다.
					 });
			        	
			    } else {
			    	 // 인증취소 또는 인증실패
			        var msg = '인증에 실패하였습니다.';
			        msg += '에러내용 : ' + rsp.error_msg;

			        alert(msg);
			    }
			});
		});
	</script>


</body>
</html>
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
	<p>���� ����Ʈ ù��° �׽�Ʈ</p>
	<button id="check_module" type="button">���� ����Ʈ ù��° �׽�Ʈ</button>



	<script>
		$("#check_module").click(function() {
			IMP.init('imp18633009');
			
			IMP.certification({
			    merchant_uid : 'merchant_' + new Date().getTime() //���������� ������ ������ ���� �ֹ���ȣ�� �ִٸ� �Ѱ��ּ���
			}, function(rsp) {
			    if ( rsp.success ) {
			    	 // ��������
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
					 		// ���� Business Logic ó���Ͻø� �˴ϴ�.
					 });
			        	
			    } else {
			    	 // ������� �Ǵ� ��������
			        var msg = '������ �����Ͽ����ϴ�.';
			        msg += '�������� : ' + rsp.error_msg;

			        alert(msg);
			    }
			});
		});
	</script>


</body>
</html>
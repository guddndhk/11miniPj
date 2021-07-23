<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<!-- CDN(Content Delivery Network) 호스트 사용 -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
<script type="text/javascript"
	src="http://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

	<p>
	<p>아임 서포트 첫번째 테스트</p>
	<button id="check_module" type="button">아임 서포트 첫번째 테스트</button>



	<script>
		$("#check_module").click(function() {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp18633009');
			
			IMP.request_pay({
				//pg : 'inicis',
				pg : 'kakao',
				/*
				'kakao':카카오페이,
				html5_inicis':이니시스(웹표준결제)
				'nice':나이스페이
				'jtnet':제이티넷
				'uplus':LG유플러스
				'danal':다날
				'payco':페이코
				'syrup':시럽페이
				'paypal':페이팔
				 */
				pay_method : 'card',
				/*
				'samsung':삼성페이,
				'card':신용카드,
				'trans':실시간계좌이체,
				'vbank':가상계좌,
				'phone':휴대폰소액결제
				 */
				merchant_uid : 'merchant_' + new Date().getTime(),
				
				name : '주문명:결제테스트',
				
				amount : 100,
				
				buyer_email : 'nava@naver.com',
				buyer_name : '테스트',
				buyer_tel : '010-1234-5678',
				buyer_addr : '서울특별시',
				buyer_postcode : '111-111',
				m_redirect_url : 'https://www.yourdomain.com/payments/complete'
			
				
			}, function(rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>


</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	String prodName = (String)request.getAttribute("prodName");
	String buyerEmail = (String)request.getAttribute("buyerEmail");
	String buyerName = (String)request.getAttribute("buyerName");
	String buyerPhone = (String)request.getAttribute("buyerPhone");
	int prodNum = (int)request.getAttribute("prodNum");
	int hostNum = (int)request.getAttribute("hostNum");
	int totalPrice = (int)request.getAttribute("totalPrice");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<script>
<!-- 결제..!! -->
$(function(){
   var IMP = window.IMP; // 생략해도 괜찮.
   IMP.init("imp14686250"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.
   var msg;

      IMP.request_pay({   // IMP.request_pay(param, callback) 호출  // param
        pay_method: "kakaopay",
        merchant_uid: "merchant_" + new Date().getTime(),
        name: '<%=prodName%>',
        amount: <%=totalPrice%>,
        buyer_email: '<%=buyerEmail%>',
        buyer_name: '<%=buyerName%>',
        buyer_tel: '<%=buyerPhone%>',
        buyer_addr: '<%=prodNum%>',
        buyer_postcode: '<%=hostNum%>'
      }, function (rsp) { // callback
        if (rsp.success) {   // 결제 성공 시: 결제 승인 또는 가상계좌 발급에 성공한 경우
           
             var msg = '결제가 완료되었습니다.';
             
             alert(msg);

             //[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
             jQuery.ajax({
                url: "/payments/complete", //cross-domain error가 발생하지 않도록 주의해주세요
                type: 'POST',
                dataType: 'json',
                data: {
                   imp_uid : rsp.imp_uid
                   //기타 필요한 데이터가 있으면 추가 전달
                }
            }).done(function (data) {
              // 가맹점 서버 결제 API 성공시 로직
             if ( everythings_fine ) {
                var msg = '결제가 완료되었습니다.';
                   
                alert(msg);
             } else {
                //[3] 아직 제대로 결제가 되지 않았습니다.
                //[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
                var msg = '결제가 아직 완료되지 않았습니다.';
                
                alert(msg);
             }
          });
		  //성공시 이동할 페이지
		  location.href='<%=request.getContextPath()%>/search.pro';
        } else {
            // 결제 실패 시 로직
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
              
            alert(msg);
        }
      });
});
	
</script>
</body>
</html>
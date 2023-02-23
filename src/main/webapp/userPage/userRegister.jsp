<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script type="text/javascript">
//회원가입 유효성검사
//자원을 화면에 로드하게 되면 수행할 동작(==function)
window.onload = function() {
   var join = document.join; //form데이터를 모두 join변수에 저장
   
   // 유효성검사할 부분을 class로 부여했기에 check class 태그를 모두 input에 저장 가져옴
   // 이때 input 한 태그당 배열 인덱스로 받는다.
   var input = document.querySelectorAll('.check');

   // 오류 문구 //errorId : span의 id들(각 요소마다 나타낼 오류를 표시하기 위함)
   // error : class list의 하위 span을 모두 불러냄(일괄 처리를 위함 - 반복문)
   var errorId = [ "schoolNumError", "nameError", "idError", "pwError", "pwCheckError"];
   var error = document.querySelectorAll('.list > span');

   
   // 오류문구 초기화 메서드
   // 오류 표시 후, 사용자가 올바르게 수정을 하면 텍스트가 사라지는 모습을 구현
   function innerReset(error){
      for (var i = 0; i < error.length; i++) {
         error[i].innerHTML = "";
      }
   }

   // 초기화 메서드 호출
   innerReset(error);

// [ 학번 입력문자 유효성검사 ]
   join.schoolNum.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
   innerReset(error); // 초기화 메서드 호출   
      var schoolNumLimit = /^[0-9]{4,5}$/; // 정규식(^$--> 문자의미, 01, (6자리중 "1자리"), 0~9--> "5자리")
      if (!schoolNumLimit.test(input[0].value)) { //입력값과 정규식 범위와 같지 않다면
         // pw의 오류 문구삽입 
         document.getElementById(errorId[0]).innerHTML ="	 올바른 형식이 아닙니다. 다시 확인해주세요.";
      }
   }
   
   // [ 이름 입력 유효성검사 ] 
   join.name.onkeydown = function(){ //입력값과 정규식 범위와 같지 않다면
      innerReset(error); // 초기화 메서드 호출
      var nameLimit = /[0-9a-zA-Zㄱ-ㅎㅏ-ㅣ]/; // 정규식 0~9, a~z, A~Z, -, _, .내에서만 입력가능
         if (!nameLimit.test(input[1].value)) {  //입력값과 정규식 범위와 같지 않다면
            // 이메일의 오류 문구삽입
            document.getElementById(errorId[1]).innerHTML =" 	 올바른 형식이 아닙니다. 영문,숫자, (-)(_)(.) 입력만 가능합니다.";
         }
      }
   
   // [ ID 입력문자 유효성검사 ] 
   join.id.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식 5~20자 (a~z, A~Z, 0~9, -, _만 입력가능)
      if (!idLimit.test(input[2].value)) { //입력값과 정규식 범위와 같지 않다면
         // id의 오류 문구삽입
         document.getElementById(errorId[2]).innerHTML =" 	5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";

      }
   }
   // [ PW 입력문자 유효성검사 ]
   join.pw.onkeydown = function(){
      innerReset(error); // 초기화 메서드 호출
      var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/; //정규식(a~z, A~Z, 0~9, ~!@#$%^&*()_- 만 입력가능)
      if (!pwLimit.test(input[3].value)) { //입력값과 정규식 범위와 같지 않다면
         // pw의 오류 문구삽입
         document.getElementById(errorId[3]).innerHTML ="	 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
      }   
   }
   // [ PW 재확인 입력문자 초기화 ]
   //비밀번호 동일여부는 submit 버튼 클릭시 검사해줄 예정
   join.pwCheck.onkeydown = function(){
      // pw의 오류 문구삽입
      innerReset(error);// 오류문구 초기화   
   }

   //submit 실행시 수행할 동작
   join.onsubmit = function() { //join에서 submit이 실행된다면 수행할 함수           
      var errorStr = [  " 학번을",  " 이름을", " 아이디를"," 비밀번호를", " 비밀번호 확인을"];
      
      innerReset(error); // 오류문구 초기화
      
      // [ input 공백확인 ]
      for (var i = 0; i < input.length - 1; i++) { // -1 == submit제외 
         if (!input[i].value) { 
            document.getElementById(errorId[i]).innerHTML = errorStr[i]+ " 입력해 주세요.";
            input[i].focus(); // 포커스 이동
            return false; // 종료 (포커스 이동유지를 위해 false 종료)
         }
      }        
	  }
      //유효성검사) 비밀번호 재확인
      if (join.pw.value != join.pwCheck.value) {
         document.getElementById("pwCheckError").innerHTML = " 	비밀번호가 일치하지 않습니다.";
         join.pwCheck.focus(); // 포커스 이동
         return false;
      }

      // 정규식 변수 모음     
      var idLimit = /^[a-zA-Z0-9-_]{5,20}$/; //정규식(a~z, A~Z, 0~9, -, _만 입력가능)
      var pwLimit = /^[a-zA-Z0-9~!@#$%^&*()_-]{10,20}$/;///[a-zA-Z0-9]{10, 20}/; //정규식(a~z, A~Z, 0~9,~!@#$%^&*()_-특수문자 만 입력가능)
      var schoolNumLimit =  /^[0-9]{5}$/; // 정규식(0~9) 중에서 5자리 입력 
      var nameLimit = /[a-zA-Zㄱ-ㅎㅏ-ㅣ]/; // 정규식 (a~z, A~Z, ㄱ~ㅎ, ㅏ~ㅣ 만 입력가능)

      // [ 학번 유효성검사 ]
      if (!schoolNumLimit.test(input[4].value)) { 
         document.getElementById(errorId[0]).innerHTML = "	 올바른 형식이 아닙니다. 다시 확인해주세요.";
         join.schoolNum.focus(); // 포커스 이동
         return false;
      }

     // [ 이름 유효성검사 ]
      if (!nameLimit.test(input[3].value)) { 
         document.getElementById(errorId[1]).innerHTML = "	 올바른 형식이 아닙니다. 영문, 한글 외 입력은 불가합니다.";
         join.name.focus(); // 포커스 이동
         return false;
      }
     
      // [ ID 유효성검사 ]
      if (!idLimit.test(input[0].value)) {
         document.getElementById(errorId[2]).innerHTML = "	 5~20자의 영문 소대문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.";
         join.id.focus(); // 포커스 이동
         return false;
      }

      // [ PW 유효성검사 ]
      if (!pwLimit.test(input[1].value)) {
         document.getElementById(errorId[3]).innerHTML = "	 10~20자의 영문 소대문자, 숫자와 특수기호 '~!@#$%^&*()_-'만 사용 가능합니다.";
         //console.log(input[1].value);
         //console.log(pwLimit.test(input[1].value));
         join.pw.focus(); // 포커스 이동
         return false
      }         
    
      // 개인정보 동의박스 체크
      var consentCheck = document.getElementById("check");
      //console.log(consentCheck);
      if(!consentCheck.checked){
         document.getElementById("consentError").innerHTML = " 	개인정보 수집이용 동의를 해주세요.";
         return false;
      }
      
      alert("회원가입이 완료되었습니다.");
		
}
</script>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Font Awesome 5 CDN link to add icons -->
    <title>KHHS 회원가입 창</title>
    <!-- Linking .css file with HTML page -->
    <link rel="stylesheet" href="css/signUp.css">
    
</head>
<body>
 <div>
  	<form method ="post" action="/UserCtrl?action=join">
		<!--  <form action="" method="get"> -->
		
 		<div id="container">
	    	<div class="row_group">
            <img src="img/lionMark.png" style ="display: block; margin-left; margin-top: 10px; width:110px; height:148px;">
     	   <!-- Left section of sign up form 아이디 이름 비번 학번   required autocomplete="off"   -->
						
         	<h1>회원가입</h1>        	    
          	     	    
        	<div class ="userInput">
           	  	<p><label class ="list">학번<span id="schoolNumError"></span></label></p>
          	  	<span class ="box int_id"><input type="text" name="grade" id="schoolNum" class ="int check" 
          	  		 maxlength="5"></span><br>
            </div>
             
             <div class="userInput">
                <p><label class ="list">이름<span id= "nameError"></span></label></p>
                <span class="box int_id"><input type="text" name="name" id="userName" class="int check" 
               		maxlength="20"></span><br>
             </div>
             
             <div class="userIntput">
                <p><label class="list">아이디<span id="idError"></span></label></p>
                <span class="box int_id"><input type="text" name="userID" id="id" name="id" class ="int check"
                	maxlength="20"></span><br>
             </div>
       
             <div class="userInput">
                <p><label class="list">비밀번호</label></p>
                <span class="box int_id"><input type="password" name="pw" id="pw" class="int check" 
                	 maxlength="20"></span><br>
             </div>
             
              <div class ="userInput">
                <p><label class="list">비밀번호 재확인<span id= "pwCheckError"></span></label></p>
                <span class="box int_id"><input type="password" id="pwCheck" class="int check" 
                	 maxlength="20" ></span><br>
             </div>
      		</div>       
                    <!-- 개인정보 수집 동의 -->
             <div class="userInput">
             	 <label class="list" style="font-size:8px">개인정보 수집/이용동의<span id="consentError"></span></label>
             	 <div id="informationConsent">
             		<span id="consentBox">
                		<span id="consentError">개인정보 처리방침</span><br>
                  		
                      	<br>
                      	
<p>< 경희고등학교 >('http://10.240.6.34:8080'이하 'KHHS')은(는) 「개인정보 보호법」 제30조에 따라 정보주체의 개인정보를 보호하고 이와 관련한 고충을 신속하고 원활하게 처리할 수 있도록 하기 위하여 다음과 같이 개인정보 처리방침을 수립·공개합니다.

제1조(개인정보의 처리목적)

< 경희고등학교 >(이)가 개인정보 보호법 제32조에 따라 등록․공개하는 개인정보파일의 처리목적은 다음과 같습니다.

1. 개인정보 파일명 : 개인정보 이용약관
개인정보의 처리목적 : 정보 이용및 확인
수집방법 : 홈페이지
보유근거 : 정보 확인
보유기간 : 준영구
관련법령 : 신용정보의 수집/처리 및 이용 등에 관한 기록 : 3년, 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년, 대금결제 및 재화 등의 공급에 관한 기록 : 5년, 계약 또는 청약철회 등에 관한 기록 : 5년, 표시/광고에 관한 기록 : 6개월


제2조(개인정보 영향평가 수행결과)






제3조(개인정보의 제3자 제공에 관한 사항)

① < 경희고등학교 >은(는) 개인정보를 제1조(개인정보의 처리 목적)에서 명시한 범위 내에서만 처리하며, 정보주체의 동의, 법률의 특별한 규정 등 「개인정보 보호법」 제17조 및 제18조에 해당하는 경우에만 개인정보를 제3자에게 제공합니다.

② < 경희고등학교 >은(는) 다음과 같이 개인정보를 제3자에게 제공하고 있습니다.

1. < 서버 관리자 >
개인정보를 제공받는 자 : 서버 관리자
제공받는 자의 개인정보 이용목적 : 로그인ID, 이름
제공받는 자의 보유.이용기간: 준영구


제4조(개인정보처리의 위탁에 관한 사항)

① < 경희고등학교 >은(는) 원활한 개인정보 업무처리를 위하여 다음과 같이 개인정보 처리업무를 위탁하고 있습니다.

1.
위탁받는 자 (수탁자) :
위탁하는 업무의 내용 :
위탁기간 :
② < 경희고등학교 >은(는) 위탁계약 체결시 「개인정보 보호법」 제26조에 따라 위탁업무 수행목적 외 개인정보 처리금지, 기술적․관리적 보호조치, 재위탁 제한, 수탁자에 대한 관리․감독, 손해배상 등 책임에 관한 사항을 계약서 등 문서에 명시하고, 수탁자가 개인정보를 안전하게 처리하는지를 감독하고 있습니다.

③ 위탁업무의 내용이나 수탁자가 변경될 경우에는 지체없이 본 개인정보 처리방침을 통하여 공개하도록 하겠습니다.



제5조(개인정보의 파기절차 및 파기방법)


① < 경희고등학교 > 은(는) 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체없이 해당 개인정보를 파기합니다.

② 정보주체로부터 동의받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
1. 법령 근거 :
2. 보존하는 개인정보 항목 : 계좌정보, 거래날짜

③ 개인정보 파기의 절차 및 방법은 다음과 같습니다.
1. 파기절차
< 경희고등학교 > 은(는) 파기 사유가 발생한 개인정보를 선정하고, < 경희고등학교 > 의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.

2. 파기방법




제6조(정보주체와 법정대리인의 권리·의무 및 그 행사방법에 관한 사항)



① 정보주체는 경희고등학교에 대해 언제든지 개인정보 열람·정정·삭제·처리정지 요구 등의 권리를 행사할 수 있습니다.

② 제1항에 따른 권리 행사는경희고등학교에 대해 「개인정보 보호법」 시행령 제41조제1항에 따라 서면, 전자우편, 모사전송(FAX) 등을 통하여 하실 수 있으며 경희고등학교은(는) 이에 대해 지체 없이 조치하겠습니다.

③ 제1항에 따른 권리 행사는 정보주체의 법정대리인이나 위임을 받은 자 등 대리인을 통하여 하실 수 있습니다.이 경우 “개인정보 처리 방법에 관한 고시(제2020-7호)” 별지 제11호 서식에 따른 위임장을 제출하셔야 합니다.

④ 개인정보 열람 및 처리정지 요구는 「개인정보 보호법」 제35조 제4항, 제37조 제2항에 의하여 정보주체의 권리가 제한 될 수 있습니다.

⑤ 개인정보의 정정 및 삭제 요구는 다른 법령에서 그 개인정보가 수집 대상으로 명시되어 있는 경우에는 그 삭제를 요구할 수 없습니다.

⑥ 경희고등학교은(는) 정보주체 권리에 따른 열람의 요구, 정정·삭제의 요구, 처리정지의 요구 시 열람 등 요구를 한 자가 본인이거나 정당한 대리인인지를 확인합니다.



제7조(개인정보의 안전성 확보조치에 관한 사항)

< 경희고등학교 >은(는) 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.

1. 개인정보 취급 직원의 최소화 및 교육
개인정보를 취급하는 직원을 지정하고 담당자에 한정시켜 최소화 하여 개인정보를 관리하는 대책을 시행하고 있습니다.




제8조(개인정보를 자동으로 수집하는 장치의 설치·운영 및 그 거부에 관한 사항)



경희고등학교 은(는) 정보주체의 이용정보를 저장하고 수시로 불러오는 ‘쿠키(cookie)’를 사용하지 않습니다.


제9조(가명정보를 처리하는 경우 가명정보 처리에 관한 사항)

< 경희고등학교 > 은(는) 다음과 같은 목적으로 가명정보를 처리하고 있습니다.

▶ 가명정보의 처리 목적

- 직접작성 가능합니다.

▶ 가명정보의 처리 및 보유기간

- 직접작성 가능합니다.

▶ 가명정보의 제3자 제공에 관한 사항(해당되는 경우에만 작성)

- 직접작성 가능합니다.

▶ 가명정보 처리의 위탁에 관한 사항(해당되는 경우에만 작성)

- 직접작성 가능합니다.

▶ 가명처리하는 개인정보의 항목

- 직접작성 가능합니다.

▶ 법 제28조의4(가명정보에 대한 안전조치 의무 등)에 따른 가명정보의 안전성 확보조치에 관한 사항

- 직접작성 가능합니다.

제10조 (개인정보 보호책임자에 관한 사항)

① 경희고등학교 은(는) 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 정보주체의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.

▶ 개인정보 보호책임자
성명 :연현중
직책 :팀장
직급 :팀장
연락처 :02-966-3782, freee8327@gmail.com,
※ 개인정보 보호 담당부서로 연결됩니다.


▶ 개인정보 보호 담당부서
부서명 :
담당자 :
연락처 :, ,
② 정보주체께서는 경희고등학교 의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 경희고등학교 은(는) 정보주체의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.

제11조(개인정보의 열람청구를 접수·처리하는 부서)
정보주체는 ｢개인정보 보호법｣ 제35조에 따른 개인정보의 열람 청구를 아래의 부서에 할 수 있습니다.
< 경희고등학교 >은(는) 정보주체의 개인정보 열람청구가 신속하게 처리되도록 노력하겠습니다.

▶ 개인정보 열람청구 접수·처리 부서
부서명 :
담당자 :
연락처 : , ,


제12조(정보주체의 권익침해에 대한 구제방법)



정보주체는 개인정보침해로 인한 구제를 받기 위하여 개인정보분쟁조정위원회, 한국인터넷진흥원 개인정보침해신고센터 등에 분쟁해결이나 상담 등을 신청할 수 있습니다. 이 밖에 기타 개인정보침해의 신고, 상담에 대하여는 아래의 기관에 문의하시기 바랍니다.

1. 개인정보분쟁조정위원회 : (국번없이) 1833-6972 (www.kopico.go.kr)
2. 개인정보침해신고센터 : (국번없이) 118 (privacy.kisa.or.kr)
3. 대검찰청 : (국번없이) 1301 (www.spo.go.kr)
4. 경찰청 : (국번없이) 182 (ecrm.cyber.go.kr)

「개인정보보호법」제35조(개인정보의 열람), 제36조(개인정보의 정정·삭제), 제37조(개인정보의 처리정지 등)의 규정에 의한 요구에 대 하여 공공기관의 장이 행한 처분 또는 부작위로 인하여 권리 또는 이익의 침해를 받은 자는 행정심판법이 정하는 바에 따라 행정심판을 청구할 수 있습니다.

※ 행정심판에 대해 자세한 사항은 중앙행정심판위원회(www.simpan.go.kr) 홈페이지를 참고하시기 바랍니다.

제13조(영상정보처리기기 운영·관리에 관한 사항)
① < 경희고등학교 >은(는) 아래와 같이 영상정보처리기기를 설치·운영하고 있습니다.

1.영상정보처리기기 설치근거·목적 : < 경희고등학교 >의

2.설치 대수, 설치 위치, 촬영 범위 :
설치대수 : 1 대
설치위치 :
촬영범위 :
3.관리책임자, 담당부서 및 영상정보에 대한 접근권한자 :

4.영상정보 촬영시간, 보관기간, 보관장소, 처리방법
촬영시간 : 시간
보관기간 : 촬영시부터
보관장소 및 처리방법 :
5.영상정보 확인 방법 및 장소 :

6.정보주체의 영상정보 열람 등 요구에 대한 조치 : 개인영상정보 열람.존재확인 청구서로 신청하여야 하며, 정보주체 자신이 촬영된 경우 또는 명백히 정보주체의 생명.신체.재산 이익을 위해 필요한 경우에 한해 열람을 허용함

7.영상정보 보호를 위한 기술적.관리적.물리적 조치 :



제14조(개인정보 처리방침 변경)


① 이 개인정보처리방침은 2022년 12월 27부터 적용됩니다.

② 이전의 개인정보 처리방침은 아래에서 확인하실 수 있습니다.</p>
            	 	</span>
                 </div>
               	 <label class="select">동의<input type="radio" id="check" name="check" value="동의" checked></label>
            	 <label class="select">비동의<input type="radio" id="noneCheck"name="check" value="비동의" checked></label>
              	 </div>
            	 <br>
            	 <div class="btn_area">
                 	<input type="submit" value="가입하기" id="btnJoin" class="btn_type btn_primary"><a href="logIn.jsp"></a>
				 </div>
			</div>
		</form>
	</div>
             <p>이미 회원이신가요? <a href="logIn.jsp">로그인 하기</a></p><br><br>  <!-- 로그인 페이지로 이동, " " 안에 로그인 페이지 파일 넣기 -->
</body>
</html>
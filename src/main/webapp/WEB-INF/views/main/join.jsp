<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../include/header.jsp"%>
<!-- ${pageContext.request.contextPath} -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- iamport.payment.js -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript">
// 휴대폰 인증
</script>
<script type="text/javascript">
// 비밀번호 유효성 검사
function checkpw() {
	var pw = document.getElementById("pw").value;
	 if(pw.length>7) {
		 if(pw.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-])/)||
			pw.match(/([!,@,#,$,%,^,&,*,?,_,~,-].*[a-zA-Z0-9])/)) {
			 $(".pwdiv").html("사용 가능한 비밀번호입니다.");
			 $(".pwdiv").css('color','blue');
		 }else {
			$(".pwdiv").html("비밀번호는 영어대소문자, 숫자, 특수문자가 하나씩 포함되어야 합니다.");
			$(".pwdiv").css('color','red');
			document.getElementById("pw").value="";
		 } 
	 }else {
			$(".pwdiv").html("비밀번호는 8글자 이상, 16글자 이하만 사용 가능합니다.");
			$(".pwdiv").css('color','red');
			document.getElementById("pw").value="";
	} 
}
// 비밀번호 일치 검사
function checkpw2() {
	if($('#pw').val()!=$('#pw2').val()){
		$('.pw2div').html('비밀번호가 일치하지 않습니다.');
		$('.pw2div').css('color','red');
		$('#pw2').focus();
		document.getElementById("pw2").value="";
 	} else {
 		$('.pw2div').html('비밀번호가 일치합니다.');
		$('.pw2div').css('color','blue');
		$('#pw2').focus();
 	}
}

const autoHyphen = (target) => {
 target.value = target.value
 .replace(/[^0-9]/g, '')
 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
 .replace(/(\-{1,2})$/g, "");
}

</script>
<script>

$(document).ready(function(){	     
	var idflag = document.getElementById("idflag");
// 	alert(idflag.value);

    // 아이디 중복여부를 확인한 뒤 submit 가능
    $("#join").submit(function(){
		if(idflag.value=="false") {
	    	alert("아이디 중복 여부를 확인하세요");
	    	$("#id").focus();
			return false;
		}
    });
	
	$("#idcheck").click(function(){
// 		alert('중복체크');
		$.ajax({
            url : "/member/idcheck",
            data: {'id':$("#id").val()},
            success : function(result) {
            	if(result == "no"){
		            //아이디가 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
		            $('.iddiv').html("이미 존재하는 아이디입니다");
		            $('.iddiv').css('color','red');
		            document.getElementById("id").value=="";
		            $("#id").focus();
           		} else {
           		 	$(".iddiv").html("사용 가능한 아이디입니다");
		            $(".iddiv").css("color","blue");
		            idflag.value="true";
		            document.set
           		}
            },//success
            error : function(error) {
            	$('.iddiv').html("에러");
            	return false;
            }//error
 		});//ajax
	});//idcheck
	
	$("#nick").change(function(){
// 		alert('닉네임 중복체크');
		$.ajax({
            url : "/member/nickcheck",
            data: {'nick':$("#nick").val()},
            success : function(result) {
            	if(result == "no"){
		            //닉네임이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
		            $(".nickdiv").html("이미 존재하는 닉네임입니다.");
		            $(".nickdiv").css("color","red");
		            document.getElementById("nick").value=="";
		            $("#nick").focus();
           		} else if(result == "ok"){
           		 	$(".nickdiv").html("사용 가능한 닉네임입니다.");
		            $(".nickdiv").css("color","blue");
           		} else {
           			$(".nickdiv").html("");
           		}
            },//success
            error : function(error) {
            	$('.iddiv').html("에러");
            	return false;
            }//error
 		});//ajax
	});//nickcheck
}); //document
</script>
<h1>member/insert.jsp</h1>
<hr>
<div id="container" role="main">
	<div id="content">
		<form action="/main/join" method="post" id="join">
			<!-- tg-text=title -->
			<h2 class="">보라 회원가입</h2>
			<div class="join_content">
				<!-- 아이디  -->
				<div class="join_id">
					<h6>아이디</h6>
					<input type="text" id="id" name="id" class="" 
					placeholder="" required="required"> 
					<input type="button" value="중복체크" id="idcheck"><br>
					<span class="iddiv">&nbsp;</span>
				</div>
				<!-- 비밀번호 -->
				<div class="join_pw">
					<h6>비밀번호</h6>
					<input type="password" id="pw" name="pw" class="" maxlength="16" 
					placeholder="" required="required" onchange="checkpw()"> <br>
					<span class="pwdiv">&nbsp;</span>
				</div>
				<!-- 비밀번호 확인 -->
				<div class="join_pw2">
					<h6>비밀번호 확인</h6>
					<input type="password" id="pw2" name="pw2" class="" maxlength="16"
					placeholder="" required="required" onchange="checkpw2()"> <br>
					<span class="pw2div">&nbsp;</span>
				</div>
				<!-- 이름 -->
				<div class="join_name">
					<h6>이름</h6>
					<input type="text" id="name" name="name" class="" 
					placeholder="" required="required"> <br>
				</div>
				<!-- 닉네임 -->
				<div class="join_nick">
					<h6>닉네임</h6>
					<input type="text" id="nick" name="nick" class="" 
					placeholder="" required="required"> <br>
					<span class="nickdiv">&nbsp;</span>
				</div>
				<!-- 연락처 -->
				<div class="join_phone">
					<h6>연락처</h6>
					<input type="text" id="phone" name="phone" class="" 
					placeholder="- 없이 숫자만" required="required" maxlength="13"
					oninput="autoHyphen(this)" autofocus> 
					<button>휴대폰 인증</button> <br>
				</div>
				<!-- 이메일 -->
				<div class="join_email">
					<h6>이메일</h6>
					<input type="text" id="email" name="email" class="" 
					placeholder="" required="required"> <br>
				</div>
			</div>
			<input type="hidden" value="false" id="idflag" placeholder="아이디 중복체크 했나요?"> <br>
			<input type="submit" value="가입하기">
		</form>
	</div>
</div>
<%@ include file="../include/footer.jsp"%>
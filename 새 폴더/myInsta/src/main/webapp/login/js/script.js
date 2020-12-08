$(function(){
//------------------------ login_로그인 ------------------------
let login_idcheck = false;
let login_pwcheck = false; 
let emailCheck = RegExp(/^[a-zA-Z0-9\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-]+/);
let hpCheck = RegExp(/^\d{3}\d{3,4}\d{4}$/);
let idCheck = RegExp(/^[a-zA-Z0-9\.\_]{6,20}$/);
let pwCheck = RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^+=]).*$/);

// 아이디로 로그인 버튼 활성화
$("body").keyup(function(){
    if(!emailCheck.test($(".log_id").val()) && !idCheck.test($(".log_id").val())){
        $(".btn_login").removeClass("on");
        login_idcheck = false;
    }else{
        login_idcheck = true; 
    }
});

// 비밀번호로 로그인 버튼 활성화
$(".log_pw").on("propertychange change keyup paste input",function(){
    if(!pwCheck.test($(".log_pw").val())){
        $(".btn_login").removeClass("on");
        login_pwcheck = false; 
    }else{
        login_pwcheck = true; 
    }
});
// 로그인 버튼 활성화
$("body").keyup(function(){
    if(login_idcheck && login_pwcheck){
        $(".btn_login").attr("disabled", false);
        $(".btn_login").addClass("on");
    }else{
        $(".btn_login").attr("disabled", "disabled");
        $(".btn_login").removeClass("on");
    }
});

// 로그인 타이틀 이미지 변경
let isinstaimg = 3;
setInterval(function() {
    if(isinstaimg === 3){
        $(".instaimg3").addClass("login_img1");
        $(".instaimg2").addClass("login_img2");
        $(".instaimg1").addClass("login_img3");
        $(".instaimg3").removeClass("login_img2");
        $(".instaimg2").removeClass("login_img3");
        $(".instaimg1").removeClass("login_img1");
        isinstaimg = 2;
    }else if(isinstaimg === 2){
        $(".instaimg2").addClass("login_img1");
        $(".instaimg1").addClass("login_img2");
        $(".instaimg3").addClass("login_img3");
        $(".instaimg2").removeClass("login_img2");
        $(".instaimg1").removeClass("login_img3");
        $(".instaimg3").removeClass("login_img1");
        isinstaimg = 1;
    }else if(isinstaimg === 1){
        $(".instaimg1").addClass("login_img1");
        $(".instaimg3").addClass("login_img2");
        $(".instaimg2").addClass("login_img3");
        $(".instaimg1").removeClass("login_img2");
        $(".instaimg3").removeClass("login_img3");
        $(".instaimg2").removeClass("login_img1");
        isinstaimg = 3;
    }
  }, 5000);
  //------------------------ join_회원가입 ------------------------
  
  let nameCheck = RegExp(/^[가-힣]+$/);
  let join_emailcheck = false;
  let join_namecheck = false;
  let join_idcheck = false;
  let join_pwcheck = false;
  

  //이메일 정규식
    $("#join_email").on("propertychange change keyup paste input",function(){
        if(!emailCheck.test($(this).val())){
            $(".checkimg_email").removeClass("on");
            $(".checkimg_email").addClass("no");
            $("#idcheck_text").html(" ");
            join_emailcheck = false;
        }else{
//        이메일 ajex 중복체크	
            let xhr = new XMLHttpRequest();
            let email = $("#join_email").val();
            xhr.open("GET", "emailCheck.jsp?email="+email, true);
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            		let result = xhr.responseText;
            		if(result.trim() == "ok"){
            			$(".checkimg_email").removeClass("no");
            			$(".checkimg_email").addClass("on");
            			$("#idcheck_text").html(" ");
            			join_emailcheck = true;
            		}else{
            			$(".checkimg_email").removeClass("on");
            			$(".checkimg_email").addClass("no");
            			$("#idcheck_text").html("중복된 이메일입니다.");
            			join_emailcheck = false;
            		}
            	}
            }
		}
    });

    
    
    //이름 정규식
    $("#join_name").on("propertychange change keyup paste input",function(){
        if(!nameCheck.test($(this).val())){
            $(".checkimg_name").removeClass("on");
            $(".checkimg_name").addClass("no");
            join_namecheck = false;
        }else{
            $(".checkimg_name").removeClass("no");
            $(".checkimg_name").addClass("on");
            join_namecheck = true;
        }
    });

    //아이디(닉네임) 정규식
    $("#join_id").on("propertychange change keyup paste input",function(){
        if(!idCheck.test($(this).val())){
            $(".checkimg_id").removeClass("on");
            $(".checkimg_id").addClass("no");
            join_idcheck = false;
        }else{
//          아이디 ajax 중복체크	
            let xhr = new XMLHttpRequest();
            let userid = $("#join_id").val();
            xhr.open("GET", "idCheck.jsp?userid="+userid, true);
            xhr.send();
            xhr.onreadystatechange = function(){
            	if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
            		let result = xhr.responseText;
            		if(result.trim() == "ok"){
            			$(".checkimg_id").removeClass("no");
            			$(".checkimg_id").addClass("on");
            			$("#idcheck_text").html(" ");
            			join_idcheck = true;
            		}else{
            			$(".checkimg_id").removeClass("on");
            			$(".checkimg_id").addClass("no");
            			$("#idcheck_text").html("중복된 아이디입니다.");
            			join_idcheck = false;
            		}
            	}
            }
        }
    });
 
   
    //비밀번호 정규식
    $("#join_pw").on("propertychange change keyup paste input",function(){
        if(!pwCheck.test($(this).val())){
            $(".checkimg_pw").removeClass("on");
            $(".checkimg_pw").addClass("no");
            join_pwcheck = false;
        }else{
            $(".checkimg_pw").removeClass("no");
            $(".checkimg_pw").addClass("on");
            join_pwcheck = true;
        }
    });

    // 다 적절할때 회원가입 버튼 활성화
    $("body").keyup(function(){
        if(join_emailcheck && join_namecheck && join_idcheck && join_pwcheck){
            $(".btn_join").attr("disabled", false);
            $(".btn_join").addClass("on");
        }else{
            $(".btn_join").attr("disabled", "disabled");
            $(".btn_join").removeClass("on");
        }
    });
    // 회원가입 끝
    
    // 이메일 인증     
    $("#emailaut_btn").on("click",function(){
    	
    	let xhr = new XMLHttpRequest();
    	let iscode = $("#email_aut").val();
    	xhr.open("GET", "emailCodeCheck.jsp?iscode="+iscode, true);
    	xhr.send();
    	xhr.onreadystatechange = function(){
    		if(xhr.readyState == XMLHttpRequest.DONE && xhr.status == 200){
    			let result = xhr.responseText;
    			if(result.trim() == "ok"){
    				location.href="code_email_ok.jsp";
    			}else{
    				$(".codeCheck_Text").html(" 코드가 맞지 않습니다. ");
    				
    			}
    		}
    	}
    });
    
    // 이메일 인증 끝

    
    // 비밀번호 변경
    let changepw1 = false;
    let changepw2 = false;
    
  //비밀번호 정규식
    $("#pw1").on("propertychange change keyup paste input",function(){
        if(!pwCheck.test($(this).val())){
        	changepw1 = false;
        }else{
        	changepw1 = true;
        }
    });
    
    $("body").keyup(function(){
        if($("#pw1").val() == $("#pw2").val()){
        	changepw2 = true;
        }else{
        	changepw2 = false;
        }
    });
    
    $("body").keyup(function(){
        if(changepw1 && changepw2){
          $("#changepw_btn").attr("disabled", false);
          $("#changepw_btn").addClass("on");
        }else{
        	$("#changepw_btn").attr("disabled", "disabled");
        	$("#changepw_btn").removeClass("on");
        }
    });
    
    // 비밀번호 변경 끝
    // --------------------전체 복붙---------------

    

});
    
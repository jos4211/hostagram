
$(function(){
    
//------------------------ login_로그인 ------------------------
let login_idcheck = false;
let login_pwcheck = false; 
let emailCheck = RegExp(/^[a-zA-Z0-9\.\-]+@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-]+/);
let hpCheck = RegExp(/^\d{3}\d{3,4}\d{4}$/);
let idCheck = RegExp(/^[a-zA-Z0-9\.\_]{6,20}$/);
let pwCheck = RegExp(/^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^+=]).*$/);
// 아이디로 로그인 버튼 활성화

$(".log_id").keyup(function(){
    if(!emailCheck.test($(".log_id").val()) && !hpCheck.test($(".log_id").val()) && !idCheck.test($(".log_id").val())){
        $(".btn_login").removeClass("on");
        login_idcheck = false;
    }else{
        login_idcheck = true; 
    }
});

// 비밀번호로 로그인 버튼 활성화
$(".log_pw").keyup(function(){
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
  let join_hpemailcheck = false;
  let join_namecheck = false;
  let join_idcheck = false;
  let join_pwcheck = false;
  // 휴대폰 번호 혹은 이메일 정규식
    $("#join_phemail").keyup(function(){
        if(!emailCheck.test($(this).val()) && !hpCheck.test($(this).val())){
            $(".checkimg_phemail").removeClass("on");
            $(".checkimg_phemail").addClass("no");
            join_hpemailcheck = false;
        }else{
            $(".checkimg_phemail").removeClass("no");
            $(".checkimg_phemail").addClass("on");
            join_hpemailcheck = true;
        }
    });
    //이름 정규식
    $("#join_name").keyup(function(){
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
    $("#join_id").keyup(function(){
        if(!idCheck.test($(this).val())){
            $(".checkimg_id").removeClass("on");
            $(".checkimg_id").addClass("no");
            join_idcheck = false;
        }else{
            $(".checkimg_id").removeClass("no");
            $(".checkimg_id").addClass("on");
            join_idcheck = true;
        }
    });
    //비밀번호 정규식
    $("#join_pw").keyup(function(){
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
        if(join_hpemailcheck && join_namecheck && join_idcheck && join_pwcheck){
            $(".btn_join").attr("disabled", false);
            $(".btn_join").addClass("on");
        }else{
            $(".btn_join").attr("disabled", "disabled");
            $(".btn_join").removeClass("on");
        }
    });
    // 이메일 인증 페이지에 갈지, 휴대폰 인증 페이지에 갈지 구분
//    $(".btn_join").on("click",function(){
//        if(emailCheck.test($("#join_phemail").val())){
//            location.href="email_authentication.html";
//        }else{
//            location.href="ph_authentication.html";
//        }
//    });
//    
    // 회원가입 끝
    
    
    // ------------------------ join_생일 입력
    let date = new Date();
    let year = date.getFullYear();
    for(let i=1900; i<=year; i++){
        $("#join_y").after("<option value='"+i+"'>"+i+"</option>");
    }
    for(let i=1; i<=12; i++){
        $("#join_m").after("<option value='"+i+"'>"+i+"</option>");
    }
    for(let i=1; i<=31; i++){
        $("#join_d").after("<option value='"+i+"'>"+i+"</option>");
    }    
});

//preview the file that will be uploaded
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function(event) {
            $('#blah').html('<img src="'+event.target.result+'" alt="your image">');
        }

        reader.readAsDataURL(input.files[0]);
    }
}

// drag and drop file image
$(function() {
    $('#blah').bind('dragover', function() {
        $(this).addClass('dropzone-active');
    });
    $('#blah').bind('dragleave', function() {
        $(this).removeClass('dropzone-active');
    });
});

function drag_drop(event) {
    event.preventDefault();
    readURL(event.dataTransfer);
}

//게시물 페이지
//댓글 달기
$(function() {
	$(".reply_button").click(function(){
		if(($(".reply_textarea").val() != "")){
			$(location).attr("href","replyInput.jsp?text="+($(".reply_textarea").val())+"&bidx="+($("#content_bidx").val())+"&midx="+($("#content_midx").val()));
		}
	});
});

$(()=>{
	const getAtlink = (str) => {
		const setlink = (tag) => {
			let link =
				/*html*/
				`<a style="color: #0095f6" href="./other/otherperson.jsp?userid=${tag.substr(1)}">${tag}</a>`;

			return link;
		};
		const emptyFilter = (arrs) => {
			return arrs.filter(function(item) {
				return item !== null && item !== undefined && item !== "";
			});
		};

		str = str.split(" ");
		let strmap = /*html*/ ``;
		str.map((x) => {
			if (x.includes("@")) {
				if (x.indexOf("@") != 0) {
					let notTag = x.trim().split("@");
					notTag = emptyFilter(notTag);
					strmap += notTag[0];
					for (let i = 1; i < notTag.length; i++) {
						strmap += setlink("@" + notTag[i]);
					}
					strmap += " ";
					return;
				}
				if (x.match(/@/g).length > 1) {
					let sphash = x.trim().split("@");

					sphash = emptyFilter(sphash);

					for (strel of sphash) {
						strmap += setlink("@" + strel);
					}
					strmap += " ";
					return;
				}
				strmap += setlink(x) + " ";
				return;
			}
			strmap += x + " ";
			return;
		});
		return strmap;
	};
	const getTaglink = (str) => {
		const setlink = (tag) => {
			let link =
				/*html*/
				`<a style="color: #0095f6" href="./main_search.jsp?tag=${tag.substr(1)}">${tag}</a>`;
			return link;
		};
		const emptyFilter = (arrs) => {
			return arrs.filter(function(item) {
				return item !== null && item !== undefined && item !== "";
			});
		};

		str = str.split(" ");
		let strmap = /*html*/ ``;
		str.map((x) => {
			if (x.includes("#")) {
				if (x.indexOf("#") != 0) {
					let notTag = x.trim().split("#");
					notTag = emptyFilter(notTag);
					strmap += notTag[0];
					for (let i = 1; i < notTag.length; i++) {
						strmap += setlink("#" + notTag[i]);
					}
					strmap += " ";
					return;
				}
				if (x.match(/#/g).length > 1) {
					let sphash = x.trim().split("#");

					sphash = emptyFilter(sphash);

					for (strel of sphash) {
						strmap += setlink("#" + strel);
					}
					strmap += " ";
					return;
				}
				strmap += setlink(x) + " ";
				return;
			}
			strmap += x + " ";
			return;
		});
		return strmap;
	};

	let context= ``;
  context = $(".page_mycontent1").text();
  console.log("텍스트는" +context);
let context1 = ``;
context1 = getAtlink(getTaglink(context));
 console.log("여기는" + context1);
 $(".page_mycontent1").html(context1);

function x12() { context= ``;
context1 = ``;}
});
//팝업
$(function(){
    $("#popbtn5").click(function(){
        $("#pop5").fadeIn();
    });
    $("#pop5").click(function(){
        $("#pop5").fadeOut();
    });
    $("#mybtn5_1").click(function(){
        $("#pop6").fadeIn();
    });
    $(".pop6_btn").click(function(){
        $("#pop6").fadeOut();
    });
    $("#mybtn5_2").click(function(){
        $("#pop7").fadeIn();
    });
    $("#pop7").click(function(){
        $("#pop7").fadeOut();
    });
    $("#popbtn5").click(function(){
        $("#pop5").fadeIn();
    });
    $("#pop5").click(function(){
        $("#pop5").fadeOut();
    });
    $("#mybtn5_1").click(function(){
        $("#pop6").fadeIn();
    });
    $(".pop6_btn").click(function(){
        $("#pop6").fadeOut();
    });
    $("#mybtn5_2").click(function(){
        $("#pop7").fadeIn();
    });
    $("#pop7").click(function(){
        $("#pop7").fadeOut();
    });
    $("#contentDelete").click(function(){
    	$("#pop5").fadeOut();
    	$("#delectOk").fadeIn();
    });
    $("#deleteBtnNo").click(function(){
    	$("#delectOk").fadeOut();
    });
    
    // Get the modal
    var modal = document.getElementById('pop8');
    
    // Get the button that opens the modal
    var btn = document.getElementById("pop8_open");

    // When the user clicks on the button, open the modal 
    btn.onclick = function() {
        modal.style.display = "block";
    }

    // When the user clicks anywhere outside of the modal, close it
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
    
    
}); 
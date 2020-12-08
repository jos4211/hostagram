 $(function(){
           $('.hd_heart').on('click', function(){
               if($('.hd_heart_sub').hasClass('on')) {
                  $(".hd_heartimg").attr("src", "./images/2.PNG");
                   $('.hd_heart_sub').removeClass('on');
               }else {
                  
                  $(".hd_heartimg").attr("src", "./images/1.PNG");
                   $('.hd_heart_sub').addClass('on');
               }
           })
           
       });
 
 $(function(){
     $('.hd_heart1').on('click', function(){
         if($('.hd_heart_sub1').hasClass('on')) {
            $(".hd_heartimg1").attr("src", "../images/2.PNG");
             $('.hd_heart_sub1').removeClass('on');
         }else {
            
            $(".hd_heartimg1").attr("src", "../images/1.PNG");
             $('.hd_heart_sub1').addClass('on');
         }
     })
     
 });
 

 
 $(function(){
	$('.f_btn').on('click', function(){
		if($(this).val() == '팔로우') {
			$(this).css('background-color', '#fff');
			$(this).val('팔로잉').css('color', '#000').css('border', '1px solid #ccc')
		}else {
			$(this).css('background-color', '#0095f6');
			$(this).val('팔로우').css('color', '#fff')
		}
	}) 
 });
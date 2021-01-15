<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Hostagram</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="../js/script.js"></script>
<link rel="stylesheet" href="../cssmain/common.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script src="../js/main_script.js"></script>
<%@ page isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.fp { width: 100%; height: 100%;   display: none;
position: fixed; top:0px; left:0px; background-color: rgba(0,0,0,0.6);}
.fp2 { width: 100%; height: 100%;   display: none;
position: fixed; top:0px; left:0px; background-color: rgba(0,0,0,0.6);}
.follower_pop { width: 400px; height: 400px; position: absolute; left: 50%; top: 50%; transform: translate(-50%, -50%); background: #fff;
border: 1px solid #ccc; border-radius: 12px;}
.follower_pop .fw_pop { width: 100%; height: 43px; border-bottom: 1px solid #ccc;}
.follower_pop .fw_pop .pop_header { width: 100%; height: 100%; display: flex;}
.follower_pop .fw_pop .pop_header .hd_left, .follower_pop .fw_pop .pop_header .hd_right { height: 42px; width: 48px;}
.follower_pop .fw_pop .hd_h1 { 
	font-size: 16px;
 	text-align: center; 
 	margin: 0; 
 	height: 42px; 
 	width: 304px; 
 	font-weight: bold;
	line-height: 2.5; 
	justify-content: center;
}
.follower_pop .fw_pop .pop_header .hd_right { padding: 8px; box-sizing: border-box; background: 0 0;}
.follower_pop .fw_pop .pop_body { 
	height: 347px; 
	min-height: 200px; 
	overflow-y: scroll; 
	overflow-x: hidden;
	padding-top: 5px;
}
.follower_pop .fw_pop .pop_body ul { margin: 0; padding: 0;}
.follower_pop .fw_pop .pop_body ul .body_ing li { height: 46px; width: 383px; list-style: none;}
.body_ing .ing_li { display: flex; height: 46px; padding: 8px 16px; box-sizing: border-box;}
.body_ing .ing_li .li_img { width: 15%;}
.body_ing .ing_li .li_id { width: 65%; }
.body_ing .ing_li .li_btn { width: 20%;}
.body_ing .ing_li .li_btn input[type="button"] { width: 62px; height: 30px; background-color: #fff; border: 1px solid #ccc; 
color: #000; border-radius: 4px; font-weight: bold;}
.body_ing .ing_li .li_img a img { width: 30px; height: 30px; border-radius: 50%;}
.body_ing .ing_li .li_id p { font-size: 14px; line-height: 2; font-weight: bold;}
.pop_body .body_h1 { width: 100%; height: 30px; padding-left: 16px;}
.pop_body .body_h1 h1 { font-size: 16px; font-weight: bold;}
.body_ing .ing_li .li_btn2 input[type="button"] { width: 62px; height: 30px; background-color: #0095f6; border: 1px solid #ccc; 
border-radius: 4px; font-weight: bold; color: white;}
.exit_btn {
	border: none;
    background-color: white;
    height: 20px;
    width: 20px;
    font-size: 24px;
    line-height: 1;
}
</style> 
    <script>
        $(function(){
                $("#mybtn").click(function(){
                    $("#popup").fadeIn();
                });
                $("#popup").click(function(){
                    $("#popup").fadeOut();
                });
                $(".mybtn2").click(function(){
                    $("#popup2").fadeIn();
                });
                $(".pop2_btn").click(function(){
                    $("#popup2").fadeOut();
                });
            	$(".dobe").click(function(){
    				$(".dobe").addClass("on");
    			});
            }); 
        	   
    </script>
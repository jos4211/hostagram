$(() => {
	let start = 0;
	let pending = false;

	function CopyUrlToClipboard(element) {
		element.select();  // 해당 값이 선택되도록 select() 합니다
		document.execCommand("copy"); // 클립보드에 복사합니다.
		element.blur(); // 선택된 것을 다시 선택안된것으로 바꿈니다.
		alert("URL이 클립보드에 복사되었습니다");
	}

	// 태그에 링크걸기
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

		str = str.replace(/(\r\n|\n|\r)/gm," ").split(" ");
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

		str = str.replace(/(\r\n|\n|\r)/gm," ").split(" ");
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
	// 게시물 액션 주기
	const setbtnActions = function(newArticle, contentidx, islikeon, issaveon) {
		$(newArticle)
			.find(".con_btnLike")
			.on("click", function() {
				axios
					.post("./LikeServlet", "contentidx=" + contentidx)
					.then(function(response) {
						if ($(newArticle).find(".con_btnLike").attr("src") == "./images/heart.png") {
							$(newArticle).find(".con_btnLike").attr("src", "./images/emptyheart.png");
							cntlikes.text(numcnt - 1);
						} else {
							$(newArticle).find(".con_btnLike").attr("src", "./images/heart.png");
							cntlikes.text(numcnt + 1);
						}
					})
					.catch(function(error) {
						console.log(error);
					});
				const cntlikes = $(newArticle).find(".con_cntlikes");
				let numcnt = Number(cntlikes.text());
			});

		if (islikeon) {
			$(newArticle).find(".con_btnLike").attr("src", "./images/heart.png");
		}

		$(newArticle)
			.find(".con_btnSave")
			.on("click", function() {
				axios
					.post("./SaveServlet", "contentidx=" + contentidx)
					.then(function(response) {
						if ($(newArticle).find(".con_btnSave").attr("src") == "./images/save.png") {
							$(newArticle).find(".con_btnSave").attr("src", "./images/emptysave.png");
						} else {
							$(newArticle).find(".con_btnSave").attr("src", "./images/save.png");
						}
					})
					.catch(function(error) {
						console.log(error);
					});
			});

		if (issaveon) {
			$(newArticle).find(".con_btnSave").attr("src", "./images/save.png");
		}
		// 댓글달기
		(() => {
			$(newArticle)
				.find(".art_btnSubmitCmt")
				.on("click", function() {
					let textVal = $(newArticle).find(".art_con_cmt").val();
					let cntCmtt = $(newArticle).find(".see_cntCmtt");
					let cntcomment = Number(cntCmtt.text());
					axios
						.post("./CommentServlet", "contentidx=" + contentidx + "&cotext=" + textVal)
						.then(function(response) {
							$(newArticle).find(".art_con_cmt").val("");
							$(newArticle).find(".art_btnSubmitCmt").css({
								"pointer-events": "none",
								opacity: ".3",
							});
							cntCmtt.text(cntcomment + 1);
							let myaccount = $("#myaccountId").text();
							let cmtHtml =
								/*html*/
								`<p>
                                <a class="art_account" href="/${myaccount}">${myaccount}</a>
                                <span>&nbsp;${getTaglink(textVal)}</span>
                            </p>`;
							$(newArticle).find(".con_cmts").append(cmtHtml);
						})
						.catch(function(error) {
							console.log(error);
						});
				});

			$(newArticle)
				.find(".art_con_cmt")
				.on("keyup", function() {
					console.log($(this).val() != "");
					if ($(this).val() != "") {
						$(newArticle).find(".art_btnSubmitCmt").css({
							"pointer-events": "",
							opacity: "",
						});
					} else if ($(this).val() == "") {
						$(newArticle).find(".art_btnSubmitCmt").css({
							"pointer-events": "none",
							opacity: ".3",
						});
					}
				});
		})();
		 $(newArticle).find(".con_btnShare").on("click",function(){

    		let texturl=  $(newArticle).find(".urltext");
            let urlstr = "http://192.168.253.1:8888/insta/contentPage.jsp?b_idx="+contentidx; 
		 	texturl.val(urlstr);
    		CopyUrlToClipboard(texturl);

       })
	};

	// 코멘트 2개만 가져오기
	const getCmttwo = (cmts) => {
		let times = cmts.length;

		if (cmts.length > 2) {
			times = 2;
		}
		let sumCmt = ``;
		for (let i = 0; i < times; i++) {
			let oneCmt = cmts[i];
			console.log(oneCmt);
			let cmtHtml =
				/*html*/
				`<p>
                    <a class="art_account" href="./other/otherperson.jsp?userid=${oneCmt.coUserid}">${oneCmt.coUserid}</a>
                    <span>&nbsp;${getTaglink(oneCmt.coText)}</span>
                </p>`;
			sumCmt += cmtHtml;
		}
		return sumCmt;
	};

	const getEle = async () => {
		if (window.scrollY + 1000 > document.getElementById("feed_roll").offsetHeight) {
			console.log("스타트는 " + start);
			if (pending) {
				console.log("취소됨");
				return;
			}
			try {
				console.log("여기들어오나");
				pending = true;
				const response = await axios.post("./GetContentsServlet", "start=" + start);

				const newthing = response.data;
				console.log(newthing);
				for (let i = 0; i < newthing.result.length; i++) {
					let one_article = newthing.result[i];
					console.log("idx는" + one_article.idx);
					let cmts = getCmttwo(one_article.comment);
					//   console.log(cmts);
					let strHtml =
						/*html*/
						`<div class="main_article">
                                <div class="article_header">
                                    <div class="art_header_img">
                                        <a class="off_story" href="./other/otherperson.jsp?userid=${one_article.account}">
                                            <a class="on_story" href="./other/otherperson.jsp?userid=${one_article.account}">
                                                <img
                                                   src="${"uploads/" + one_article.profile}"
                                                    alt=""
                                                />
                                            </a>
                                        </a>
                                    </div>
                                    <div class="art_header_account">
                                        <a href="./other/otherperson.jsp?userid=${one_article.account}"><p class="art_account">${one_article.account}</p></a>
                                    </div>
                                    <div class="art_header_opt"><a href=""></a></div>
                                </div>
                                <div class="img_container">
                                    <img src="${"uploads/" + one_article.img ? "uploads/" + one_article.img : "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"}" 
									onerror="this.onerror=null;this.src='https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg';" 
									 alt="" />
                                </div>
                                <div class="article_content">
                                    <div class="art_content_btns">
										<input type="text" class="urltext" style="opacity: 0; position: absolute; left: -22222222px; top: -2323232px;" value="/mypage.jsp"> 
                                        <img class="con_btnLike" src="./images/emptyheart.png" alt="" />
                                        <a href="./contentPage.jsp?b_idx=${one_article.idx}"><img class="con_btnCmt" src="./images/comment.png" alt="" /></a>
                                        <img class="con_btnShare" src="./images/share.png" alt="" />
                                        <img class="con_btnSave" src="./images/emptysave.png" alt="" />
                                    </div>
                                    <div class="art_content_likes">
                                        <a href="./contentPage.jsp?b_idx=${one_article.idx}"><span class="con_likes">좋아요 <span class="con_cntlikes">${one_article.like}</span>개</span></a>
                                    </div>
                                    <div class="art_content_summary">
                                        <p>
                                            <a class="art_account" href="./other/otherperson.jsp?userid=${one_article.account}"><span>${one_article.account}</span></a>
                                            <span>&nbsp;${getAtlink(getTaglink(one_article.content))}</span>
                                        </p>
                                        <div >
                                            <div><a href="./contentPage.jsp?b_idx=${one_article.idx}" class="see_allCmt">댓글 <span class="see_cntCmtt">${one_article.cntcmt}</span>개 모두 보기</a></div>
                                            <div class="con_cmts">
                                            ${cmts}
                                            </div>
                                            <p><a class="art_con_time" href="">${one_article.date} 분 전</a></p>
                                        </div>
                                    </div>
                                    <div class="art_content_insert">
                                        <textarea aria-label="댓글 달기..." autocomplete="off" autocorrect="off" class="art_con_cmt" placeholder="댓글 달기..."></textarea>
                                        <span class="art_btnSubmitCmt" style="
                                        pointer-events: none;
                                        opacity: .3;
                                        ">게시</span>
                                    </div>
                                </div>
                            </div>`;

					let doc = document.createElement("div");
					doc.innerHTML = strHtml;
					let newArticle = doc.firstChild;
					document.getElementById("feed_box").appendChild(newArticle);
					setbtnActions(newArticle, one_article.idx, one_article.islikeon, one_article.issaveon, one_article.like);
				}
				start += 5;
			} catch (e) {
				console.log(e);
			} finally {
				pending = false;
			}
		}
	};

	getEle();
	// window.addEventListener("scroll", getEle, true);
	$(window).on("scroll", getEle);
	// 위젯 회전목마
	(() => {
		let rShift = 0;

		$(".nav_btnNext").on("click", function() {
			if (rShift <= 465) rShift += 96;
			$(".wget_hot_carousel .carousel_imgs").css("right", rShift + "px");
			if (rShift > 1) {
				$(".nav_btnBefore").css("visibility", "visible");
			}
		});
		$(".nav_btnBefore").on("click", function() {
			if (rShift > 0) rShift -= 96;
			$(".wget_hot_carousel .carousel_imgs").css("right", rShift + "px");
		});
	})();
});
//팔로우 버튼
$(() => {
	$(".item_btnFollow").on("click", function() {
		const btnFi = $(this);
		console.log($(this).text());
		const followingid = $(this).next().val();
		axios
			.post("./FollowServlet", "followingid=" + followingid)
			.then(function(response) {
				console.log(btnFi.text());
				if (btnFi.text() == "팔로우") {
					btnFi.text("팔로잉").css("backgroundColor", "white").css("color", "black");
				} else if (btnFi.text() == "팔로잉") {
					btnFi.text("팔로우").css("backgroundColor", "#3897f0").css("color", "white").css("border", "1px solid #3897f0");
				}
			})
			.catch(function(error) {
				console.log(error);
			});
	});
});

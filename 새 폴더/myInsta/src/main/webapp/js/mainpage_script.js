$(() => {
    let start = 0;
    let pending = false;

    
    const setEvent = function (newArticle) {
        console.log($(newArticle).find(".boxs"));
        $(newArticle)
            .find(".boxs")
            .on("mouseover", function () {
                $(this).children(".popup_box").addClass("on");
            });
        $(newArticle)
            .find(".boxs")
            .on("mouseout", function () {
                $(this).children(".popup_box").removeClass("on");
            });
    };

    const getEle = async () => {
        //    console.log("getele 실행됨");
        //   console.log(window.scrollY + 1000 > document.querySelector(".images_items").offsetHeight);
        if (window.scrollY + 1000 > document.querySelector(".images_items").offsetHeight) {
            // console.log("스타트는 " + start);
            if (pending) {
                //  console.log("취소됨");
                return;
            }
            try {
                //   console.log("여기들어오나");
                pending = true;
                const response = await axios.post("./GetSearchServlet", "start=" + start + "&tag=" + getParam("tag"));

                const newthing = response.data;
                console.log(newthing.result);
                let strHtml = /*html*/ ``;

                for (let i = 0; i < newthing.result.length; i++) {
                    let one_article = newthing.result[i];
                    console.log("길이는 : " + newthing.result.length);
                    if (i % 3 == 0) {
                        strHtml += /*html*/ `<div class="items_box">`;
                    }
                    strHtml +=
                        /*html*/
                        ` <a href="./contentPage.jsp?b_idx=${one_article.idx}">
                        <div class="boxs">
                        <div class="popup_box">
                         <p>
                                <img src="./images/heart.png" alt="heart" />
                                ${one_article.like}
                                <img src="./images/commentForPopup.png" alt="comment" />
                                ${one_article.comment}
                            </p>
                           
                        </div>
                       <img src="${ ("uploads/"+one_article.img) ? ("uploads/"+one_article.img) : "https://www.publicdomainpictures.net/pictures/280000/velka/not-found-image-15383864787lu.jpg"}" alt="#" />
                        </div></a>
                        `;
                    if ((i + 1) % 3 == 0 || i + 1 == newthing.result.length) {
                        strHtml += /*html*/ `</div>`;
                    }
                }

                let doc = document.createElement("div");
                doc.innerHTML = strHtml;
                let newArticle = doc.childNodes;
                console.log(newArticle);
                setEvent(newArticle);
                $(".images_items").append(newArticle);

                start += 12;
            } catch (e) {
                console.log(e);
            } finally {
                pending = false;
            }
        }
    };

    // window.addEventListener("scroll", getEle, true);
    $(window).on("scroll", getEle);
    getEle();
});

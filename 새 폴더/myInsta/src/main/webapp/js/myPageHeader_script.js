$(function () {
    $(".p_lText").click(function () {
        $(".fp").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp").fadeOut();
    });
});

$(function () {
    $(".p_lText2").click(function () {
        $(".fp2").fadeIn();
    });
    $(".exit_btn").click(function () {
        $(".fp2").fadeOut();
    });
});

// 팔로우 버튼
$(function () {
    let xx = function () {
        const btnFollow = $(this);
        const clone = btnFollow.parent().parent().parent().clone();
        clone.find("input:button").val("팔로잉").on("click", xx).css({ background: "white", color: "black" });
        let followingid = $(this).next().val();
        console.log("팔로우아이디" + followingid);
        console.log(btnFollow.text());

        axios
            .post("./FollowServlet", "followingid=" + followingid)
            .then(function (response) {
                let cntfollow = Number($(".cntfollow").text());
                let fiuserid = btnFollow.parent().prev().find("p").text();
                let input = $(".body_ing.myFollow").find("input[value='" + fiuserid + "']");
                let fwerbtn = $(".body_ing.myFollower").find("input[value='" + fiuserid + "']");
                fwerbtn = fwerbtn.next().find(".fw_btn");

                if (btnFollow.val() == "팔로우") {
                    btnFollow.css("background-color", "#fff");
                    btnFollow.val("팔로잉").css("color", "#000").css("border", "1px solid #ccc");
                    $(".cntfollow").text(cntfollow + 1);
                    $(".body_ing.myFollow").append(clone);
                } else {
                    btnFollow.css("background-color", "#0095f6");
                    btnFollow.val("팔로우").css("color", "#fff");
                    $(".cntfollow").text(cntfollow - 1);
                    fwerbtn.val("팔로우").css({
                        background: "#0095f6",
                        color: "#fff",
                    });
                    input.parent().remove("li");
                    if ($("#p_myTN1").children("h2").text() == fiuserid) {
                        console.log("hdihisd");
                        fwerbtn.parent().parent().parent().remove("li");
                    }
                }
            })
            .catch(function (error) {
                console.log(error);
            });
    };
    $(".fw_btn").on("click", xx);
});

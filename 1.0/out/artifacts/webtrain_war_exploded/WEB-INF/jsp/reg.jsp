<%--
  Created by IntelliJ IDEA.
  User: YaTo
  Date: 2021/7/10
  Time: 20:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8" />
  <title></title>
  <style>
    html {
      background: #EBEBEB;
      height: 100%;
      font-size: 13px;
    }
    strong {
      color: #f00;
    }
    form,p{
      margin: 0;
    }
    body {
      position: relative;
      margin: 0;
      background: #008EAD;
      height: 60%;
    }

    body>header {
      padding-top: 100px;
    }

    body>section {
      position: absolute;
      top: 200px;
      left: 0;
      right: 0;
      box-sizing: border-box;
      width: 400px;
      margin-left: auto;
      margin-right: auto;
      z-index: 1;
    }

    body>footer {
      text-align: center;
      position: fixed;
      bottom: 10px;
      left: 0;
      right: 0;
      line-height: 30px;
    }

    body>header>h1 {
      margin: 0;
      color: #fff;
      font-size: 500%;
      text-align: center;
    }
    .message-box {
      line-height: 30px;
    }
    .form-box {
      background: white;
      text-align: center;
      border-radius: 2px;
    }

    input.icoTip {
      border: 1px solid #D3D3D3;
      border-radius: 5px;
      padding: 10px 0 10px 30px;
      background-repeat: no-repeat;
      width: 100%;
      box-sizing: border-box;
      background-position: 5px center;
    }

    input.icoTip:focus {
      border-color: #3333FF;
      outline: 0;
    }


    .ico-account {
      background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAMAAACXZR4WAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAIdQTFRF////pqaooqGip6ywsLGwuLe47+/v8+/xxsfJm6euxMTE9/f3xsvPsa+z19fbqrS65ufroZuY7efk8/Pzzs/R9/v34+PjzNTZ09PX//v/29vb+///7+vr8/P319vclZ2jzMfF5+fjy8fL+/v7+/f3s73G3NfV7+/qvcLA39/f5+fnsquo09PTXbQ8vQAAAJRJREFUeNpcjkcSwzAMA0HKVLOcuKX3Xv//vlDx5JLFDRyAAFBaa90gtwIwlUqKH/EEzJkNDxiuzkAnTMbQVzzSiHveiSnD1dYugH2yo4rHevZtXZRA2kndCgd6dz0FNTyxmblrWh8uGlMjaifL8pFe2mSyESh/0RKFNhrhwIZCE3RIYybArZfoxcd49F7yjj8+AgwA3xsGi1Yum4kAAAAASUVORK5CYII=);
    }

    .ico-password {
      background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAANCAMAAACXZR4WAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAGBQTFRF/////f///Pv7/v//oqOk/P//oaOm//39mpmc/v39nJubmZibo5+d/v7/nZ2gn6Km/vz7/v7+oqOl/vz8/Pz8/f39mZ2gmqGmlJWXlpeZmJ6k//79/Pz9lpSVn6Gj////TjWZsQAAACB0Uk5T/////////////////////////////////////////wBcXBvtAAAAbklEQVR42kyOUQ+DQAiDuZrVe9iMq5rL4rL//zMnHEb7QPJBKZiFVgDFboKo7SIU6KPDhM6kwCZ3oTempw7xV7OBQLlxyYxAEucFBVJCZjTGUqvdA59o8oI5M8z/mN/Yg4d0ve6v2xdjefjoL8AALC4FNEIwQfIAAAAASUVORK5CYII=);
    }

    .form-fields {
      padding-left:15px;
      padding-right:15px;
    }
    .form-action {
      border-top: 1px solid #E7E7E7;
      padding: 10px 15px;
      display: table;
      width: 100%;
      box-sizing: border-box;
      vertical-align: middle;
    }
    .form-fields>p {
      margin-top: 0;
      margin-bottom: 15px;
    }
    .form-action>:first-child {
      display: table-cell;
      text-align: left;
    }

    .form-action>:last-child {
      display: table-cell;
      text-align: right;
    }

    button[type=submit] {
      background: #008EAD;
      border: 1px solid #008EaF;
      color: #fff;
      border-radius: 5px;
      font-weight: bold;
      padding: 10px 15px;
      cursor: pointer;
    }
    button[type=submit]:hover{
      background: #694530;
    }

  </style>

  <style>
    .eagel-box {
      text-align: center;
      position: relative;
      bottom: -100px;
      z-index: -1;
    }
    .sprt-eagle {
      background-image: url(/webtrain/static/img/sprt_eagle.png);
      background-repeat: no-repeat;
      display: inline-block;
      vertical-align: bottom;
      position: relative;
    }

    .sprt-eagle.head {
      height: 91px;
      width: 97px;
      background-position: -30px 0;
      z-index: 100;
    }
    .sprt-eagle.hand-left {
      height: 20px;
      width: 30px;
      background-position: 0 -71px;
      left: -30px;
      z-index: 200;
    }
    .sprt-eagle.hand-left.hiding {
      height: 20px;
      background-position: 0 -37px;
    }
    .sprt-eagle.hand-left.hided {
      height: 37px;
      background-position: 0 0;
    }
    .sprt-eagle.hand-right {
      height: 20px;
      width: 30px;
      background-position: 0 -71px;
      left: 30px;
      z-index: 200;
    }
    .sprt-eagle.hand-right.hiding {
      height: 20px;
      background-position: -127px -37px;
    }
    .sprt-eagle.hand-right.hided {
      height: 37px;
      background-position: -127px 0;
    }
  </style>
</head>

<body>
<header>
  <h1>云平台系统</h1>
</header>
<section>
  <div class="eagel-box">
    <i class="sprt-eagle hand-left"></i>
    <i class="sprt-eagle head"></i>
    <i class="sprt-eagle hand-right"></i>
  </div>

  <div class="form-box">

    <p class="message-box">
      <strong>欢迎使用！</strong>
    </p>
    <form action="${pageContext.request.contextPath}/login/reg" method="post">
      <div class="form-fields">
        <p>
          <label>
            <input class="icoTip" type="text" name="account" placeholder="账号" required>
          </label>
        </p>
        <p>
          <label>
            <input class="icoTip" name="password" type="password" placeholder="密码" required>
          </label>
        </p>
        <p>
          <label>
            <input class="icoTip" name="username" type="text" placeholder="姓名" required>
          </label>
        </p>
        <p>
          <label>
            <input class="icoTip" name="mobile" type="text" placeholder="联系方式" required>
          </label>
        </p>

        <p>

          <label>
            云工厂管理员 <input class="" id="radio1" name="roleid" type="radio" value="2" onclick="radioClick1()">
            经销商 <input id="radio2" name="roleid" type="radio" value="3" onclick="radioClick2()" checked>
          </label>
        </p>

          <label>
            <input class="icoTip" id = "factoryname" name="factoryname" type="text" style="display: none" placeholder="工厂名称">
          </label>
        </p>
        <p>
          <label>
            <input class="icoTip" id = "introduction" name="introduction" type="text" style="display: none" placeholder="工厂介绍">
          </label>
        </p>

      </div>

      <div class="form-action">
        <span>
            <button type="submit">注册</button>
        </span>

      </div>
    </form>
  </div>
</section>

<footer>
  &copy;云平台系统 2021/07/14 All Rights Reservered.
</footer>
</body>
<script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-3.2.1.min.js"></script>

<script>

  var eagleLeftHandEL = $(".hand-left");
  var eagleRightHandEL = $(".hand-right");
  var eagleHandHidedStatus = [{ left: 45, bottom: 6 }, { left: -45, bottom: 6 }];
  $("input[type=password]").focus(function () {
    eagleLeftHandEL.animate(eagleHandHidedStatus[0], {
      step: hidingStep,
      duration: 500
    });
    eagleRightHandEL.animate(eagleHandHidedStatus[1], {
      step: hidingStep,
      duration: 500,
      complete: function () {
        setTimeout(eaglePeek, 1000);
      }
    });
  }).blur(function () {
    //立即结束动画
    eagleRightHandEL.stop(true, true);
    eagleLeftHandEL.stop(true, true);


    eagleLeftHandEL[0].hideStatus = 0;
    eagleLeftHandEL[0].className = "sprt-eagle hand-left";
    eagleLeftHandEL[0].style = "";

    eagleRightHandEL[0].hideStatus = 0;
    eagleRightHandEL[0].className = "sprt-eagle hand-right";
    eagleRightHandEL[0].style = "";

  });
  var eagleShow = function () {
    $(".eagel-box").animate({
      bottom: -6
    }, 1000, function () {
      this.style.zIndex = 100;
    });
  };
  /**
   * the hiding step control
   * @param {Object} now
   * @param {Object} fx
   */
  var hidingStep = function (now, fx) {
    if (fx.prop === "bottom") {
      now = Math.floor(now);
      if (now === 3 && this.hideStatus !== 1) {
        this.classList.add("hiding");
        this.hideStatus = 1;
      } else if (now === 5 && this.hideStatus !== 2) {
        this.classList.remove("hiding");
        this.classList.add("hided");
        this.hideStatus = 2;
      }
    }
  };
  /**
   * the eagel peak
   */
  var eaglePeek = function () {
    if (eagleRightHandEL[0].hideStatus === 2) {
      eagleRightHandEL.animate({
        bottom: 3,
        left: -25
      }, 300, function () {
        setTimeout(function () {
          if (eagleRightHandEL[0].hideStatus === 2) {
            eagleRightHandEL.animate(eagleHandHidedStatus[1], 200);
          }
        }, 500);
      });
    }
  };
  eagleShow();

  function radioClick1() {
    let factoryname = document.getElementById("factoryname");
    let introduction = document.getElementById("introduction");
    factoryname.style.display = 'inline';
    introduction.style.display = 'inline';
  }

  function radioClick2() {
    let factoryname = document.getElementById("factoryname");
    let introduction = document.getElementById("introduction");
    factoryname.style.display = 'none';
    introduction.style.display = 'none';
  }


</script>

</html>
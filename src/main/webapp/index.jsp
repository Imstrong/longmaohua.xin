<%--
  Created by IntelliJ IDEA.
  User: weipengming
  Date: 2017/12/18
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css" rel="stylesheet">
        html, body {
            margin: 0;
            padding: 0;
        }

        #wrap {
            width: 100%;
            overflow: hidden;
            background: #ccc;
        }

        #main {
            width: 100%;
            background: #ccc;
            position: relative;
        }

        .page {
            width: 100%;
            margin: 0;
        }

        #page1 {
            background: #E4E6CE;
        }

        #page2 {
            background: #6CE26C;
        }

        #page3 {
            background: #BF4938;
        }

        #page4 {
            background: #2932E1;
        }
    </style>
</head>
<body>
<div id="wrap">
    <div id="main">
        <div id="page1" class="page"></div>
        <div id="page2" class="page"></div>
        <div id="page3" class="page"></div>
        <div id="page4" class="page"></div>
    </div>
    <script>
        var pages = document.getElementsByClassName("page");
        var wrap = document.getElementById("wrap");
        var len = document.documentElement.clientHeight;
        var main = document.getElementById("main");
        wrap.style.height = len + "px";
        for (var i = 0; i < pages.length; i++) {
            pages[i].style.height = len + "px";
        }
        if (navigator.userAgent.toLowerCase().indexOf("firefox") != -1) {
            document.addEventListener("DOMMouseScroll", scrollFun);
        } else if (document.addEventListener) {
            document.addEventListener("mousewheel", scrollFun, false);
        } else if (document.attachEvent) {
            document.attachEvent("onmousewheel", scrollFun);
        } else {
            document.onmousewheel = scrollFun;
        }
        var startTime = 0;
        var endTime = 0;
        var now = 0;

        function scrollFun(e) {
            startTime = new Date().getTime();
            var event = e || window.event;
            var dir = event.detail || -event.wheelDelta;
            if (startTime - endTime > 1000) {
                if (dir > 0 && now > -3 * len) {
                    now -= len;
                    main.style.top = now + "px";
                    endTime = new Date().getTime();
                } else if (dir < 0 && now < 0) {
                    now += len;
                    main.style.top = now + "px";
                    endTime = new Date().getTime();
                }
            } else {
                event.preventDefault();
            }
        }
    </script>
</div>
</body>
</html>

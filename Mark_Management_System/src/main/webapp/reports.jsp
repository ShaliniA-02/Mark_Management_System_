<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Reports</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Arial,sans-serif;

    background:
    linear-gradient(135deg,#fff8f5,#ffece3);

    min-height:100vh;

    overflow-x:hidden;

    position:relative;
}

/* REMOVE LINK STYLE */

a{
    text-decoration:none;
}

/* BACKGROUND CIRCLES */

body::before{

    content:"";

    position:absolute;

    top:-180px;
    left:-120px;

    width:420px;
    height:420px;

    background:#f9d8c8;

    border-radius:50%;

    opacity:0.6;
}

body::after{

    content:"";

    position:absolute;

    bottom:-200px;
    right:-150px;

    width:450px;
    height:450px;

    background:#f9d8c8;

    border-radius:50%;

    opacity:0.4;
}

/* MAIN CONTAINER */

.container{

    width:90%;

    margin:auto;

    padding-top:70px;

    position:relative;

    z-index:2;
}

/* TITLE */

.title{

    font-size:80px;

    font-weight:bold;

    color:#16233f;

    text-align:center;
}

/* LINE */

.line{

    width:260px;

    height:4px;

    background:#f0a27d;

    margin:18px auto;

    border-radius:10px;

    position:relative;
}

.line::before{

    content:"";

    position:absolute;

    width:18px;
    height:18px;

    background:#f0a27d;

    border-radius:50%;

    left:50%;

    transform:translateX(-50%);

    top:-7px;
}

/* SUBTITLE */

.subtitle{

    text-align:center;

    font-size:26px;

    color:#5c6470;

    margin-bottom:70px;
}

/* CARD CONTAINER */

.card-container{

    display:flex;

    justify-content:center;

    gap:45px;

    flex-wrap:wrap;
}

/* CARDS */

.card{

    width:340px;

    height:390px;

    background:rgba(255,255,255,0.78);

    backdrop-filter:blur(10px);

    border-radius:30px;

    padding:40px 30px;

    text-align:center;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    transition:0.3s;

    display:flex;

    flex-direction:column;

    align-items:center;

    justify-content:flex-start;
}

.card:hover{

    transform:translateY(-8px);

    box-shadow:
    0 15px 35px rgba(0,0,0,0.12);
}

/* ICON BOX */

.icon-box{

    width:120px;
    height:120px;

    background:#fcebe3;

    border-radius:28px;

    margin-bottom:35px;

    position:relative;
}

/* CUSTOM ICONS */

.icon1::before{

    content:"+";

    position:absolute;

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    font-size:65px;

    color:#ec9d78;

    font-weight:bold;
}

.icon2::before{

    content:"=";

    position:absolute;

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    font-size:65px;

    color:#ec9d78;

    font-weight:bold;
}

.icon3::before{

    content:"{}";

    position:absolute;

    top:50%;
    left:50%;

    transform:translate(-50%,-50%);

    font-size:65px;

    color:#ec9d78;

    font-weight:bold;
}

/* CARD TITLE */

.card h2{

    font-size:28px;

    color:#16233f;

    margin-bottom:18px;

    min-height:70px;
}

/* CARD LINE */

.card-line{

    width:120px;

    height:4px;

    background:#f0a27d;

    border-radius:10px;

    margin-bottom:30px;
}

/* CARD TEXT */

.card p{

    color:#5f6672;

    font-size:18px;

    line-height:1.7;

    min-height:70px;
}

/* BACK BUTTON */

.back{

    display:inline-block;

    margin-top:70px;

    font-size:30px;

    color:#ec9d78;

    font-weight:bold;

    transition:0.3s;
}

.back:hover{

    transform:translateX(-5px);
}

</style>

</head>

<body>

<div class="container">

    <!-- TITLE -->

    <h1 class="title">
        Reports
    </h1>

    <div class="line"></div>

    <p class="subtitle">
        Generate various reports and performance insights
    </p>

    <!-- CARDS -->

    <div class="card-container">

        <!-- CARD 1 -->

 <a href="above.jsp">

    <div class="card">

        <div class="icon-box icon1"></div>

        <h2>Above Marks Report</h2>

        <div class="card-line"></div>

        <p>
            Students above entered marks
        </p>

    </div>

</a>

        <!-- CARD 2 -->

        <a href="subject.jsp">

        <div class="card">

            <div class="icon-box icon2"></div>

            <h2>Subject Wise Report</h2>

            <div class="card-line"></div>

            <p>
                Students based on selected subject
            </p>

        </div>

        </a>

        <!-- CARD 3 -->

        <a href="top.jsp">

        <div class="card">

            <div class="icon-box icon3"></div>

            <h2>Top Scorers Report</h2>

            <div class="card-line"></div>

            <p>
                Display highest scoring students
            </p>

        </div>

        </a>

    </div>

    <!-- BACK -->

    <a href="index.jsp" class="back">

        Back

    </a>

</div>

</body>

</html>
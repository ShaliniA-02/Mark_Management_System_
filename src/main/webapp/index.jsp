<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Student Mark Management System</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{

    font-family:Arial, sans-serif;

    min-height:100vh;

    display:flex;
    justify-content:center;
    align-items:center;

    background:
    linear-gradient(135deg,#fff7f2,#ffe8db);

    overflow:hidden;

    position:relative;
}

/* BACKGROUND SHAPES */

body::before{

    content:"";

    position:absolute;

    top:-150px;
    left:-120px;

    width:500px;
    height:500px;

    background:#ffd9c7;

    border-radius:50%;

    opacity:0.7;
}

body::after{

    content:"";

    position:absolute;

    bottom:-180px;
    right:-120px;

    width:500px;
    height:500px;

    background:#ffd9c7;

    border-radius:50%;

    opacity:0.6;
}

.container{

    width:90%;
    max-width:1200px;

    text-align:center;

    position:relative;
    z-index:2;
}

.container h1{

    font-size:60px;

    color:#172033;

    margin-bottom:15px;

    font-weight:bold;
}

.line{

    width:220px;
    height:3px;

    background:#f7b28d;

    margin:15px auto;

    position:relative;
}

.line::after{

    content:"";

    width:14px;
    height:14px;

    background:#f7b28d;

    border-radius:50%;

    position:absolute;

    top:-5px;
    left:50%;

    transform:translateX(-50%);
}

.subtitle{

    color:#666;

    font-size:30px;

    margin-bottom:60px;
}

.grid{

    display:flex;

    justify-content:center;

    gap:40px;

    flex-wrap:wrap;
}

.card{

    width:320px;

    background:white;

    padding:50px 30px;

    border-radius:20px;

    text-decoration:none;

    box-shadow:
    0 8px 25px rgba(0,0,0,0.08);

    transition:0.4s;
}

.card:hover{

    transform:translateY(-8px);

    box-shadow:
    0 12px 30px rgba(0,0,0,0.15);
}

.icon-box{

    width:110px;
    height:110px;

    margin:auto;

    border-radius:20px;

    background:#fff2eb;

    display:flex;
    justify-content:center;
    align-items:center;

    font-size:55px;

    color:#f4a27d;
}

.card h2{

    margin-top:30px;

    color:#172033;

    font-size:38px;
}

.small-line{

    width:120px;
    height:3px;

    background:#f7b28d;

    margin:20px auto;
}

.card p{

    color:#666;

    font-size:24px;

    line-height:1.6;
}

</style>

</head>

<body>

<div class="container">

    <h1>Student Mark Management System</h1>

    <div class="line"></div>

    <p class="subtitle">
        Manage student marks efficiently and effectively
    </p>

    <div class="grid">

        <!-- ADD MARKS -->
        <a href="markadd.jsp" class="card">

            <div class="icon-box">
                ⊕
            </div>

            <h2>Add Marks</h2>

            <div class="small-line"></div>

            <p>
                Add new student marks
                into the system
            </p>

        </a>

        <!-- VIEW RECORDS -->
        <a href="display" class="card">

            <div class="icon-box">
                ☰
            </div>

            <h2>View Records</h2>

            <div class="small-line"></div>

            <p>
                View all student marks
                and details
            </p>

        </a>

        <!-- REPORTS -->
        <a href="reports.jsp" class="card">

            <div class="icon-box">
                ▣
            </div>

            <h2>Reports</h2>

            <div class="small-line"></div>

            <p>
                Generate various reports
                and performance insights
            </p>

        </a>

    </div>

</div>

</body>

</html>
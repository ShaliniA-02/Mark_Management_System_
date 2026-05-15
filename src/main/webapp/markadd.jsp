<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.dao.MarkDAO" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Add Marks</title>

<style>

*{
    margin:0;
    padding:0;
    box-sizing:border-box;
}

body{
    font-family:Arial,sans-serif;
    min-height:100vh;

    background:
    linear-gradient(135deg,#fff8f5,#ffece3);

    position:relative;

    overflow-x:hidden;
}

/* BACKGROUND */

body::before{
    content:"";
    position:absolute;
    top:-120px;
    left:-120px;

    width:320px;
    height:320px;

    background:#ffd8c7;

    border-radius:50%;

    opacity:0.5;
}

body::after{
    content:"";
    position:absolute;
    bottom:-150px;
    right:-120px;

    width:320px;
    height:320px;

    background:#ffd8c7;

    border-radius:50%;

    opacity:0.4;
}

/* TOPBAR */

.topbar{

    width:100%;

    padding:18px 35px;

    background:rgba(255,255,255,0.7);

    backdrop-filter:blur(8px);

    display:flex;

    justify-content:space-between;

    align-items:center;

    box-shadow:
    0 2px 8px rgba(0,0,0,0.05);

    position:relative;

    z-index:5;
}

.topbar h2{

    color:#1d2740;

    font-size:30px;
}

.topbar a{

    text-decoration:none;

    color:#de7b59;

    border:2px solid #f4c3af;

    padding:8px 18px;

    border-radius:10px;

    font-size:18px;

    font-weight:bold;

    transition:0.3s;
}

.topbar a:hover{

    background:#ffe8de;
}

/* CARD */

.card{

    width:520px;

    margin:30px auto;

    background:rgba(255,255,255,0.82);

    backdrop-filter:blur(10px);

    padding:28px;

    border-radius:22px;

    box-shadow:
    0 6px 20px rgba(0,0,0,0.08);

    position:relative;

    z-index:2;
}

/* LABEL */

label{

    display:block;

    margin-top:16px;
    margin-bottom:8px;

    color:#1d2740;

    font-size:18px;

    font-weight:bold;
}

/* INPUT */

input,
select{

    width:100%;

    padding:12px;

    border:2px solid #f4ddd3;

    border-radius:12px;

    font-size:17px;

    outline:none;

    background:white;

    transition:0.3s;
}

input:focus,
select:focus{

    border-color:#f3a27f;

    box-shadow:
    0 0 6px rgba(243,162,127,0.25);
}

/* BUTTON */

button{

    width:100%;

    margin-top:24px;

    padding:13px;

    border:none;

    border-radius:12px;

    background:
    linear-gradient(to right,#ff9f80,#ff8b69);

    color:white;

    font-size:19px;

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;
}

button:hover{

    transform:translateY(-2px);

    box-shadow:
    0 6px 14px rgba(255,140,107,0.3);
}

/* SUCCESS */

.success-box{

    text-align:center;

    padding:30px 10px;
}

.success-box h3{

    color:#de7b59;

    font-size:28px;

    margin-bottom:25px;
}

.new-record-btn{

    display:inline-block;

    text-decoration:none;

    background:
    linear-gradient(to right,#ff9f80,#ff8b69);

    color:white;

    padding:14px 26px;

    border-radius:12px;

    font-size:18px;

    font-weight:bold;

    transition:0.3s;
}

.new-record-btn:hover{

    transform:translateY(-2px);

    box-shadow:
    0 6px 14px rgba(255,140,107,0.3);
}

</style>

</head>

<body>

<div class="topbar">

    <h2>Add Student Marks</h2>

    <a href="index.jsp">

        ← Back

    </a>

</div>

<div class="card">

<%

String msg = request.getParameter("msg");

if("success".equals(msg)){

%>

<div class="success-box">

    <h3>

        ✓ Record Added Successfully

    </h3>

    <a href="markadd.jsp"
       class="new-record-btn">

       + New Record

    </a>

</div>

<%

}else{

    int autoId = 101;

    try{

        MarkDAO dao = new MarkDAO();

        autoId = dao.getNextId();

    }catch(Exception e){

        out.println("Error : " + e);
    }

%>

<form action="add" method="post">

    <label>Student ID</label>

    <input type="text"
           name="id"
           value="<%= autoId %>"
           readonly>

    <label>Student Name</label>

    <input type="text"
           name="name"
           placeholder="Enter student name"
           required>

    <label>Subject</label>

    <select name="subject" required>

        <option value="">
            Select Subject
        </option>

        <option value="Java">Java</option>

        <option value="Physics">Physics</option>

        <option value="Chemistry">Chemistry</option>

        <option value="Maths">Maths</option>

        <option value="English">English</option>

    </select>

    <label>Marks</label>

    <input type="number"
           name="marks"
           placeholder="Enter marks"
           min="0"
           max="100"
           required>

    <label>Exam Date</label>

    <input type="date"
           name="date"
           required>

    <button type="submit">

        Add Record

    </button>

</form>

<%
}
%>

</div>

</body>

</html>
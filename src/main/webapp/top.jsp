<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Top Students Report</title>

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

    padding:40px;
}

/* BACKGROUND */

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

/* MAIN CARD */

.card{

    width:95%;

    margin:auto;

    background:rgba(255,255,255,0.82);

    backdrop-filter:blur(10px);

    border-radius:28px;

    padding:35px;

    box-shadow:
    0 10px 25px rgba(0,0,0,0.08);

    position:relative;

    z-index:2;
}

/* TITLE */

h2{

    text-align:center;

    font-size:42px;

    color:#16233f;

    margin-bottom:30px;
}

/* INPUT */

input{

    width:100%;

    padding:15px;

    border:none;

    border-radius:14px;

    background:#fff4ef;

    font-size:17px;

    outline:none;

    margin-top:10px;
}

/* BUTTON */

button{

    width:100%;

    padding:15px;

    margin-top:20px;

    border:none;

    border-radius:14px;

    background:
    linear-gradient(to right,#f0a27d,#ec8f68);

    color:white;

    font-size:18px;

    font-weight:bold;

    cursor:pointer;

    transition:0.3s;
}

button:hover{

    transform:translateY(-3px);

    box-shadow:
    0 8px 18px rgba(236,143,104,0.3);
}

/* TABLE */

table{

    width:100%;

    border-collapse:collapse;

    margin-top:30px;

    overflow:hidden;

    border-radius:18px;
}

/* HEADER */

th{

    background:
    linear-gradient(to right,#ff9f80,#ff8b69);

    color:white;

    padding:16px;

    font-size:18px;
}

/* ROWS */

td{

    padding:15px;

    text-align:center;

    border-bottom:1px solid #f3d8cd;

    background:rgba(255,255,255,0.75);

    color:#1d2740;
}

tr:hover td{

    background:#fff3ee;
}

/* BACK BUTTON */

.back{

    display:inline-block;

    margin-top:25px;

    padding:12px 20px;

    border-radius:14px;

    background:#f0a27d;

    color:white;

    text-decoration:none;

    font-size:17px;

    font-weight:bold;

    transition:0.3s;
}

.back:hover{

    transform:translateX(-5px);

    box-shadow:
    0 8px 18px rgba(236,143,104,0.3);
}

</style>

</head>

<body>

<div class="card">

<%

List<StudentMark> list =
(List<StudentMark>) request.getAttribute("list");

/* SHOW FORM FIRST */

if(list == null){

%>

<h2>

Top Scorers Report

</h2>

<form action="topStudents" method="post">

<input type="number"
       name="n"
       placeholder="Enter Top N Value"
       required>

<button type="submit">

Generate Report

</button>

</form>

<%

}

/* SHOW REPORT AFTER SUBMIT */

else{

%>

<h2>

Top Students Result

</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th>

</tr>

<%

for(StudentMark s : list){

%>

<tr>

<td><%= s.getStudentID() %></td>

<td><%= s.getStudentName() %></td>

<td><%= s.getSubject() %></td>

<td><%= s.getMarks() %></td>

<td><%= s.getExamDate() %></td>

</tr>

<%
}
%>

</table>

<%
}
%>

<a href="reports.jsp" class="back">

Back to Reports

</a>

</div>

</body>

</html>
<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Above Marks Report</title>

<style>

body{
    font-family:Arial;
    padding:40px;
    background:#fff5ef;
}

.container{
    width:90%;
    margin:auto;
    background:white;
    padding:30px;
    border-radius:15px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

input{
    width:100%;
    padding:12px;
    margin-top:15px;
    border-radius:10px;
    border:1px solid #ccc;
}

button{
    width:100%;
    padding:12px;
    margin-top:15px;
    background:#f0a27d;
    color:white;
    border:none;
    border-radius:10px;
    font-size:17px;
    cursor:pointer;
}

table{
    width:100%;
    border-collapse:collapse;
    margin-top:30px;
}

th{
    background:#f0a27d;
    color:white;
    padding:12px;
}

td{
    border:1px solid #ddd;
    padding:12px;
    text-align:center;
}

.back{
    display:inline-block;
    margin-top:20px;
    text-decoration:none;
    background:#222;
    color:white;
    padding:10px 15px;
    border-radius:10px;
}

</style>

</head>

<body>

<div class="container">

<%

List<StudentMark> list =
(List<StudentMark>) request.getAttribute("list");

/* SHOW FORM ONLY FIRST TIME */

if(list == null){

%>

<h2>Above Marks Report</h2>

<form action="aboveMarks" method="post">

<input type="text"
       name="condition"
       placeholder="Example: >85 or <60 or >=70"
       required>

<button type="submit">

Generate Report

</button>

</form>

<%

}

/* AFTER REPORT GENERATED */

else{

%>

<h2>Students Report</h2>

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

Back

</a>

</div>

</body>

</html>
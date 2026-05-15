<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>Subject Wise Report</title>

<style>

body{
    margin:0;
    padding:30px;
    font-family:Arial;
    background:#fff5ef;
}

.card{
    width:90%;
    margin:auto;
    background:white;
    padding:25px;
    border-radius:15px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

select, button{
    width:100%;
    padding:12px;
    margin-top:10px;
    border-radius:10px;
    border:1px solid #ccc;
}

button{
    background:#f0a27d;
    color:white;
    border:none;
    cursor:pointer;
    font-size:16px;
}

button:hover{
    opacity:0.85;
}

table{
    width:100%;
    margin-top:20px;
    border-collapse:collapse;
}

th{
    background:#f0a27d;
    color:white;
    padding:12px;
}

td{
    border:1px solid #ccc;
    padding:12px;
    text-align:center;
}

.back{
    display:inline-block;
    margin-top:15px;
    padding:10px 15px;
    background:#222;
    color:#fff;
    text-decoration:none;
    border-radius:10px;
}

h2{
    margin-bottom:15px;
}

</style>

</head>

<body>

<div class="card">

<%

List<StudentMark> list =
(List<StudentMark>) request.getAttribute("list");

String subject =
(String) request.getAttribute("subject");

if(list == null){

%>

<h2>Subject Wise Report</h2>

<form action="subjectReport" method="post">

<select name="subject" required>

<option value="">Select Subject</option>

<option value="Java">Java</option>

<option value="Maths">Maths</option>

<option value="Physics">Physics</option>

<option value="Chemistry">Chemistry</option>

<option value="English">English</option>

<option value="History">History</option>

</select>

<button type="submit">

Generate Report

</button>

</form>

<%

} else {

%>

<h2>

Students Who Took <%= subject %>

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

Back

</a>

</div>

</body>

</html>
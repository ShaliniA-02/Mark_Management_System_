<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Update Marks</title>

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

    display:flex;

    justify-content:center;

    align-items:center;
}

.card{

    width:500px;

    background:white;

    padding:35px;

    border-radius:20px;

    box-shadow:
    0 5px 20px rgba(0,0,0,0.1);
}

h2{

    text-align:center;

    margin-bottom:25px;

    color:#1d2740;
}

label{

    display:block;

    margin-top:15px;

    margin-bottom:8px;

    font-weight:bold;

    color:#1d2740;
}

input{

    width:100%;

    padding:12px;

    border:1px solid #f1c7b5;

    border-radius:10px;

    font-size:16px;
}

button{

    width:100%;

    margin-top:25px;

    padding:14px;

    border:none;

    border-radius:12px;

    background:
    linear-gradient(to right,#ff9f80,#ff8b69);

    color:white;

    font-size:18px;

    font-weight:bold;

    cursor:pointer;
}

</style>

</head>

<body>

<div class="card">

<%

StudentMark s =
(StudentMark)request.getAttribute("student");

%>

<h2>Update Student Marks</h2>

<form action="update" method="post">

    <label>Student ID</label>

    <input type="text"
           name="id"
           value="<%= s.getStudentID() %>"
           readonly>

    <label>Student Name</label>

    <input type="text"
           value="<%= s.getStudentName() %>"
           readonly>

    <label>Subject</label>

    <input type="text"
           value="<%= s.getSubject() %>"
           readonly>

    <label>Marks</label>

    <input type="number"
           name="marks"
           value="<%= s.getMarks() %>"
           required>

    <button type="submit">

        Update Marks

    </button>

</form>

</div>

</body>
</html>
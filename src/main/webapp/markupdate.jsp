<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Marks</title>

<style>
body{
    font-family:Arial;
    background:linear-gradient(135deg,#fff8f5,#ffece3);
}

.card{
    width:420px;
    margin:60px auto;
    background:white;
    padding:25px;
    border-radius:12px;
    box-shadow:0 0 10px rgba(0,0,0,0.1);
}

label{
    display:block;
    margin-top:10px;
    font-weight:bold;
}

input{
    width:100%;
    padding:10px;
    margin-top:5px;
    border:1px solid #ccc;
    border-radius:8px;
}

button{
    width:100%;
    margin-top:20px;
    padding:10px;
    background:#ff8b69;
    border:none;
    color:white;
    border-radius:8px;
    font-size:16px;
}
</style>
</head>

<body>

<div class="card">

<%
StudentMark s = (StudentMark) request.getAttribute("student");

if (s != null) {
%>

<form action="update" method="post">

    <label>ID</label>
    <input type="number" name="id"
           value="<%= s.getStudentID() %>" readonly>

    <label>Name</label>
    <input type="text"
           value="<%= s.getStudentName() %>" readonly>

    <label>Subject</label>
    <input type="text"
           value="<%= s.getSubject() %>" readonly>

    <label>Marks</label>
    <input type="number" name="marks"
           value="<%= s.getMarks() %>" required>

    <button type="submit">Update Marks</button>

</form>

<%
} else {
%>

<h3 style="color:red;text-align:center;">
    Student Record Not Found
</h3>

<%
}
%>

</div>

</body>
</html>
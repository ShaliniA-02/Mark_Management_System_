<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Student</title>

<style>

body{
    font-family:Arial;
    background:#fff8f5;
}

.card{
    width:450px;
    margin:60px auto;
    background:white;
    padding:25px;
    border-radius:15px;
}

label{
    font-weight:bold;
    display:block;
    margin-top:10px;
}

input{
    width:100%;
    padding:10px;
    margin-top:5px;
    border-radius:8px;
    border:1px solid #ccc;
    background:#f5f5f5;
}

.btns{
    display:flex;
    gap:10px;
    margin-top:20px;
}

.delete-btn{
    flex:1;
    padding:10px;
    background:#ff5c5c;
    color:white;
    border:none;
    border-radius:8px;
    cursor:pointer;
}

.cancel-btn{
    flex:1;
    padding:10px;
    text-align:center;
    background:#ddd;
    border-radius:8px;
    text-decoration:none;
    color:black;
}
</style>
</head>

<body>

<div class="card">

<%
StudentMark s =
(StudentMark)request.getAttribute("student");

if(s != null){
%>

<h2 style="color:red;text-align:center;">Delete Record</h2>

<form action="finaldelete" method="post">

    <label>ID</label>
    <input type="text" value="<%= s.getStudentID() %>" readonly>

    <label>Name</label>
    <input type="text" value="<%= s.getStudentName() %>" readonly>

    <label>Subject</label>
    <input type="text" value="<%= s.getSubject() %>" readonly>

    <label>Marks</label>
    <input type="text" value="<%= s.getMarks() %>" readonly>

    <label>Date</label>
    <input type="text" value="<%= s.getExamDate() %>" readonly>

    <input type="hidden" name="id" value="<%= s.getStudentID() %>">

    <div class="btns">

        <a href="display" class="cancel-btn">Cancel</a>

        <button type="submit" class="delete-btn">
            Delete
        </button>

    </div>

</form>

<%
}else{
%>

<h3 style="text-align:center;color:red;">Record Not Found</h3>

<%
}
%>

</div>

</body>
</html>
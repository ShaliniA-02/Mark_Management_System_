<%@ page language="java"
contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ page import="java.util.List" %>
<%@ page import="com.model.StudentMark" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Marks</title>

<style>
body{
    font-family:Arial;
    background:linear-gradient(135deg,#fff8f5,#ffece3);
}

.topbar{
    padding:15px;
    background:white;
    display:flex;
    justify-content:space-between;
}

.container{
    width:90%;
    margin:20px auto;
    background:white;
    padding:20px;
    border-radius:15px;
}

table{
    width:100%;
    border-collapse:collapse;
}

th{
    background:#ff8b69;
    color:white;
    padding:12px;
}

td{
    text-align:center;
    padding:10px;
    border-bottom:1px solid #eee;
}

.update-btn{
    background:#ffb08d;
    color:white;
    padding:6px 12px;
    border-radius:8px;
    text-decoration:none;
}

.delete-btn{
    background:#ff5c5c;
    color:white;
    padding:6px 12px;
    border:none;
    border-radius:8px;
    cursor:pointer;
}
</style>
</head>

<body>

<div class="topbar">

    <h2>Student Marks Report</h2>

    <a href="index.jsp" class="back-btn">
        Back
    </a>

</div>
<table>

<tr>
    <th>ID</th>
    <th>Name</th>
    <th>Subject</th>
    <th>Marks</th>
    <th>Date</th>
    <th>Update</th>
    <th>Delete</th>
</tr>

<%
List<StudentMark> list =
(List<StudentMark>)request.getAttribute("list");

if(list != null){
    for(StudentMark s : list){
%>

<tr>

    <td><%= s.getStudentID() %></td>
    <td><%= s.getStudentName() %></td>
    <td><%= s.getSubject() %></td>
    <td><%= s.getMarks() %></td>
    <td><%= s.getExamDate() %></td>

    <td>
   <a href="update?id=<%= s.getStudentID() %>">
    Update
</a>
    </td>

    <td>
        <button class="delete-btn"
            onclick="confirmDelete(<%= s.getStudentID() %>)">
            Delete
        </button>
    </td>

</tr>

<%
    }
}
%>

</table>

</div>

<script>
function confirmDelete(id){

    let check = confirm("Are you sure you want to delete this record?");

    if(check){
        window.location.href = "delete?id=" + id;
    }
}
</script>
</body>
</html>
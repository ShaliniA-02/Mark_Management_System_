<%@ page import="java.util.*,com.model.StudentMark" %>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Report Result</title>

<link rel="stylesheet" href="style.css">

</head>

<body>


<div class="main">

<h2>

<%= request.getAttribute("reportTitle") %>

</h2>

<table border="1" cellpadding="10">

<tr>

<th>ID</th>
<th>Name</th>
<th>Subject</th>
<th>Marks</th>
<th>Date</th>

</tr>

<%

List<StudentMark> list =
(List<StudentMark>)request.getAttribute("data");

if(list != null){

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
}
%>

</table>

</div>

</body>

</html>
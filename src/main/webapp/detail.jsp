<%@ page import="classes.Tasks" %><%--
  Created by IntelliJ IDEA.
  User: omyrz
  Date: 30.03.2023
  Time: 21:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detail</title>
  <%@include file="head.jsp"%>
  <link rel="stylesheet" href="style/detail.css">
</head>
<body>
<%@include file="header.jsp"%>

<%
  Tasks task = (Tasks) request.getAttribute("task");
  if(task != null){
%>
<form action="/UpdateServlet" method="post">
  <div class="detail">
    <label>Task Name:</label>
    <input type="text" name="nameTask" value="<%=task.getName()%>">
    <label>ToDo:</label>
      <input type="text" name="description" value="<%=task.getDescription()%>">
    <label>Dead Line:</label>
    <input type="date" name="deadline">
    <input type="hidden" name = "id" value="<%=task.getId()%>">
    <button type="submit" id="save">Save</button>
  </div>
</form>
<form action="/DeleteServlet" method="post" id="delete">
  <input type="hidden" name="idDel" value="<%=task.getId()%>">
  <button type="submit" id="del">Delete</button>
</form>
<%
  }
%>
</body>
</html>

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
    <select class="form-select" name="description">
      <option <%=(task.getDescription().equals("Yes")?"selected":"")%>>Yes</option>
      <option <%=(task.getDescription().equals("No")?"selected":"")%>>No</option>
    </select>
    <label>Dead Line:</label>
    <input type="date" name="deadline" value="<%=task.getDeadlineDate()%>">
    <input type="hidden" name = "id" value="<%=task.getId()%>">
    <div class="items">
      <button type="submit" id="save">Save</button>
      <button type="button" data-bs-toggle="modal" data-bs-target="#modalka" style="background-color: red; margin-left: 5%">
        Delete
      </button>
    </div>

  </div>
</form>

<!-- Модальное окно -->
<div class="modal fade" id="modalka" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="exampleModalLabel">Agree</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
      </div>
      <div class="modal-body">
        Are you delete this task?
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
        <form action="/DeleteServlet" method="post">
          <input type="hidden" name="idDel" value="<%=task.getId()%>">
          <button type="submit" class="btn btn-danger">Delete</button>
        </form>

    </div>
    </div>
  </div>

</div>
<%
  }
%>
</body>
</html>

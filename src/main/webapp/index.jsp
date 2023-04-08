<%@ page import="java.util.ArrayList" %>
<%@ page import="classes.Tasks" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>To Do List</title>
    <%@include file="head.jsp"%>
    <link rel="stylesheet" href="style/main.css">
</head>
<body>
<%@include file="header.jsp"%>

<button type="button" class="btn btn-primary" id="one" data-bs-toggle="modal" data-bs-target="#exampleModal" >
    Добавить задание
</button>

<table class="table">
    <thead>
    <tr>
        <th scope="col">id</th>
        <th scope="col">Найменование</th>
        <th scope="col">Выполнено</th>
        <th scope="col">Крайний срок</th>
    </tr>
    </thead>
    <%
        ArrayList<Tasks> tasks = (ArrayList<Tasks>) request.getAttribute("tasks");
        if(tasks!=null){
            for(Tasks ts : tasks){
    %>
    <tbody>
    <tr>
        <th scope="row"><%=ts.getId()%></th>
        <td><%=ts.getName()%></td>
        <td><%=ts.getDescription()%></td>
        <td><%=ts.getDeadlineDate()%></td>
        <td><a href="/details?id=<%=ts.getId()%>" class="btn btn-primary">Details</a></td>
    </tr>
    </tbody>
    <%
            }
        }
    %>
</table>
<!-- Модальное окно -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <form action="/add" method="post">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h1 class="modal-title fs-5" id="exampleModalLabel">Заголовок модального окна</h1>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Закрыть"></button>
            </div>
            <div class="modal-body">
                <div class="mb-3">
                    <label class="form-label">Найменование:</label>
                    <input type="text" class="form-control" name="nameTask" placeholder="Найменование...">
                </div>
                <div class="mb-3">
                    <label  class="form-label">Выполнение</label>
                    <select name="description" class="form-select">
                        <option>Yes</option>
                        <option>No</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label  class="form-label">Dead Line</label>
                    <input type="date" class="form-control" name="deadLine" rows="3">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                <button type="submit" class="btn btn-primary">Добавить задание</button>
            </div>
        </div>
    </div>
    </form>
</div>
<footer>
    <div class="foot">

    </div>
</footer>
</body>
</html>
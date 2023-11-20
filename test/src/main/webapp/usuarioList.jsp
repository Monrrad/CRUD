<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aplicacion Gestion De Usuarios</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	
</head>
<body>
<header>
	<nav class = "navbar navbar-expand-md navbar-dark">
		<div>
			<a href="#" class="navbar-brand"> Gestion De Usuarios </a>
		</div>
	
	<ul class="navbar-nav">
		<li> <a href="<%=request.getContextPath()%>/list" class = "nav-link">Usuarios</a> </li> 
	</ul>
	
	</nav>

</header>
<br/>

<div class="row">
		<div class="container">
			<h3 class="text-center">Listado de Usuarios</h3>
			<hr>
			<div class="container text-left">
				<a href="<%=request.getContextPath()%>/new" class="btn btn-success">Agregar nuevo usuario</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Nombre</th>
						<th>Email</th>
						<th>Pais</th>
						<th>Acciones</th>
					</tr>
				</thead>
<tbody>
					<!--  for (Todo todo: todos){ -->
					<c:forEach var="usuario" items="${listUsuarios}">
						<tr>
							<td>
								<c:out value="${usuario.id}"/>
							</td>
							<td>
								<c:out value="${usuario.nombre}"/>
							</td>
							<td>
								<c:out value="${usuario.email}"/>
							</td>
							<td>
								<c:out value="${usuario.pais}"/>
							</td>
							<td><a href="edit?id=<c:out value='${usuario.id}'/>">Editar</a>&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="delete?id=<c:out value='${usuario.id}'/>">Eliminar</a>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<a href="email?id=<c:out value='${usuario.id}'/>" class="btn btn-success">Correo</a>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
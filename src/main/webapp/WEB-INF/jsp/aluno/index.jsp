<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><fmt:message key="aluno.page.title" /></title>
	</head>

	<body>
	
		<div class="navbar col-sm-12 ">
			<ul class="nav navbar-nav">
				<li class="active">
					<h4>
						<fmt:message key="aluno.page.title" />
					</h4>
				</li>
			</ul>

			<ul class="nav pull-right">
				<li>
					<a class="btn btn-primary" href="${linkTo[AlunoController].form}">
						<fmt:message key="aluno.page.adicionar" />
					</a>
				</li>
			</ul>
			<hr />
		</div>

		<table  class="table">
			<thead class="thead-inverse">
				<tr>
					<th><fmt:message key="aluno.table.title.nome" /></th>
					<th><fmt:message key="aluno.table.title.matricula" /></th> 
					<th><fmt:message key="aluno.table.title.dataNascimento" /></th>
					<th><fmt:message key="aluno.table.title.acoes" /></th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="aluno" items="${alunos}">
					<tr>
						<td>${aluno.nome}</td>
						<td>${aluno.matricula}</td> 
						<td>
							<fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.dataNascimento}" />
						</td>
						<td>
							<a class="editar btn btn-default btn-xs" title="<fmt:message key="aluno.table.label.editar" />" href="${linkTo[AlunoController].form()}${aluno.id}">
								<span class="glyphicon glyphicon-pencil"></span>
							</a>
							<a class="editar btn btn-default btn-xs" title="<fmt:message key="aluno.table.label.excluir" />" href="${linkTo[AlunoController].remover()}${aluno.id}">
								<span class="glyphicon glyphicon-remove"></span>
							</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</body>
</html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title><fmt:message key="aluno.page.title" /></title>
	</head>

	<body>
		<c:choose>
			<c:when test="${empty aluno.id}">
				<c:set var="actionForm" value="${linkTo[AlunoController].adicionar()}"></c:set>
			</c:when>
			<c:otherwise>
				<c:set var="actionForm" value="${linkTo[AlunoController].atualizar()}"></c:set>
			</c:otherwise>
		</c:choose>

		<form id="form-aluno" method="post" action="${actionForm}" class="form-horizontal">
			<fieldset>
				<legend>Dados do aluno</legend>

				<input type="hidden" name="aluno.id" value="${aluno.id}" />

				<div class="form-group">
					<label for="nome" class="col-sm-4 control-label">
						<fmt:message key="aluno.form.label.nome" />:
					</label>
					<div class="col-sm-4">
						<input id="nome" name="aluno.nome" type="text" class="form-control uppercase" 
						value="${aluno.nome}" placeholder="<fmt:message key="aluno.form.placeholder.nome" />" 
						required maxlength="100">
					</div>
				</div>

				<div class="form-group">
					<label for="matricula" class="col-sm-4 control-label">
						<fmt:message key="aluno.form.label.matricula" />:
					</label>
					<div class="col-sm-4">
						<input id="matricula" name="aluno.matricula" type="text" class="form-control uppercase" 
						value="${aluno.matricula}" placeholder="<fmt:message key="aluno.form.placeholder.matricula" />" 
						required maxlength="10">
					</div>
				</div>

				<div class="form-group">
					<label class="col-sm-4 control-label" >
						<fmt:message key="aluno.form.label.dataNascimento" />:
					</label>

					<div class="col-sm-4 data">
						<div id="datetimepicker" class="input-group input-append data">

							<input type="text" class="form-control" id="dataNascimento" 
								value="<fmt:formatDate pattern="dd/MM/yyyy" value="${aluno.dataNascimento}" />" name="aluno.dataNascimento" required readonly />

							<span class="input-group-addon"> 
								<span class="glyphicon glyphicon-calendar"></span>
							</span>
						</div>
					</div>
				</div>

				<div class="text-center">
					<button type="submit" class="btn btn-primary">
						<c:choose>
							<c:when test="${empty aluno.id}">
								<fmt:message key="aluno.form.label.salvar" />
							</c:when>
							<c:otherwise>
								<fmt:message key="aluno.form.label.editar" />
							</c:otherwise>
						</c:choose>
					</button>
					<a href="${linkTo[AlunoController].index()}" class="btn btn-danger">
						<fmt:message key="aluno.form.label.cancelar" />
					</a>
				</div>
			</fieldset>
		</form>

		<content tag="local-script">
			<script type="text/javascript">

				$('#matricula').mask('0000000000');

				$('#datetimepicker').datetimepicker({
					defaultDate: new Date(moment().format('YYYY-MM-DDT00:00')),
					locale : 'pt-br',
					format : 'DD/MM/YYYY',
					ignoreReadonly : true
				});

				$('#form-aluno').formValidation({
					framework: 'bootstrap',
					excluded: ':disabled',
					locale : 'pt_BR',
			        icon: {
			            valid: 'glyphicon glyphicon-ok',
			            invalid: 'glyphicon glyphicon-remove',
			            validating: 'glyphicon glyphicon-refresh'
			        }, fields: {
			        	'aluno.nome': {
			        		validators: {
			                	stringLength: {
			                        min: 6,
			                        max: 100
			                    }
			                }
			            }, 'aluno.matricula': {
			                validators: {
			                	stringLength: {
			                        min: 1,
			                        max: 10
			                    }
			                }
			    		}, 'aluno.dataNascimento': {
			    			row: '.col-sm-4',
							validators: {
								date: {
									format: 'DD/MM/YYYY'
								},
								notEmpty: {
								}
							}
			    		}
			        }
				});

				$('#datetimepicker').on('dp.change', function(e){
					$('#form-aluno').formValidation('revalidateField', 'aluno.dataNascimento');
				});
			</script>	
		</content>
	</body>
</html>
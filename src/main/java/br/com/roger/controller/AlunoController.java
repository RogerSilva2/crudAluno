package br.com.roger.controller;

import java.util.List;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Get;
import br.com.caelum.vraptor.Post;
import br.com.caelum.vraptor.Result;
import br.com.roger.model.Aluno;
import br.com.roger.service.AlunoService;

@Controller
public class AlunoController {

	@Inject
	private Result result;

	@Inject
	private AlunoService alunoService;


	@Get
	public void index() {

		List<Aluno> alunos = alunoService.buscarAlunos();

		result.include("alunos", alunos);
	}


	@Get({"aluno/form/", "aluno/form/{id}"})
	public void form(Integer id) {
		if (id != null && id != 0) {

			Aluno aluno = alunoService.buscarAlunoPorId(id);

			result.include("aluno", aluno);
		}
	}


	@Post
	public void adicionar(Aluno aluno) {

		alunoService.adicionar(aluno);

		result.redirectTo(AlunoController.class).index();
	}


	@Post
	public void atualizar(Aluno aluno) {
		alunoService.atualizar(aluno);

		result.redirectTo(AlunoController.class).index();
	}


	@Get("aluno/remover/{id}")
	public void remover(Integer id) {

		alunoService.remover(id);

		result.redirectTo(AlunoController.class).index();
	}
}
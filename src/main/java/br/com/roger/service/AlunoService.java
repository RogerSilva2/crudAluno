package br.com.roger.service;

import java.util.List;

import javax.inject.Inject;

import br.com.roger.dao.AlunoDAO;
import br.com.roger.model.Aluno;

public class AlunoService {

	@Inject
	private AlunoDAO alunoDAO;

	public List<Aluno> buscarAlunos() {
		return alunoDAO.findAllAlunosOrderByNome();
	}

	public void remover(Integer id) {
		if (id != null) {
			alunoDAO.remove(id);
		}
	}


	public void adicionar(Aluno aluno) {
		if (aluno != null && aluno.getId() == null) {
			alunoDAO.insert(aluno);
		}
	}


	public void atualizar(Aluno aluno) {
		if (aluno != null && aluno.getId() != null) {
			Aluno alunoBd = alunoDAO.findAlunoById(aluno.getId());

			alunoBd.setNome(aluno.getNome());
			alunoBd.setMatricula(aluno.getMatricula());
			alunoBd.setDataNascimento(aluno.getDataNascimento());

			alunoDAO.update(aluno);
		}
	}


	public Aluno buscarAlunoPorId(Integer id) {
		if (id != null) {
			return alunoDAO.findAlunoById(id);
		}
		return null;
	}
}
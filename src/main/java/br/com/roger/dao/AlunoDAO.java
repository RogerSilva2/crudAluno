package br.com.roger.dao;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import br.com.roger.model.Aluno;

public class AlunoDAO {

	@Inject
	private EntityManager entityManager;


	public List<Aluno> findAllAlunosOrderByNome() {
		TypedQuery<Aluno> query = entityManager.createNamedQuery("findAllAlunosOrderByNome", Aluno.class);
		return query.getResultList();
	}


	public void remove(Integer id) {
		Aluno aluno = findAlunoById(id);
		entityManager.remove(aluno);
	}


	public Aluno findAlunoById(Integer id) {
		return entityManager.getReference(Aluno.class, id);
	}

	
	public void insert(Aluno aluno) {
		entityManager.persist(aluno);
	}


	public void update(Aluno aluno) {
		entityManager.merge(aluno);
		entityManager.flush();
	}
}
package br.com.roger.model;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SequenceGenerator;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@NamedQueries({
	@NamedQuery(name="findAllAlunosOrderByNome", query="SELECT a FROM Aluno a ORDER BY a.nome")
})

@Entity
public class Aluno implements Serializable {

	private static final long serialVersionUID = 6270170870320722554L;

	@Id
	@SequenceGenerator(name="aluno_id_gen", sequenceName="aluno_id_seq", allocationSize=1)
	@GeneratedValue(strategy = GenerationType.IDENTITY, generator="aluno_id_gen")
	private Integer id;

	@Column(nullable=false)
	private String nome;

	@Column(nullable=false)
	private Integer matricula;

	@Column(nullable=false)
	@Temporal(TemporalType.DATE)
	private Date dataNascimento;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public Integer getMatricula() {
		return matricula;
	}

	public void setMatricula(Integer matricula) {
		this.matricula = matricula;
	}

	public Date getDataNascimento() {
		return dataNascimento;
	}

	public void setDataNascimento(Date dataNascimento) {
		this.dataNascimento = dataNascimento;
	}
}
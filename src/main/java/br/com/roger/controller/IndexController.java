package br.com.roger.controller;

import javax.inject.Inject;

import br.com.caelum.vraptor.Controller;
import br.com.caelum.vraptor.Path;
import br.com.caelum.vraptor.Result;

@Controller
public class IndexController {

	@Inject
	private Result result;

	@Path("/")
	public void index() {
		result.redirectTo(AlunoController.class).index();
	}
}
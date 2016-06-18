package br.com.roger.specializes;

import java.util.Date;
import java.util.Locale;

import javax.enterprise.inject.Specializes;
import javax.inject.Inject;

import org.joda.time.format.DateTimeFormat;
import org.joda.time.format.DateTimeFormatter;
import org.joda.time.format.DateTimeFormatterBuilder;
import org.joda.time.format.DateTimeParser;

import br.com.caelum.vraptor.Convert;
import br.com.caelum.vraptor.converter.Converter;
import br.com.caelum.vraptor.converter.DateConverter;

@Specializes
@Convert(Date.class)
public class CustomDateConverter extends DateConverter implements Converter<Date> {

	private final DateTimeParser[] dateTimeParsers;

	protected CustomDateConverter() {
		super(null);
		this.dateTimeParsers = getDateTimeParsers();
	}

	@Inject
	public CustomDateConverter(Locale locale) {
		super(locale);
		this.dateTimeParsers = getDateTimeParsers();
	}


	/**
	 * Retorna um array com todos os formatos de datas suportados pelo converter do projeto
	 *
	 * Obs.: Se necessário adicionar um novo formato, só adicionar ao array abaixo
	 *
	 * @author Jackson Castro
	 * @since 2015-11-12
	 *
	 * @version 1.0.0
	 */
	private DateTimeParser[] getDateTimeParsers() {
		return new DateTimeParser[] { 
			DateTimeFormat.forPattern("yyyy-MM-dd").getParser(),
			DateTimeFormat.forPattern("yyyy-MM-dd HH:mm").getParser(),
			DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss").getParser(),
	        DateTimeFormat.forPattern("yyyy-MM-dd HH:mm:ss:SSS").getParser(),
	        DateTimeFormat.forPattern("dd/MM/yyyy").getParser(),
	        DateTimeFormat.forPattern("dd/MM/yyyy HH:mm").getParser(),
	        DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss").getParser(),
	        DateTimeFormat.forPattern("dd/MM/yyyy HH:mm:ss:SSS").getParser()
		};
	}


	@Override
	public Date convert(String value, Class<? extends Date> type) {
		DateTimeFormatterBuilder dataTimeFormatterBuilder = new DateTimeFormatterBuilder();
		dataTimeFormatterBuilder.append(null, this.dateTimeParsers);
		DateTimeFormatter formatter = dataTimeFormatterBuilder.toFormatter();
		return formatter.parseDateTime(value).toDate();
	}
}
package other.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.command.CommandHandler;

public class RecordHandler implements CommandHandler {
	private static final String FORM_VIEW = "record";
	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws Exception {
		return FORM_VIEW;
	}

}

package domain;

public class CommandAction {
	private boolean isRedirect;
	private String path;
	
	public CommandAction() {
		// TODO Auto-generated constructor stub
	}

	public CommandAction(boolean isRedirect, String path) {
		super();
		this.isRedirect = isRedirect;
		this.path = path;
	}

	public boolean isRedirect() {
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}
	
	
}

package pictureboard.model;

import java.util.List;

public class PictureBoardPage {
	
	private int total;
	private int currentPage;
	private List<PictureBoard> content;
	private int totalPages;
	private int startPage;
	private int endPage;
	
	public PictureBoardPage(int total, int currentPage, int size, List<PictureBoard> content) {
		this.total = total;
		this.currentPage = currentPage;
		this.content = content;
		
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			this.totalPages = total / size;
			
			if (total % size > 0) {
				totalPages++;
			}
			
			this.startPage = (currentPage - 1) / 5 * 5 + 1;
			this.endPage = Math.min(startPage + 4, totalPages);
		}
	}
	
	public boolean hasNoArticles() {
		return total == 0;
	}
	
	public boolean hasArticles() {
		return total > 0;
	}
	
	public int getTotal() {
		return total;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public List<PictureBoard> getContent() {
		return content;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
		
		
		
	}

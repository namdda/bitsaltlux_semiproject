package co.kr.wdt.common.vo;

public class BlogPageVo {
	private final int groupSize = 5;
	
	private int curPage = 0;
	private int endPage = 0;
	private int startNum = 0;
	private int endNum = 0;
	private int count = 0;
	private int prevPage = 0;
	private int nextPage = 0;
	
	public BlogPageVo(String pageNum, int totalCount, int criterion) {
		if(pageNum == null) {
			pageNum ="1";
		}
		
		setCurPage(Integer.parseInt(pageNum));
		
		setStartNum( ((curPage - 1) / groupSize) * groupSize + 1);
		
		setEndNum( ((curPage - 1) / groupSize) * groupSize + groupSize);
		
		setCount(totalCount);
		
		setEndPage((int) Math.ceil(  (double) totalCount / criterion));
		
		setPrevPage(startNum - 1);
		setNextPage(endNum + 1);
	}
	
	public BlogPageVo() {
	}

	public int getCurPage() {
		return curPage;
	}
	
	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}
	
	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getStartNum() {
		return startNum;
	}
	
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	
	public int getEndNum() {
		return endNum;
	}
	
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	
	public int getCount() {
		return count;
	}
	
	public void setCount(int count) {
		this.count = count;
	}
	
	public int getPrevPage() {
		return prevPage;
	}
	
	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}
	
	public int getNextPage() {
		return nextPage;
	}
	
	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
	
	public int getGroupSize() {
		return groupSize;
	}

	@Override
	public String toString() {
		return "PageVo [curPage=" + curPage + ", endPage=" + endPage + ", startNum=" + startNum + ", endNum=" + endNum
				+ ", count=" + count + ", prevPage=" + prevPage + ", nextPage=" + nextPage + "]";
	}

	public boolean pageOverAndUnder(int curPage) {
		return (curPage > endPage) && (endPage > 1) ? true : false;
		
	}
}

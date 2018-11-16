package com.imu.util;

import com.imu.entity.Page;

public class PageUtil {
	public static Page createPage(int pageSize,int totalCount,int currentPage) {
		pageSize = getPageSize(pageSize);
		currentPage = getCurrentPage(currentPage);
		int totalPage = getTotalPage(pageSize, totalCount);
		int beginIndex = getBeginIndex(pageSize, currentPage);
		int endIndex = beginIndex+pageSize;
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(totalPage, currentPage);
		return new Page(pageSize, totalCount, totalPage, currentPage,
				beginIndex, endIndex, hasPrePage,  hasNextPage);
	}
	
	public static Page createPage(Page page,int totalCount) {
		int pageSize = getPageSize(page.getPageSize());
		int currentPage = getCurrentPage(page.getCurrentPage());
		int totalPage = getTotalPage(pageSize, totalCount);
		int beginIndex = getBeginIndex(pageSize, currentPage);
		int endIndex = beginIndex+pageSize;
		boolean hasPrePage = getHasPrePage(currentPage);
		boolean hasNextPage = getHasNextPage(totalPage, currentPage);
		return new Page(pageSize, totalCount, totalPage, currentPage,
				beginIndex, endIndex,hasPrePage,  hasNextPage);
	}
	
	//设置每页显示记录数
	public static int getPageSize(int pageSize) {
		return pageSize == 0 ? 10 : pageSize;
	}
	
	//设置当前页
	public static int getCurrentPage(int currentPage) {
		return currentPage == 0 ? 1 : currentPage;
	}
	
	//设置总页数,需要总记录数，每页显示多少
	public static int getTotalPage(int pageSize,int totalCount) {
		int totalPage = 0;
		if(totalCount % pageSize == 0) {
			totalPage = totalCount / pageSize;
		} else {
			totalPage = totalCount / pageSize + 1;
		}
		return totalPage;
	}
	
	//设置起始点，需要每页显示多少，当前页
	public static int getBeginIndex(int pageSize,int currentPage) {
		return (currentPage - 1) * pageSize;
	}
	
	//设置是否有上一页，需要当前页
	public static boolean getHasPrePage(int currentPage) {
		return currentPage == 1 ? false : true;
	}
	
	//设置是否有下一个，需要总页数和当前页
	public static boolean getHasNextPage(int totalPage, int currentPage) {
		return currentPage == totalPage || totalPage == 0 ? false : true;
	}
}

package com.news;
//import java.util.*;
//public  class Page implements java.io.Serializable {
public  class Page{
    public static final Page EMPTY_PAGE = new Page();
    public static final int  DEFAULT_PAGE_SIZE = 20;
    public static final  int MAX_PAGE_SIZE = 9999;
    private int myPageSize = DEFAULT_PAGE_SIZE;
    private int start;
    private int avaCount,totalSize;
    private Object data;
    private int currentPageno;
    private int totalPageCount;
    protected Page(){ //默认构造方法，只构造空页
        this.init(0,0,0,DEFAULT_PAGE_SIZE,new Object());
    }
    /**
     * 分页数据初始方法，由子类调用
     * @param start 本页数据在数据库中的起始位置
     * @param avaCount 本页包含的数据条数
     * @param totalSize 数据库中总记录条数
     * @param pageSize 本页容量
     * @param data 本页包含的数据
     */
    protected void init(int start, int avaCount, int totalSize, int pageSize, Object data){
        this.avaCount =avaCount;
        this.myPageSize = pageSize;
        this.start = start;
        this.totalSize = totalSize;
        this.data=data;
        System.out.println("avaCount:"+avaCount);
        System.out.println("totalSize:"+totalSize);
        if (avaCount>totalSize) {
            throw new RuntimeException("记录条数大于总条数？！");
        }
        this.currentPageno = (start -1)/pageSize +1;
        this.totalPageCount = (totalSize + pageSize -1) / pageSize;
        if (totalSize==0 && avaCount==0){
            this.currentPageno = 1;
            this.totalPageCount = 1;
        }
        System.out.println("Start Index to Page No: " + start + "-" + currentPageno);
    }
    public  Object getData(){
        return this.data;
    }
    public int getPageSize(){  //取本页数据容量（本页能包含的记录数）
        return this.myPageSize;
    }
    public boolean hasNextPage() { //是否有下一页
      return (this.getCurrentPageNo()<this.getTotalPageCount());
    }
    public boolean hasPreviousPage() { //是否有上一页
      return (this.getCurrentPageNo()>1);
    }
    public int getStart(){ // 获取当前页第一条数据在数据库中的位置
        return start;
    }
    public int getEnd(){ //获取当前页最后一条数据在数据库中的位置
        int end = this.getStart() + this.getSize() -1;
        if (end<0) {
            end = 0;
        }
        return end;
    }
    public int getStartOfPreviousPage() { //获取上一页第一条数据在数据库中的位置
        return Math.max(start-myPageSize, 1);
    }
    public int getStartOfNextPage() { //获取下一页第一条数据在数据库中的位置
        return start + avaCount;
    }
    public static int getStartOfAnyPage(int pageNo){ //获取任一页第一条数据在数据库中的位置，每页条数使用默认值
        return getStartOfAnyPage(pageNo, DEFAULT_PAGE_SIZE);
    }
    public static int getStartOfAnyPage(int pageNo, int pageSize){ //获取任一页第一条数据在数据库中的位置,pageNo表示页号,pageSize表示每页包含的记录数
        int startIndex = (pageNo-1) * pageSize + 1;
        if ( startIndex < 1) startIndex = 1;
            return startIndex;
    }
    public int getSize() { // 取本页包含的记录数
        return avaCount;
    }
    public int getTotalSize() {  // 取数据库中包含的总记录数
        return this.totalSize;
    }
    public int getCurrentPageNo(){ //取当前页码
        return  this.currentPageno;
    }
    public int getTotalPageCount(){ //取总页码
        return this.totalPageCount;
    }
   }


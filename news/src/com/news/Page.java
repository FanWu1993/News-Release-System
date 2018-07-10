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
    protected Page(){ //Ĭ�Ϲ��췽����ֻ�����ҳ
        this.init(0,0,0,DEFAULT_PAGE_SIZE,new Object());
    }
    /**
     * ��ҳ���ݳ�ʼ���������������
     * @param start ��ҳ���������ݿ��е���ʼλ��
     * @param avaCount ��ҳ��������������
     * @param totalSize ���ݿ����ܼ�¼����
     * @param pageSize ��ҳ����
     * @param data ��ҳ����������
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
            throw new RuntimeException("��¼������������������");
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
    public int getPageSize(){  //ȡ��ҳ������������ҳ�ܰ����ļ�¼����
        return this.myPageSize;
    }
    public boolean hasNextPage() { //�Ƿ�����һҳ
      return (this.getCurrentPageNo()<this.getTotalPageCount());
    }
    public boolean hasPreviousPage() { //�Ƿ�����һҳ
      return (this.getCurrentPageNo()>1);
    }
    public int getStart(){ // ��ȡ��ǰҳ��һ�����������ݿ��е�λ��
        return start;
    }
    public int getEnd(){ //��ȡ��ǰҳ���һ�����������ݿ��е�λ��
        int end = this.getStart() + this.getSize() -1;
        if (end<0) {
            end = 0;
        }
        return end;
    }
    public int getStartOfPreviousPage() { //��ȡ��һҳ��һ�����������ݿ��е�λ��
        return Math.max(start-myPageSize, 1);
    }
    public int getStartOfNextPage() { //��ȡ��һҳ��һ�����������ݿ��е�λ��
        return start + avaCount;
    }
    public static int getStartOfAnyPage(int pageNo){ //��ȡ��һҳ��һ�����������ݿ��е�λ�ã�ÿҳ����ʹ��Ĭ��ֵ
        return getStartOfAnyPage(pageNo, DEFAULT_PAGE_SIZE);
    }
    public static int getStartOfAnyPage(int pageNo, int pageSize){ //��ȡ��һҳ��һ�����������ݿ��е�λ��,pageNo��ʾҳ��,pageSize��ʾÿҳ�����ļ�¼��
        int startIndex = (pageNo-1) * pageSize + 1;
        if ( startIndex < 1) startIndex = 1;
            return startIndex;
    }
    public int getSize() { // ȡ��ҳ�����ļ�¼��
        return avaCount;
    }
    public int getTotalSize() {  // ȡ���ݿ��а������ܼ�¼��
        return this.totalSize;
    }
    public int getCurrentPageNo(){ //ȡ��ǰҳ��
        return  this.currentPageno;
    }
    public int getTotalPageCount(){ //ȡ��ҳ��
        return this.totalPageCount;
    }
   }


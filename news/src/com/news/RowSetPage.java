package com.news;
import javax.sql.RowSet;
import java.sql.ResultSet;
public class RowSetPage extends Page {
    private ResultSet rs;
    public static final RowSetPage EMPTY_PAGE =null;
    public RowSetPage(){ //Ĭ�Ϲ��췽����������ҳ
       this(null, 0,0);
 }
    /**
     *�����ҳ����
     *@param crs ����һҳ���ݵ�OracleCachedRowSet
     *@param start ��ҳ���������ݿ��е���ʼλ��
     *@param totalSize ���ݿ��а����ļ�¼����
     */
    public RowSetPage(ResultSet crs, int start, int totalSize) {
        this(crs,start,totalSize,Page.DEFAULT_PAGE_SIZE);
    }
    /**
     *�����ҳ����
     *@param crs ����һҳ���ݵ�OracleCachedRowSet
     *@param start ��ҳ���������ݿ��е���ʼλ��
     *@param totalSize ���ݿ��а����ļ�¼����
     *@pageSize ��ҳ�����ɵļ�¼��
     */
    public RowSetPage(ResultSet crs, int start, int totalSize, int pageSize) {
        try{
            int avaCount=0;
            if (crs!=null) {
                if (crs.next()){
                    avaCount = crs.getRow();
                }
            }
            rs = crs;
            super.init(start,avaCount,totalSize,pageSize,rs);
        }catch(java.sql.SQLException sqle){
            throw new RuntimeException(sqle.toString());
        }
    }
    public ResultSet getRowSet(){ //ȡ��ҳ�����еļ�¼����
        return rs;
    }
}

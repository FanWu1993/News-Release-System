package com.news;
import javax.sql.RowSet;
import java.sql.ResultSet;
public class RowSetPage extends Page {
    private ResultSet rs;
    public static final RowSetPage EMPTY_PAGE =null;
    public RowSetPage(){ //默认构造方法，创建空页
       this(null, 0,0);
 }
    /**
     *构造分页对象
     *@param crs 包含一页数据的OracleCachedRowSet
     *@param start 该页数据在数据库中的起始位置
     *@param totalSize 数据库中包含的记录总数
     */
    public RowSetPage(ResultSet crs, int start, int totalSize) {
        this(crs,start,totalSize,Page.DEFAULT_PAGE_SIZE);
    }
    /**
     *构造分页对象
     *@param crs 包含一页数据的OracleCachedRowSet
     *@param start 该页数据在数据库中的起始位置
     *@param totalSize 数据库中包含的记录总数
     *@pageSize 本页能容纳的记录数
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
    public ResultSet getRowSet(){ //取分页对象中的记录数据
        return rs;
    }
}

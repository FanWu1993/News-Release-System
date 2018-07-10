package com.news;
import com.news.MyDatabean;
import java.sql.*;
public  class PagedStatement {
  public final static int MAX_PAGE_SIZE = Page.MAX_PAGE_SIZE;
    protected String countSQL, querySQL;
    protected int pageNo,pageSize,startIndex,totalCount;
    protected javax.sql.RowSet rowSet;
    protected java.sql.ResultSet rst;
    protected RowSetPage rowSetPage;
    public PagedStatement(String sql){ //构造一查询出所有数据的PageStatement
        this(sql,1,MAX_PAGE_SIZE);
    }
    public PagedStatement(String sql, int pageNo){ //构造一查询出当页数据的PageStatement
        this(sql, pageNo, Page.DEFAULT_PAGE_SIZE);
    }
    /**
     * 构造一查询出当页数据的PageStatement，并指定每页显示记录条数
     * @param sql query sql
     * @param pageNo 页码
     * @param pageSize 每页容量
     */
    public PagedStatement(String sql, int pageNo, int pageSize){
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.startIndex = Page.getStartOfAnyPage(pageNo, pageSize);
        this.countSQL="SELECT COUNT(*) AS Expr1 FROM ("+sql+") DERIVEDTBL";
        this.querySQL = intiQuerySQL(sql, this.startIndex, pageSize);
    }
    /**
     *生成查询一页数据的sql语句
     *@param sql 原查询语句
     *@startIndex 开始记录位置
     *@size 需要获取的记录数
     */
    protected String intiQuerySQL(String sql, int startIndex, int size){
    return sql;
   }
   //执行查询取得一页数据，执行结束后关闭数据库连接
    public  RowSetPage executeQuery() throws SQLException, Exception {
        System.out.println("executeQueryUsingPreparedStatement");
        MyDatabean one=new MyDatabean();
        Connection conn = one.OpenConn();
        PreparedStatement pst = null;
        ResultSet rs = null;
        try{
            pst = conn.prepareStatement(this.countSQL);
            rs =pst.executeQuery();
            if (rs.next()){
                totalCount = rs.getInt(1);
            } else {
                totalCount = 0;
            }
            rs.close();
            rs = null;
            pst.close();
            pst=null;
            if (totalCount < 1 ) return RowSetPage.EMPTY_PAGE;
                pst = conn.prepareStatement(this.querySQL);
                rs =pst.executeQuery();
                this.rst = rs;
                this.rowSetPage = new RowSetPage(rs,startIndex,totalCount,pageSize);
                return this.rowSetPage;
             }catch(SQLException sqle){
                  sqle.printStackTrace();
                  throw sqle;
        }
    }
}

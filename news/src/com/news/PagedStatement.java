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
    public PagedStatement(String sql){ //����һ��ѯ���������ݵ�PageStatement
        this(sql,1,MAX_PAGE_SIZE);
    }
    public PagedStatement(String sql, int pageNo){ //����һ��ѯ����ҳ���ݵ�PageStatement
        this(sql, pageNo, Page.DEFAULT_PAGE_SIZE);
    }
    /**
     * ����һ��ѯ����ҳ���ݵ�PageStatement����ָ��ÿҳ��ʾ��¼����
     * @param sql query sql
     * @param pageNo ҳ��
     * @param pageSize ÿҳ����
     */
    public PagedStatement(String sql, int pageNo, int pageSize){
        this.pageNo = pageNo;
        this.pageSize = pageSize;
        this.startIndex = Page.getStartOfAnyPage(pageNo, pageSize);
        this.countSQL="SELECT COUNT(*) AS Expr1 FROM ("+sql+") DERIVEDTBL";
        this.querySQL = intiQuerySQL(sql, this.startIndex, pageSize);
    }
    /**
     *���ɲ�ѯһҳ���ݵ�sql���
     *@param sql ԭ��ѯ���
     *@startIndex ��ʼ��¼λ��
     *@size ��Ҫ��ȡ�ļ�¼��
     */
    protected String intiQuerySQL(String sql, int startIndex, int size){
    return sql;
   }
   //ִ�в�ѯȡ��һҳ���ݣ�ִ�н�����ر����ݿ�����
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

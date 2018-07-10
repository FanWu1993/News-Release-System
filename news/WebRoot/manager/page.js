//分页处理
function first(id_name) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    if(currentPage == 1) {
    	alert("已经到达首页！");
    	return;
    } else {
    	if(currentPage != 0) {//不是重新指定显示页大小，为0的时候是重新指定页面的大小，设为0的时候已经隐藏了当前页
    	   var i, currentPageNo;
    	   if(pageSize*currentPage > rowCount)
          	 currentPageNo = rowCount;
    	   else
         	 currentPageNo = pageSize*currentPage;
    	   //隐藏掉正显示的页
    	   for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
                 eval( id_name + i ).style.display = "none";
        }
        //显示第一页
        var j, firstPageNo;
        if(pageSize > rowCount)
            firstPageNo = rowCount;
        else
            firstPageNo = pageSize;
        for ( j = 1; j <=firstPageNo ; j++ )
            eval( id_name + j ).style.display = "";

        document.all(id_name+'currentPage').innerText = 1;
    }
}

function next(id_name) {	
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);
	
    if(pageCount == 0)
     	return;
    if(currentPage == pageCount) {
         alert("已经到达尾页！");
         return;
    } else {
         var i;
    	//隐藏掉正显示的页
    	for ( i = pageSize*(currentPage-1)+1; i <= pageSize*currentPage; i++ )
        	eval( id_name + i ).style.display = "none";
    	//显示下一页
    	var j, nextPageNo;
    	if((rowCount - currentPage*pageSize) >= pageSize )
    	       	nextPageNo = currentPage*pageSize+pageSize;
    	else
        	nextPageNo = rowCount;
        for ( j = pageSize*currentPage+1; j <=nextPageNo ; j++ )
        	eval( id_name + j ).style.display = "";
        document.all(id_name+'currentPage').innerText = ++currentPage;	
    }
}

function previse(id_name) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    if(currentPage == 1) {
    	alert("已经到达首页！");
        return;
    } else {
    	var i, currentPageNo;
    	if(pageSize*currentPage > rowCount)
        	 currentPageNo = rowCount;
    	else
        	 currentPageNo = pageSize*currentPage;
    	//隐藏掉正显示的页
    	for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
        	eval( id_name + i ).style.display = "none";
    	//显示前一页
    	var j, previousPageNo;
    	previousPageNo = (currentPage-1)*pageSize;
    	for ( j = pageSize*(currentPage-2)+1; j <=previousPageNo ; j++ )
        	eval( id_name + j ).style.display = "";

    	document.all(id_name+'currentPage').innerText = --currentPage;
    }
}

function last(id_name) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    //隐藏掉正显示的页
    if(currentPage == pageCount) {
    	alert("已经到达尾页！");
    	return;
    } else {
    	var i;
        for ( i = pageSize*(currentPage-1)+1; i <= pageSize*currentPage; i++ )
            eval( id_name + i ).style.display = "none";
        //显示最后一页
        var j, lastPageNo;
        lastPageNo = rowCount;
        for ( j = pageSize*(pageCount-1)+1; j <=lastPageNo ; j++ )
            eval( id_name + j ).style.display = "";
        document.all(id_name+'currentPage').innerText = pageCount;
    }
}
//pageSelectCombox是页数下拉框，pageSizeCombox是每页的记录数下拉框
function changePageSize(id_name, pageSizeCombox, pageSelectCombox) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    var newPageSize = parseInt(pageSizeCombox.options[pageSizeCombox.selectedIndex].value);
    var newPageCount = parseInt((rowCount+newPageSize-1) / newPageSize);
    //先清空当前页的内容
    var i, currentPageNo;
    if(pageSize*currentPage > rowCount)
         currentPageNo = rowCount;
    else
       	 currentPageNo = pageSize*currentPage;
    //隐藏掉正显示的页
    for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
       	eval( id_name + i ).style.display = "none";

    //重新设置
    document.all(id_name+'currentPage').innerText = 0;//重新指定页面大小
    document.all(id_name+'pageSize').innerText = newPageSize;
    document.all(id_name+'pageCount').innerText = newPageCount;
    //更新页数下拉框pageSelectCombox.options[pageSelectCombox.selectedIndex].value);
    pageSelectCombox.length = newPageCount;
    for(var j=0;j<newPageCount;j++) {
    	pageSelectCombox.options[j].value = j+1;
        pageSelectCombox.options[j].text = j+1;
    }
    first(id_name);//显示第一页
}

function goPage(id_name, pageSelectCombox) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);
    var newPage = parseInt(pageSelectCombox.options[pageSelectCombox.selectedIndex].value);
    //先清空当前页的内容
    var i, currentPageNo;
    if(pageSize*currentPage > rowCount)
         currentPageNo = rowCount;
    else
       	 currentPageNo = pageSize*currentPage;
    //隐藏掉正显示的页
    for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
       	eval( id_name + i ).style.display = "none";
    //显示新设定的页
    var j, newPageNo;
    if(newPage*pageSize > rowCount)
         newPageNo = rowCount;
    else
         newPageNo = newPage*pageSize;
    for ( j = pageSize*(newPage-1)+1; j <=newPageNo ; j++ )
       	eval( id_name + j ).style.display = "";
    //重新设置当前页的值
    document.all(id_name+'currentPage').innerText = parseInt(newPage);
}

function checkAllCurrentPage(id_name, selectAllCheckBox, listCheckBox) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    //var newPage = parseInt(selectAllCheckBox.options[selectAllCheckBox.selectedIndex].value);
    var i, currentPageNo;
    if(pageSize*currentPage > rowCount)
         currentPageNo = rowCount;
    else
       	 currentPageNo = pageSize*currentPage;
    for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ ) {
           if(listCheckBox != null) {
              if(listCheckBox.checked == false || listCheckBox.checked == true)
                 listCheckBox.checked = selectAllCheckBox.checked;
              else
                 listCheckBox[i-1].checked = selectAllCheckBox.checked;
           }
    }
}

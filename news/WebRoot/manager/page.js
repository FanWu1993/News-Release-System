//��ҳ����
function first(id_name) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    if(currentPage == 1) {
    	alert("�Ѿ�������ҳ��");
    	return;
    } else {
    	if(currentPage != 0) {//��������ָ����ʾҳ��С��Ϊ0��ʱ��������ָ��ҳ��Ĵ�С����Ϊ0��ʱ���Ѿ������˵�ǰҳ
    	   var i, currentPageNo;
    	   if(pageSize*currentPage > rowCount)
          	 currentPageNo = rowCount;
    	   else
         	 currentPageNo = pageSize*currentPage;
    	   //���ص�����ʾ��ҳ
    	   for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
                 eval( id_name + i ).style.display = "none";
        }
        //��ʾ��һҳ
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
         alert("�Ѿ�����βҳ��");
         return;
    } else {
         var i;
    	//���ص�����ʾ��ҳ
    	for ( i = pageSize*(currentPage-1)+1; i <= pageSize*currentPage; i++ )
        	eval( id_name + i ).style.display = "none";
    	//��ʾ��һҳ
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
    	alert("�Ѿ�������ҳ��");
        return;
    } else {
    	var i, currentPageNo;
    	if(pageSize*currentPage > rowCount)
        	 currentPageNo = rowCount;
    	else
        	 currentPageNo = pageSize*currentPage;
    	//���ص�����ʾ��ҳ
    	for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
        	eval( id_name + i ).style.display = "none";
    	//��ʾǰһҳ
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
    //���ص�����ʾ��ҳ
    if(currentPage == pageCount) {
    	alert("�Ѿ�����βҳ��");
    	return;
    } else {
    	var i;
        for ( i = pageSize*(currentPage-1)+1; i <= pageSize*currentPage; i++ )
            eval( id_name + i ).style.display = "none";
        //��ʾ���һҳ
        var j, lastPageNo;
        lastPageNo = rowCount;
        for ( j = pageSize*(pageCount-1)+1; j <=lastPageNo ; j++ )
            eval( id_name + j ).style.display = "";
        document.all(id_name+'currentPage').innerText = pageCount;
    }
}
//pageSelectCombox��ҳ��������pageSizeCombox��ÿҳ�ļ�¼��������
function changePageSize(id_name, pageSizeCombox, pageSelectCombox) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);

    if(pageCount == 0)
     	return;
    var newPageSize = parseInt(pageSizeCombox.options[pageSizeCombox.selectedIndex].value);
    var newPageCount = parseInt((rowCount+newPageSize-1) / newPageSize);
    //����յ�ǰҳ������
    var i, currentPageNo;
    if(pageSize*currentPage > rowCount)
         currentPageNo = rowCount;
    else
       	 currentPageNo = pageSize*currentPage;
    //���ص�����ʾ��ҳ
    for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
       	eval( id_name + i ).style.display = "none";

    //��������
    document.all(id_name+'currentPage').innerText = 0;//����ָ��ҳ���С
    document.all(id_name+'pageSize').innerText = newPageSize;
    document.all(id_name+'pageCount').innerText = newPageCount;
    //����ҳ��������pageSelectCombox.options[pageSelectCombox.selectedIndex].value);
    pageSelectCombox.length = newPageCount;
    for(var j=0;j<newPageCount;j++) {
    	pageSelectCombox.options[j].value = j+1;
        pageSelectCombox.options[j].text = j+1;
    }
    first(id_name);//��ʾ��һҳ
}

function goPage(id_name, pageSelectCombox) {
    var currentPage = parseInt(document.all(id_name+'currentPage').innerText);
    var pageSize = parseInt(document.all(id_name+'pageSize').innerText);
    var pageCount = parseInt(document.all(id_name+'pageCount').innerText);
    var rowCount = parseInt(document.all(id_name+'rowCount').innerText);
    var newPage = parseInt(pageSelectCombox.options[pageSelectCombox.selectedIndex].value);
    //����յ�ǰҳ������
    var i, currentPageNo;
    if(pageSize*currentPage > rowCount)
         currentPageNo = rowCount;
    else
       	 currentPageNo = pageSize*currentPage;
    //���ص�����ʾ��ҳ
    for ( i = pageSize*(currentPage-1)+1; i <= currentPageNo; i++ )
       	eval( id_name + i ).style.display = "none";
    //��ʾ���趨��ҳ
    var j, newPageNo;
    if(newPage*pageSize > rowCount)
         newPageNo = rowCount;
    else
         newPageNo = newPage*pageSize;
    for ( j = pageSize*(newPage-1)+1; j <=newPageNo ; j++ )
       	eval( id_name + j ).style.display = "";
    //�������õ�ǰҳ��ֵ
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

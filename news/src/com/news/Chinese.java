package com.news;

import java.io.UnsupportedEncodingException;

public class Chinese {
  //转换字符级的方法
  public static String str(String a) {
    try {
      return new String(a.getBytes("ISO-8859-1"));
    }
    catch (UnsupportedEncodingException ex) {

    }

    return null;

  }

}

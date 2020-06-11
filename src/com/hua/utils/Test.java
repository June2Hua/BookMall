package com.hua.utils;

import java.util.ArrayList;
import java.util.LinkedList;

/**
 * 其他代码，主要用于测试
 */
public class Test {

    public static void main(String[] args) {
        String[] strings=new String[]{"june","hua","666","999"};
        ArrayList<Integer> list=new ArrayList<>();
//        for(String str:strings)
//            list.add(str);

        //更新
        for (int i=0;i<strings.length;i++){
            if("666".equals(strings[i]))
              strings[i]="6666666" ;
        }
        print(strings);

        for(int i=0;i<20;i++)
            list.add(i);
        
    }
    public static void print(String[] strings){
        for(String str:strings)
            System.out.println(str);
    }
}



package com.yasasitango.www.vo;

import lombok.Data;

@Data
public class TangoVO {
    int word_num;
    int word_level;
    String hiragana;
    String kanji;
    String korean;
    String example;
    String example_korean;
}


/*
 * word_num number(10) PRIMARY KEY, 
 * word_level number(1) NOT NULL, 
 * hiragana
 * VARCHAR2(100) NOT NULL, 
 * kanji VARCHAR2(20), 
 * korean VARCHAR2(200) NOT NULL,
 * example VARCHAR2(200), 
 * example_korean VARCHAR2(200)
 */
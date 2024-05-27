package com.kh.journey.room.vo;

public class RoomVo {
    private String no;
    private String name;
    private String grade;
    private String img01;

    // Constructor
    public RoomVo(String no, String name, String grade, String img01) {
        this.no = no;
        this.name = name;
        this.grade = grade;
        this.img01 = img01;
    }

    public RoomVo() {
    }

    // Getter, Setter
    public String getNo() {
        return no;
    }

    public void setNo(String no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }

    public String getImg01() {
        return img01;
    }

    public void setImg01(String img01) {
        this.img01 = img01;
    }
}

package com.lgr.pojo;

public class Plan {

    private int id;
    private String type;
    private String dataline;
    private String people;
    private String boat;
    private String oil;
    private String status;
    private String tuolun;

    //分页
    private int page;
    private int limit;

    public String getTuolun() {
        return tuolun;
    }

    public void setTuolun(String tuolun) {
        this.tuolun = tuolun;
    }

    public int getPage() {
        return (page - 1) * limit;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getDataline() {
        return dataline;
    }

    public void setDataline(String dataline) {
        this.dataline = dataline;
    }

    public String getPeople() {
        return people;
    }

    public void setPeople(String people) {
        this.people = people;
    }

    public String getBoat() {
        return boat;
    }

    public void setBoat(String boat) {
        this.boat = boat;
    }

    public String getOil() {
        return oil;
    }

    public void setOil(String oil) {
        this.oil = oil;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}

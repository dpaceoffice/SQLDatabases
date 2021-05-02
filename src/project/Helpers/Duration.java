package project.Helpers;

import java.sql.Date;

public class Duration {

    private java.util.Date startDate, endDate;
    
    public Duration(Date startDate, Date endDate) {
        if(startDate == null)
            this.startDate = new java.util.Date();
        else
            this.startDate = new java.util.Date(startDate.getTime());
        if(endDate == null)
            this.endDate = new java.util.Date();
        else
            this.endDate = new java.util.Date(endDate.getTime());
    }
    
    public java.util.Date getStartDate() {
        return startDate;
    }

    public void setStartDate(java.util.Date startDate) {
        this.startDate = startDate;
    }

    public java.util.Date getEndDate() {
        return endDate;
    }

    public void setEndDate(java.util.Date endDate) {
        this.endDate = endDate;
    }

}

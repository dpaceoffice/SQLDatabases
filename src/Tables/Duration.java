package Tables;

import java.sql.Date;

public class Duration {

    private java.util.Date startDate, endDate;
    
    public Duration(Date startDate, Date endDate) {
        this.startDate = new java.util.Date(startDate.getTime());
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

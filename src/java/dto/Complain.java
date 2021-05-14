package dto;

import java.io.Serializable;

public class Complain implements Serializable {

    int id;
    String title;
    String category;
    String date;
    String time;
    String description;
    String createdAt;
    String userId;
    String status;
    String complainer;
    String complainerEmail;
    String complainerMobile;
    String comment;

    public Complain() {
    }

    public Complain(int id, String title, String category, String date, String time, String description, String createdAt, String userId, String status, String complainer, String complainerEmail, String complainerMobile, String comment) {
        this.id = id;
        this.title = title;
        this.category = category;
        this.date = date;
        this.time = time;
        this.description = description;
        this.createdAt = createdAt;
        this.userId = userId;
        this.status = status;
        this.complainer = complainer;
        this.complainerEmail = complainerEmail;
        this.complainerMobile = complainerMobile;
        this.comment = comment;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getComplainer() {
        return complainer;
    }

    public void setComplainer(String complainer) {
        this.complainer = complainer;
    }

    public String getComplainerEmail() {
        return complainerEmail;
    }

    public void setComplainerEmail(String complainerEmail) {
        this.complainerEmail = complainerEmail;
    }

    public String getComplainerMobile() {
        return complainerMobile;
    }

    public void setComplainerMobile(String complainerMobile) {
        this.complainerMobile = complainerMobile;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    @Override
    public String toString() {
        return "Complain{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", category='" + category + '\'' +
                ", date='" + date + '\'' +
                ", time='" + time + '\'' +
                ", description='" + description + '\'' +
                ", createdAt='" + createdAt + '\'' +
                ", userId='" + userId + '\'' +
                ", status='" + status + '\'' +
                ", complainer='" + complainer + '\'' +
                ", complainerEmail='" + complainerEmail + '\'' +
                ", complainerMobile='" + complainerMobile + '\'' +
                '}';
    }
}

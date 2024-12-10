package klu.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "aminity")
public class Aminity {
    @Id
    @Column(name = "id")
    Long id;

    @Column(name = "aminity_name")
    String aminityName;

    @Column(name = "status")
    String status;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getAminityName() {
        return aminityName;
    }

    public void setAminityName(String aminityName) {
        this.aminityName = aminityName;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Aminity [id=" + id + ", aminityName=" + aminityName + ", status=" + status + "]";
    }
}

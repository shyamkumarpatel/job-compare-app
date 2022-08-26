package com.sp.jobcompare.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="job")
public class Job {

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	    
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;
	
    @PrePersist
    protected void onCreate(){
        this.createdAt = new Date();
    }
    @PreUpdate
    protected void onUpdate(){
        this.updatedAt = new Date();
    }
    
    @NotEmpty(message="Company name is required!")
    @Size(min=3, max=120, message="Company must be between 3 and 120 characters")
    private String companyName;
    
    @NotEmpty(message="Title is required!")
    @Size(min=3, max=120, message="Title must be between 3 and 120 characters")
    private String title;
    
    @NotEmpty(message="Location City is required!")
    @Size(min=3, max=120, message="City must be between 3 and 120 characters")
    private String locationCity;
    
    @NotEmpty(message="Location State is required!")
    @Size(min=2, max=120, message="State must be between 2 and 120 characters")
    private String locationState;
    
	@Lob
    @NotEmpty(message="Job Source is required!")
    @Size(min=1, message="State must be more than 1 character")
    private String jobSource;
    
	@DecimalMin(value = "0.00", message = "pay must be at least $0.00")
	private Double pay;
	
    @NotEmpty(message="rate is required!")
    @Size(min=2, max=120, message="rate must be between 2 and 120 characters")
    private String payRate;
	
	@DecimalMin(value = "0.00", message = "Bonus must be more than $0.00")
	private Double bonus;
	

	@Min(0)
	@Max(5)
	private int remoteDays;
	
	@Lob 
	@NotNull(message="Description cannot be Empty")
    private String description;
	
	// ---------------MANY-TO-ONE ----------------
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="creator_id")
    private User creator;
    
    public Job() {
    	
    }
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getCreatedAt() {
		return createdAt;
	}
	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}
	public Date getUpdatedAt() {
		return updatedAt;
	}
	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getLocationCity() {
		return locationCity;
	}
	public void setLocationCity(String locationCity) {
		this.locationCity = locationCity;
	}
	public String getLocationState() {
		return locationState;
	}
	public void setLocationState(String locationState) {
		this.locationState = locationState;
	}
	public String getJobSource() {
		return jobSource;
	}
	public void setJobSource(String jobSource) {
		this.jobSource = jobSource;
	}

	public Double getPay() {
		return pay;
	}
	public void setPay(Double pay) {
		this.pay = pay;
	}
	public String getPayRate() {
		return payRate;
	}
	public void setPayRate(String payRate) {
		this.payRate = payRate;
	}

	public Double getBonus() {
		return bonus;
	}
	public void setBonus(Double bonus) {
		this.bonus = bonus;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public User getCreator() {
		return creator;
	}
	public void setCreator(User creator) {
		this.creator = creator;
	}
	public int getRemoteDays() {
		return remoteDays;
	}
	public void setRemoteDays(int remoteDays) {
		this.remoteDays = remoteDays;
	}
	
}

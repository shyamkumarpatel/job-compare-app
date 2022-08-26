package com.sp.jobcompare.services;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sp.jobcompare.models.Job;
import com.sp.jobcompare.repositories.JobRepository;

@Service
public class JobService {
	@Autowired
	private JobRepository jobRepo;
	
	//create
    public Job createJob(Job job) {
    	return jobRepo.save(job);
    }
    
	//find all
	public List<Job> findAllJobs(){
    	return jobRepo.findAll();
    }
	
	//find all but
	public List<Job> findAllBut(Long id){
		List<Long> ids =new ArrayList<Long>();
		ids.add(id);
    	return jobRepo.findByIdNotIn(ids);
    }
	
	//find one
    public Job findJob(Long id) {
    	Optional<Job> optionalJob = jobRepo.findById(id);
    	if(optionalJob.isPresent()) {
    		return optionalJob.get();
    	}else {
    		return null;
    	}
    }
    
	//update
    public Job updateJob(Job job) {
    	return jobRepo.save(job);
    }
    
	//delete
    public void deleteJob(Long id) {
    	jobRepo.deleteById(id);
    }

}

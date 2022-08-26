package com.sp.jobcompare.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.sp.jobcompare.models.Job;

@Repository
public interface JobRepository extends CrudRepository< Job, Long>{
	List<Job> findAll();
	List<Job> findByIdNotIn(List<Long> ids);
}

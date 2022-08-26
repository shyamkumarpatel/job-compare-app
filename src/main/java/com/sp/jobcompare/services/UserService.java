package com.sp.jobcompare.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.sp.jobcompare.models.LoginUser;
import com.sp.jobcompare.models.User;
import com.sp.jobcompare.repositories.UserRepository;


@Service
public class UserService {
	@Autowired
    private UserRepository userRepo;
	
    public User register(User newUser, BindingResult result) {
        // TO-DO - Reject values:
    
        // Reject if email is taken (present in database)
    	// 1. Find user in the DB by email
    	Optional<User> optionalUser = userRepo.findByEmail(newUser.getEmail());
    	
    	// 2. if the email is present , reject
    	if(optionalUser.isPresent()) { // if the user is present, return true
    		result.rejectValue("email", "unique", "This email is already in the database");
    	}    	   	
    	
        // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirm())) { // if(!a.equals(b)) --> a!= b
    		result.rejectValue("confirm", "matches", "The confirm password does not match");
    	}
    	
        // Return null if result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
    
        // Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
    	newUser.setPassword(hashed);
    	return userRepo.save(newUser);

    }
    public User login(LoginUser newLoginObject, BindingResult result) {
		// Find user in the DB by email
	    // 1. Find user in the DB by email
	    Optional<User> potentialUser = userRepo.findByEmail(newLoginObject.getEmail());
	    	
	    // 2. if the email is not present , reject	
	    if(!potentialUser.isPresent()) {
	    	result.rejectValue("email", "unique", "The email is not registered");
	    	return null;
	    }	
	    
	    // 3.1 grab the user from potential user
	    User user = potentialUser.get();
	    
	    // 3.2 if BCrypt password match fails
	    if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) {
	    	result.rejectValue("password", "Matches", "Invalid password");
	    }
	
	    // 4 if result has errors,return 
	    if(result.hasErrors()) {
	    	return null;
	    }
	    
	    // Otherwise, return the user object
	    return user;
    }

}

package com.sp.jobcompare.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.sp.jobcompare.models.Job;
import com.sp.jobcompare.models.LoginUser;
import com.sp.jobcompare.models.User;
import com.sp.jobcompare.services.JobService;
import com.sp.jobcompare.services.UserService;

@Controller
public class HomeController {
	@Autowired
	private UserService userService;
	@Autowired
	private JobService jobService;
	
	@GetMapping("/")
	public String goToHomePage(Model model) {
		model.addAttribute("newUser",new User());
		model.addAttribute("newLogin",new LoginUser());
		return "LoginPage.jsp";
	}
	
	@PostMapping("/register")
	public String processRegister(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
        // to do some extra validations and create a new user!
		userService.register(newUser, result);
        
        if(result.hasErrors()) {
            // register model : newUser is already there. 
            // re-rendering the page.
            model.addAttribute("newLogin", new LoginUser());
            return "LoginPage.jsp";
        }
        
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
       session.setAttribute("userId", newUser.getId());
	   session.setAttribute("usersName", newUser.getUserName());
       return "redirect:/dashboard"; 
    }
	
	@PostMapping("/login")
	public String processLogin(@Valid @ModelAttribute("newLogin") LoginUser newLogin, 
            BindingResult result, Model model, HttpSession session) {
		
		User user = userService.login(newLogin, result);
		
		if(result.hasErrors()) {
			// loginObject is already there
			model.addAttribute("newUser", new User());
			return "LoginPage.jsp";
		}
        // No errors! 
        // TO-DO Later: Store their ID from the DB in session, 
		session.setAttribute("userId", user.getId());
		session.setAttribute("usersName", user.getUserName());
		
		return "redirect:/dashboard";
    }
	
	/* ------- HOME PAGE (REDIRECT to /dashboard) -------------- */	
	@GetMapping("/dashboard")
	public String goToDashboard(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}

    	List<Job> jobs = jobService.findAllJobs();
    	model.addAttribute("jobs", jobs);
		return "Dashboard.jsp";
	}
	
	 //logout
    @GetMapping("/logout")
    public String logout(HttpSession session) {
    	session.invalidate();
    	return "redirect:/";
    }
	
    //Create job
    @GetMapping("/job/new")
    public String renderCreateShows(Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
		model.addAttribute("newJob",new Job());
		return "AddJob.jsp";
    	
    }
	@PostMapping("/create")
	public String processJobCreation(@Valid @ModelAttribute("newJob") Job job, 
            BindingResult result, Model model, HttpSession session) {
		
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}

    	if(result.hasErrors()) {
    		return "AddJob.jsp";
    	}else {
        	jobService.createJob(job);
    		return "redirect:/dashboard";
    	}
    }
	
	/* ------- Displays Job ----- */	
	@GetMapping("/job/{id}")
	public String jobDetailsPage(@PathVariable("id") Long id, Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
		Job job = jobService.findJob(id);
		model.addAttribute("job", job);
		return "ViewJob.jsp";
	}
	
	/* ------- Compare Select ----- */	
	@GetMapping("/compareJob/{id}")
	public String jobCompareSelectionPage(@PathVariable("id") Long id, Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
    	List<Job> jobs = jobService.findAllBut(id);
    	model.addAttribute("jobs", jobs);
		Job jobSelected = jobService.findJob(id);
    	model.addAttribute("jobSelected", jobSelected);
		return "CompareSelection.jsp";
	}	
	
	/* ------- Compare Jobs ----- */	
	@GetMapping("/compareJob/{id}/{id2}")
	public String jobComparePage(@PathVariable("id") Long id,@PathVariable("id2") Long id2, Model model, HttpSession session) {
    	if(session.getAttribute("userId")==null) {
    		return "redirect:/";
    	}
		Job job = jobService.findJob(id);
    	model.addAttribute("job", job);
		Job job2 = jobService.findJob(id2);
    	model.addAttribute("job2", job2);
		return "ViewComparison.jsp";
	}	
	
	

}

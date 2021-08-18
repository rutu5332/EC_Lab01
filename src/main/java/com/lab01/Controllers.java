package com.lab01;

import java.util.*;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class Controllers {
	Vector<String> candidates = new Vector<String>();
	Vector<String> cids = new Vector<String>();
	Vector<String> voters = new Vector<String>();
	Map<Integer, Integer> map = new HashMap<Integer, Integer>();

	@RequestMapping({ "/", "/home" })
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("index.jsp");
		return mv;
	}

	@RequestMapping({ "/candidate" })
	public ModelAndView Candidates() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("candidate.jsp");
		return mv;
	}

	@RequestMapping("/addCandidate")
	public ModelAndView addCandiddate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String nm = request.getParameter("fname") + " " + request.getParameter("lname");
		String roll = request.getParameter("roll");
		String msg = "Candidate <b>" + nm + "-" + roll + "</b> Added Sucessfully";
		if (candidates.indexOf(nm) == -1 && cids.indexOf(roll) == -1) {
			candidates.add(nm);
			cids.add(roll);
			map.put(Integer.parseInt(roll), 0);
		} else
			msg = "Candidate <b>" + nm + "-" + roll + "</b> is already there..!!";

		mv.setViewName("final.jsp");
		mv.addObject("message", msg);
		mv.addObject("link", "Add Candidate");
		return mv;
	}

	@RequestMapping("/VotePanel")
	public ModelAndView voteList(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("Vote.jsp");
		mv.addObject("List", candidates);
		mv.addObject("idList", cids);
		return mv;
	}

	@RequestMapping("/voteCandidate")
	public ModelAndView voteCandidate(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView();
		String sid = request.getParameter("id");
		int c = Integer.parseInt(request.getParameter("candidate"));
		String msg = "<b>" + sid + "</b>, your vote has been recorded successfully.";

		if (voters.indexOf(sid) == -1) {
			voters.add(sid);
			map.replace(c, map.get(c) + 1);
		} else
			msg = "<b>" + sid + "</b> , you have already voted..!!";

		mv.setViewName("final.jsp");
		mv.addObject("message", msg);
		mv.addObject("link", "");
		return mv;
	}

	public static List<Entry<Integer, Integer>> sortByValue(Map<Integer, Integer> hm) {
		// Create a list from elements of HashMap
		List<Map.Entry<Integer, Integer>> list = new LinkedList<Map.Entry<Integer, Integer>>(hm.entrySet());

		// Sort the list using lambda expression
		Collections.sort(list, new Comparator<Map.Entry<Integer, Integer>>() {
			public int compare(Map.Entry<Integer, Integer> o1, Map.Entry<Integer, Integer> o2) {
				return (o2.getValue()).compareTo(o1.getValue());
			}
		});

		return list;
	}

	@RequestMapping("/PollResult")
	public ModelAndView Results() {
		ModelAndView mv = new ModelAndView();

		List<Entry<Integer, Integer>> lst = sortByValue(map);
		String names = "", votes = "";
		for (Map.Entry<Integer, Integer> aa : lst) {
			String tmp = candidates.get(cids.indexOf(aa.getKey().toString()));
			names += tmp + "/";
			votes += aa.getValue() + "/";
		}

		mv.setViewName("Result.jsp");
		mv.addObject("Names", names);
		mv.addObject("Values", votes);
		return mv;
	}

	@RequestMapping("/VoteSummary")
	public ModelAndView Summary() {
		ModelAndView mv = new ModelAndView();
		sortByValue(map);
		List<Entry<Integer, Integer>> lst = sortByValue(map);

		String names = "", votes = "";
		for (Map.Entry<Integer, Integer> aa : lst) {
			String tmp = candidates.get(cids.indexOf(aa.getKey().toString()));
			names += tmp + "/";
			votes += aa.getValue() + "/";
		}
		mv.setViewName("summary.jsp");
		mv.addObject("Names", names);
		mv.addObject("Values", votes);
		return mv;
	}
}

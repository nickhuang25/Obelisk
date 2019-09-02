//
//  DashboardViewController.swift
//  Obelisk
//
//  Created by Nick Huang on 7/23/19.
//  Copyright © 2019 Nick Huang. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController, UIScrollViewDelegate {

    //-------------------------------Variables-------------------------------//
    
    var user_session: Session?
    var welcomeLine: String?
    var slides: [Slide] = []
    var quoteList: [String] = ["Time to stop talking and start doing",
        "Find an opportunity in every difficulty",
        "Don't let yesterday make up too much of today",
        "Remember that failure teaches better than success",
        "Determination will always trump failure",
        "Just knowing is not enough, it's time to apply",
        "Just wishing is not enough, it's time to do",
        "Make your 100 your 70",
        "Overcome any fears with action",
        "Security is just a superstition",
        "Creativity is a form of intelligence",
        "Feed your talent with desire",
        "Do what you can with what you have",
        "Develop an attitude of gratitude",
        "Dream a new dream today",
        "Act confident until it is reality",
        "Get good, get better, be the best today",
        "Goals should never be easy to accomplish",
        "Stay true to yourself today",
        "Do what you love to do today"]
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var motivationLabel: UILabel!
    @IBOutlet weak var workoutButton: UIButton!
    @IBOutlet weak var tasksButton: UIButton!
    @IBOutlet weak var notesButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    
    
    //-------------------------------State Functions-------------------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        setUpWelcome()
        setUpMotivation()
        setUpInterface()
    }

    
    
    //-------------------------------UI Functions-------------------------------//
    
    func setUpWelcome() {
        let name = user_session?.user?.name
        let hour = Calendar.current.component(.hour, from: Date())
        if(hour >= 6 && hour < 12){
            welcomeLabel.text = "Good morning, \(name!)"
        }
        else if(hour >= 12 && hour < 19){
            welcomeLabel.text = "Good afternoon, \(name!)"
        }
        else if(hour >= 19 && hour < 24){
            welcomeLabel.text = "Good evening, \(name!)"
        }
        else{
            welcomeLabel.text = "Welcome back, \(name!)"
        }
    }
    
    func setUpMotivation() {
        let number = Int.random(in: 0 ..< 20)
        motivationLabel.text = quoteList[number]
    }
    
    func createSlides() -> [Slide] {
        let slide1:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide1.topicLabel.text = "Professional"
        slide1.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        slide1.firstButton.setTitle("Career", for: .normal)
        slide1.firstButton.layer.cornerRadius = 50.0
        slide1.firstButton.layer.borderWidth = 3
        slide1.firstButton.layer.borderColor = UIColor.white.cgColor
        slide1.firstButton.addTarget(self, action: #selector(careerAction), for: .touchUpInside)
        slide1.secondButton.setTitle("Projects", for: .normal)
        slide1.secondButton.layer.cornerRadius = 50.0
        slide1.secondButton.layer.borderWidth = 3
        slide1.secondButton.layer.borderColor = UIColor.white.cgColor
        slide1.secondButton.addTarget(self, action: #selector(projectsAction), for: .touchUpInside)
        slide1.thirdButton.setTitle("Resume", for: .normal)
        slide1.thirdButton.layer.cornerRadius = 50.0
        slide1.thirdButton.layer.borderWidth = 3
        slide1.thirdButton.layer.borderColor = UIColor.white.cgColor
        slide1.thirdButton.addTarget(self, action: #selector(resumeAction), for: .touchUpInside)
        slide1.fourthButton.setTitle("Network", for: .normal)
        slide1.fourthButton.layer.cornerRadius = 50.0
        slide1.fourthButton.layer.borderWidth = 3
        slide1.fourthButton.layer.borderColor = UIColor.white.cgColor
        slide1.fourthButton.addTarget(self, action: #selector(networkAction), for: .touchUpInside)
        slide1.fifthButton.setTitle("Ideas", for: .normal)
        slide1.fifthButton.layer.cornerRadius = 50.0
        slide1.fifthButton.layer.borderWidth = 3
        slide1.fifthButton.layer.borderColor = UIColor.white.cgColor
        slide1.fifthButton.addTarget(self, action: #selector(ideasAction), for: .touchUpInside)
        
        let slide2:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide2.topicLabel.text = "Leisure"
        slide2.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        slide2.firstButton.setTitle("FIFA", for: .normal)
        slide2.firstButton.layer.cornerRadius = 50.0
        slide2.firstButton.layer.borderWidth = 3
        slide2.firstButton.layer.borderColor = UIColor.white.cgColor
        slide2.firstButton.addTarget(self, action: #selector(fifaAction), for: .touchUpInside)
        slide2.secondButton.setTitle("TV", for: .normal)
        slide2.secondButton.layer.cornerRadius = 50.0
        slide2.secondButton.layer.borderWidth = 3
        slide2.secondButton.layer.borderColor = UIColor.white.cgColor
        slide2.secondButton.addTarget(self, action: #selector(tvAction), for: .touchUpInside)
        slide2.thirdButton.setTitle("Books", for: .normal)
        slide2.thirdButton.layer.cornerRadius = 50.0
        slide2.thirdButton.layer.borderWidth = 3
        slide2.thirdButton.layer.borderColor = UIColor.white.cgColor
        slide2.thirdButton.addTarget(self, action: #selector(booksAction), for: .touchUpInside)
        slide2.fourthButton.setTitle("Podcasts", for: .normal)
        slide2.fourthButton.layer.cornerRadius = 50.0
        slide2.fourthButton.layer.borderWidth = 3
        slide2.fourthButton.layer.borderColor = UIColor.white.cgColor
        slide2.fourthButton.addTarget(self, action: #selector(podcastsAction), for: .touchUpInside)
        slide2.fifthButton.setTitle("Wishlist", for: .normal)
        slide2.fifthButton.layer.cornerRadius = 50.0
        slide2.fifthButton.layer.borderWidth = 3
        slide2.fifthButton.layer.borderColor = UIColor.white.cgColor
        slide2.fifthButton.addTarget(self, action: #selector(wishlistAction), for: .touchUpInside)
        
        
        let slide3:Slide = Bundle.main.loadNibNamed("Slide", owner: self, options: nil)?.first as! Slide
        slide3.topicLabel.text = "Personal"
        slide3.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        slide3.firstButton.setTitle("Journal", for: .normal)
        slide3.firstButton.layer.cornerRadius = 50.0
        slide3.firstButton.layer.borderWidth = 3
        slide3.firstButton.layer.borderColor = UIColor.white.cgColor
        slide3.firstButton.addTarget(self, action: #selector(journalAction), for: .touchUpInside)
        slide3.secondButton.setTitle("Finances", for: .normal)
        slide3.secondButton.layer.cornerRadius = 50.0
        slide3.secondButton.layer.borderWidth = 3
        slide3.secondButton.layer.borderColor = UIColor.white.cgColor
        slide3.secondButton.addTarget(self, action: #selector(financeAction), for: .touchUpInside)
        slide3.thirdButton.setTitle("Memos", for: .normal)
        slide3.thirdButton.layer.cornerRadius = 50.0
        slide3.thirdButton.layer.borderWidth = 3
        slide3.thirdButton.layer.borderColor = UIColor.white.cgColor
        slide3.thirdButton.addTarget(self, action: #selector(memosAction), for: .touchUpInside)
        slide3.fourthButton.setTitle("Photos", for: .normal)
        slide3.fourthButton.layer.cornerRadius = 50.0
        slide3.fourthButton.layer.borderWidth = 3
        slide3.fourthButton.layer.borderColor = UIColor.white.cgColor
        slide3.fourthButton.addTarget(self, action: #selector(photosAction), for: .touchUpInside)
        slide3.fifthButton.setTitle("Accounts", for: .normal)
        slide3.fifthButton.layer.cornerRadius = 50.0
        slide3.fifthButton.layer.borderWidth = 3
        slide3.fifthButton.layer.borderColor = UIColor.white.cgColor
        slide3.fifthButton.addTarget(self, action: #selector(accountsAction), for: .touchUpInside)
        
        
        return [slide1, slide2, slide3]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func setUpInterface() {
        slides = createSlides()
        scrollView.frame = CGRect(x: 16, y: 314, width: 343, height: 464)
        scrollView.contentSize = CGSize(width: 343 * CGFloat(slides.count), height: 464)
        scrollView.layer.cornerRadius = 20
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.borderWidth = 3
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: 343 * CGFloat(i), y: 0, width: 343, height: 464)
            scrollView.addSubview(slides[i])
        }
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        workoutButton.layer.cornerRadius = 20.0
        workoutButton.layer.borderWidth = 3
        workoutButton.layer.borderColor = UIColor.white.cgColor
        workoutButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        tasksButton.layer.cornerRadius = 20.0
        tasksButton.layer.borderWidth = 3
        tasksButton.layer.borderColor = UIColor.white.cgColor
        tasksButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
        notesButton.layer.cornerRadius = 20.0
        notesButton.layer.borderWidth = 3
        notesButton.layer.borderColor = UIColor.white.cgColor
        notesButton.backgroundColor = UIColor.black.withAlphaComponent(0.2)
    }
    
    
    //-------------------------------Transition Functions-------------------------------//
    
    @IBAction func workoutAction(_ sender: Any) {
        print("Workout")
        performSegue(withIdentifier: "dashboardToWorkout", sender: self)
    }
    
    @IBAction func tasksAction(_ sender: Any) {
        print("Tasks")
    }
    
    @IBAction func notesAction(_ sender: Any) {
        print("Notes")
        performSegue(withIdentifier: "dashboardToNotes", sender: self)
    }
    
    @objc func careerAction(sender: UIButton!) {
        print("Career")
        performSegue(withIdentifier: "dashboardToCareer", sender: self)
    }
    
    @objc func projectsAction(sender: UIButton!) {
        print("Projects")
    }
    
    @objc func resumeAction(sender: UIButton!) {
        print("Resume")
    }
    
    @objc func networkAction(sender: UIButton!) {
        print("Network")
    }
    
    @objc func ideasAction(sender: UIButton!) {
        print("Ideas")
    }
    
    @objc func fifaAction(sender: UIButton!) {
        print("FIFA")
    }
    
    @objc func tvAction(sender: UIButton!) {
        print("TV")
    }
    
    @objc func booksAction(sender: UIButton!) {
        print("Books")
    }
    
    @objc func podcastsAction(sender: UIButton!) {
        print("Podcasts")
    }
    
    @objc func wishlistAction(sender: UIButton!) {
        print("Wishlist")
    }
    
    @objc func journalAction(sender: UIButton!) {
        print("Journal")
    }
    
    @objc func financeAction(sender: UIButton!) {
        print("Finance")
    }
    
    @objc func memosAction(sender: UIButton!) {
        print("Memos")
    }
    
    @objc func photosAction(sender: UIButton!) {
        print("Photos")
    }
    
    @objc func accountsAction(sender: UIButton!) {
        print("Accounts")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dashboardToWorkout" {
            let nextView = segue.destination as! WorkoutViewController
            nextView.user_session = self.user_session
        }
        if segue.identifier == "dashboardToNotes" {
            let nextView = segue.destination as! NotesViewController
            nextView.user_session = self.user_session
        }
        if segue.identifier == "dashboardToCareer" {
            let nextView = segue.destination as! CareerViewController
            nextView.user_session = self.user_session
        }
        
    }
}

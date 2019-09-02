//
//  WorkoutViewController.swift
//  Obelisk
//
//  Created by Nick Huang on 8/7/19.
//  Copyright © 2019 Nick Huang. All rights reserved.
//

import UIKit

class WorkoutViewController: UIViewController, UIScrollViewDelegate{

    //-------------------------------Variables-------------------------------//
    
    var user_session: Session?
    var workouts: [Workout] = []
    var slides: [WorkoutView] = []
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var backButton: UIButton!
    
    
    
    //-------------------------------State Functions-------------------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if(workouts == []) {
            load_workouts()
            saveWorkouts()
        }
        scrollView.delegate = self
        setUpInterface()
        
        
    }
    
    
    
    //-------------------------------UI Functions-------------------------------//
    
    func createWorkouts() -> [WorkoutView] {
        let workout1:WorkoutView = Bundle.main.loadNibNamed("WorkoutView", owner: self, options: nil)?.first as! WorkoutView
        workout1.workoutName.text = workouts[0].name
        workout1.muscleGroups.text = workouts[0].muscles
        workout1.backgroundColor = UIColor.clear
        for index in 1...6 {
            if(workouts[0].exercises?[index-1] != nil){
                switch(index) {
                case 1:
                    workout1.exercise1.text = workouts[0].exercises![index-1]
                case 2:
                    workout1.exercise2.text = workouts[0].exercises![index-1]
                case 3:
                    workout1.exercise3.text = workouts[0].exercises![index-1]
                case 4:
                    workout1.exercise4.text = workouts[0].exercises![index-1]
                case 5:
                    workout1.exercise5.text = workouts[0].exercises![index-1]
                case 6:
                    workout1.exercise6.text = workouts[0].exercises![index-1]
                case 7:
                    workout1.exercise7.text = workouts[0].exercises![index-1]
                case 8:
                    workout1.exercise8.text = workouts[0].exercises![index-1]
                case 9:
                    workout1.exercise9.text = workouts[0].exercises![index-1]
                case 10:
                    workout1.exercise10.text = workouts[0].exercises![index-1]
                default:
                    continue
                }
            }
        }
        
        
        let workout2:WorkoutView = Bundle.main.loadNibNamed("WorkoutView", owner: self, options: nil)?.first as! WorkoutView
        workout2.workoutName.text = workouts[1].name
        workout2.muscleGroups.text = workouts[1].muscles
        workout2.backgroundColor = UIColor.clear
        for index in 1...6 {
            if(workouts[1].exercises?[index-1] != nil){
                switch(index) {
                case 1:
                    workout2.exercise1.text = workouts[1].exercises![index-1]
                case 2:
                    workout2.exercise2.text = workouts[1].exercises![index-1]
                case 3:
                    workout2.exercise3.text = workouts[1].exercises![index-1]
                case 4:
                    workout2.exercise4.text = workouts[1].exercises![index-1]
                case 5:
                    workout2.exercise5.text = workouts[1].exercises![index-1]
                case 6:
                    workout2.exercise6.text = workouts[1].exercises![index-1]
                case 7:
                    workout2.exercise7.text = workouts[1].exercises![index-1]
                case 8:
                    workout2.exercise8.text = workouts[1].exercises![index-1]
                case 9:
                    workout2.exercise9.text = workouts[1].exercises![index-1]
                case 10:
                    workout2.exercise10.text = workouts[1].exercises![index-1]
                default:
                    continue
                }
            }
        }
        
        
        let workout3:WorkoutView = Bundle.main.loadNibNamed("WorkoutView", owner: self, options: nil)?.first as! WorkoutView
        workout3.workoutName.text = workouts[2].name
        workout3.muscleGroups.text = workouts[2].muscles
        workout3.backgroundColor = UIColor.clear
        for index in 1...6 {
            if(workouts[2].exercises?[index-1] != nil){
                switch(index) {
                case 1:
                    workout3.exercise1.text = workouts[2].exercises![index-1]
                case 2:
                    workout3.exercise2.text = workouts[2].exercises![index-1]
                case 3:
                    workout3.exercise3.text = workouts[2].exercises![index-1]
                case 4:
                    workout3.exercise4.text = workouts[2].exercises![index-1]
                case 5:
                    workout3.exercise5.text = workouts[2].exercises![index-1]
                case 6:
                    workout3.exercise6.text = workouts[2].exercises![index-1]
                case 7:
                    workout3.exercise7.text = workouts[2].exercises![index-1]
                case 8:
                    workout3.exercise8.text = workouts[2].exercises![index-1]
                case 9:
                    workout3.exercise9.text = workouts[2].exercises![index-1]
                case 10:
                    workout3.exercise10.text = workouts[2].exercises![index-1]
                default:
                    continue
                }
            }
        }
        
        
        let workout4:WorkoutView = Bundle.main.loadNibNamed("WorkoutView", owner: self, options: nil)?.first as! WorkoutView
        workout4.workoutName.text = workouts[3].name
        workout4.muscleGroups.text = workouts[3].muscles
        workout4.backgroundColor = UIColor.clear
        for index in 1...6 {
            if(workouts[3].exercises?[index-1] != nil){
                switch(index) {
                case 1:
                    workout4.exercise1.text = workouts[3].exercises![index-1]
                case 2:
                    workout4.exercise2.text = workouts[3].exercises![index-1]
                case 3:
                    workout4.exercise3.text = workouts[3].exercises![index-1]
                case 4:
                    workout4.exercise4.text = workouts[3].exercises![index-1]
                case 5:
                    workout4.exercise5.text = workouts[3].exercises![index-1]
                case 6:
                    workout4.exercise6.text = workouts[3].exercises![index-1]
                case 7:
                    workout4.exercise7.text = workouts[3].exercises![index-1]
                case 8:
                    workout4.exercise8.text = workouts[3].exercises![index-1]
                case 9:
                    workout4.exercise9.text = workouts[3].exercises![index-1]
                case 10:
                    workout4.exercise10.text = workouts[3].exercises![index-1]
                default:
                    continue
                }
            }
        }
        
        
        return [workout1, workout2, workout3, workout4]
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x/view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
    
    func setUpInterface() {
        slides = createWorkouts()
        scrollView.frame = CGRect(x: 19, y: 168, width: 337, height: 600)
        scrollView.contentSize = CGSize(width: 337 * CGFloat(slides.count), height: 600)
        scrollView.layer.cornerRadius = 20
        scrollView.layer.borderColor = UIColor.white.cgColor
        scrollView.layer.borderWidth = 1
        scrollView.isPagingEnabled = true
        
        for i in 0 ..< slides.count {
            slides[i].frame = CGRect(x: 337 * CGFloat(i), y: 0, width: 343, height: 600)
            scrollView.addSubview(slides[i])
        }
        
        pageControl.numberOfPages = slides.count
        pageControl.currentPage = 0
        view.bringSubviewToFront(pageControl)
        
        backButton.layer.cornerRadius = 20.0
        backButton.layer.borderWidth = 1.0
        backButton.layer.borderColor = UIColor.white.cgColor
    }
    
    
    //-------------------------------Data Functions-------------------------------//
    
    func load_workouts() {
        let ctl_gym = Workout(name_in: "Full Equipment Day 1", muscles_in: "Chest | Triceps | Legs",  exercises_in: [
            "Bench Press 5x5 ------ 155 (185)",
            "Squats 5x5 ----------------- 155",
            "Chest Flys 12-10-8 --------- 160",
            "Tricep Ext. 12-10-8 ---------- 60",
            "Tricep DB 12-10-8 ----------- 60",
            "Tricep Press 12-10-8 ------- 180"])
        let bsb_gym = Workout(name_in: "Full Equipment Day 2", muscles_in: "Bicep | Shoulders | Back", exercises_in: [
            "Pull-Ups 3x5 ---------------- 200",
            "Military Press 3x5 ------------ 95",
            "Deadlift 3x5 ----------------- 115",
            "Shoulder Press 12-10-8 ----- 140",
            "Bicep DB Curls 4x15 --------- 30",
            "Bicep DB Curls 4x5 ---------- 35"])
        let ctl_pf = Workout(name_in: "PF Day 1", muscles_in: "Chest | Triceps | Legs", exercises_in: [
            "Smith Bench Press 5x5 ------ 165",
            "Smith Squats 5x5 ----------- 165",
            "Chest Flys 12-10-8 --------- 180",
            "Tricep Ext. 12-10-8 ---------- 60",
            "Tricep DB 12-10-8 ----------- 60",
            "Tricep Press 12-10-8 ------- 175"])
        let bsb_pf = Workout(name_in: "PF Day 2", muscles_in: "Biceps | Back | Shoulders", exercises_in: [
            "Pull-Ups 3x5 ---------------- 200",
            "Pull-Downs 12-10-8 --------- 130",
            "Shoulder Flys 12-10-8 ------- 100",
            "Shoulder Press 12-10-8 ----- 100",
            "Bicep DB Curls 4x15 --------- 30",
            "Bicep DB Curls 4x5 ---------- 35"])
        workouts.append(ctl_gym)
        workouts.append(bsb_gym)
        workouts.append(ctl_pf)
        workouts.append(bsb_pf)
    }
    
    private func saveWorkouts() {
        let isSuccessfulSave = NSKeyedArchiver.archiveRootObject(workouts, toFile: Workout.ArchiveURL.path)
        if isSuccessfulSave {
            print("Workouts successfully saved.")
        } else {
            print("Failed to save workouts...")
        }
    }
    
    private func loadWorkouts() -> [Workout]?  {
        return NSKeyedUnarchiver.unarchiveObject(withFile: Workout.ArchiveURL.path) as? [Workout]
    }

    
    //-------------------------------Transition Functions-------------------------------//
    
    @IBAction func backToDashboard(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

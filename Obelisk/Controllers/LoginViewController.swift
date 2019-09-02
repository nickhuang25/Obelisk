//
//  LoginViewController.swift
//  Obelisk
//
//  Created by Nick Huang on 7/17/19.
//  Copyright © 2019 Nick Huang. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    //-------------------------------Variables-------------------------------//
    
    var user_session = Session()
    var userList: [User] = []
    var enteredToken: String = ""
    
    @IBOutlet weak var buttonOne: UIButton!
    @IBOutlet weak var buttonTwo: UIButton!
    @IBOutlet weak var buttonThree: UIButton!
    @IBOutlet weak var buttonFour: UIButton!
    @IBOutlet weak var buttonFive: UIButton!
    @IBOutlet weak var buttonSix: UIButton!
    @IBOutlet weak var buttonSeven: UIButton!
    @IBOutlet weak var buttonEight: UIButton!
    @IBOutlet weak var buttonNine: UIButton!
    @IBOutlet weak var buttonZero: UIButton!
    
    
    
    
    //-------------------------------State Functions-------------------------------//
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpInterface()
        load_users()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextView = segue.destination as! DashboardViewController
        nextView.user_session = self.user_session
    }
    
    @IBAction func onePressed(_ sender: Any) {
        enteredToken += "1"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func twoPressed(_ sender: Any) {
        enteredToken += "2"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func threePressed(_ sender: Any) {
        enteredToken += "3"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func fourPressed(_ sender: Any) {
        enteredToken += "4"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func fivePressed(_ sender: Any) {
        enteredToken += "5"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func sixPressed(_ sender: Any) {
        enteredToken += "6"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func sevenPressed(_ sender: Any) {
        enteredToken += "7"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func eightPressed(_ sender: Any) {
        enteredToken += "8"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func ninePressed(_ sender: Any) {
        enteredToken += "9"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    @IBAction func zeroPressed(_ sender: Any) {
        enteredToken += "0"
        if(enteredToken.count == 6) {
            if(check_users()){
                login_user()
            }
            else {
                enteredToken = ""
            }
        }
    }
    
    //-------------------------------UI Functions-------------------------------//
    
    func setUpInterface() {
        buttonOne.layer.cornerRadius = 45
        buttonTwo.layer.cornerRadius = 45
        buttonThree.layer.cornerRadius = 45
        buttonFour.layer.cornerRadius = 45
        buttonFive.layer.cornerRadius = 45
        buttonSix.layer.cornerRadius = 45
        buttonSeven.layer.cornerRadius = 45
        buttonEight.layer.cornerRadius = 45
        buttonNine.layer.cornerRadius = 45
        buttonZero.layer.cornerRadius = 45
        buttonOne.layer.borderWidth = 2
        buttonTwo.layer.borderWidth = 2
        buttonThree.layer.borderWidth = 2
        buttonFour.layer.borderWidth = 2
        buttonFive.layer.borderWidth = 2
        buttonSix.layer.borderWidth = 2
        buttonSeven.layer.borderWidth = 2
        buttonEight.layer.borderWidth = 2
        buttonNine.layer.borderWidth = 2
        buttonZero.layer.borderWidth = 2
        buttonOne.layer.borderColor = UIColor.cyan.cgColor
        buttonTwo.layer.borderColor = UIColor.cyan.cgColor
        buttonThree.layer.borderColor = UIColor.cyan.cgColor
        buttonFour.layer.borderColor = UIColor.cyan.cgColor
        buttonFive.layer.borderColor = UIColor.cyan.cgColor
        buttonSix.layer.borderColor = UIColor.cyan.cgColor
        buttonSeven.layer.borderColor = UIColor.cyan.cgColor
        buttonEight.layer.borderColor = UIColor.cyan.cgColor
        buttonNine.layer.borderColor = UIColor.cyan.cgColor
        buttonZero.layer.borderColor = UIColor.cyan.cgColor
    }
    
    
    //-------------------------------Data Functions-------------------------------//
    
    func load_users() {
        let nick = User(name_in: "Nick", password_in: "279085");
        let henry = User(name_in: "Henry", password_in: "156489")
        userList.append(nick)
        userList.append(henry)
    }
    
    func check_users() -> Bool{
        for tempUser in userList{
            if(tempUser.password == enteredToken){
                user_session.user = tempUser
                return true
            }
        }
        return false
    }
    

    //-------------------------------Transition Functions-------------------------------//
    
    func login_user() {
        performSegue(withIdentifier: "loginToDashboard", sender: self)
    }
    
    
}


//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Anirudh Nagesh on 1/4/16.
//  Copyright (c) 2016 Proteus Digital Health. All rights reserved.
//

import Foundation
import UIKit

class LoginViewController : UIViewController {
    
    @IBOutlet weak var loginTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var themeBar: UIToolbar!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        let theme = ThemeManager.currentTheme()
//        ThemeManager.applyTheme(theme)
//        applyThemeToUIElements()
    }
    
    @IBAction func login(sender: AnyObject) {
        
        //self.view.backgroundColor = ThemeManager.currentTheme().mainColor
        UIApplication.sharedApplication().windows[0].tintColor = ThemeManager.currentTheme().mainColor
    }
    
    @IBAction func applyTheme1(sender : AnyObject) {
        
        ThemeManager.applyTheme(Theme.Default)
        applyThemeToUIElements()
        
    }
    
    @IBAction func applyTheme2(sender : AnyObject) {
        
        ThemeManager.applyTheme(Theme.Dark)
        applyThemeToUIElements()
        
    }
    
    @IBAction func applyTheme3(sender : AnyObject) {
        
        ThemeManager.applyTheme(Theme.Graphical)
        applyThemeToUIElements()
        
    }
    
    // helper function to apply theme to all ui elements
    func applyThemeToUIElements(){
        
        loginTextField.layer.cornerRadius = 8.0
        loginTextField.layer.masksToBounds = true
        loginTextField.layer.borderColor = ThemeManager.currentTheme().mainColor.CGColor
        loginTextField.layer.borderWidth = 2.0
        
        
        passwordTextField.layer.cornerRadius = 8.0
        passwordTextField.layer.masksToBounds = true
        passwordTextField.layer.borderColor = ThemeManager.currentTheme().mainColor.CGColor
        passwordTextField.layer.borderWidth = 2.0
        
        loginButton.layer.cornerRadius = 8.0
        loginButton.layer.masksToBounds = true
        loginButton.layer.borderColor = ThemeManager.currentTheme().mainColor.CGColor
        loginButton.layer.borderWidth = 2.0
        
        navigationController?.navigationBar.barTintColor = ThemeManager.currentTheme().mainColor
        themeBar.barTintColor = ThemeManager.currentTheme().mainColor
        
    }
}

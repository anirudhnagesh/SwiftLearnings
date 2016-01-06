//
//  Theme.swift
//  LoginApp
//
//  Created by Anirudh Nagesh on 1/4/16.
//  Copyright (c) 2016 Proteus Digital Health. All rights reserved.
//

import UIKit

let SelectedThemeKey = "Graphical"

enum Theme:Int {
    case Default = 0, Dark, Graphical
    
    var mainColor: UIColor {
        switch self {
        case .Default:
            return UIColor(red: 87.0/255.0, green: 188.0/255.0, blue: 95.0/255.0, alpha: 1.0)
        case .Dark:
            return UIColor(red: 242.0/255.0, green: 101.0/255.0, blue: 34.0/255.0, alpha: 1.0)
        case .Graphical:
            return UIColor(red: 10.0/255.0, green: 10.0/255.0, blue: 10.0/255.0, alpha: 1.0)
        }
    }
    
    var barStyle: UIBarStyle {
        switch self {
        case .Default, .Graphical:
            return .Default
        case .Dark:
            return .Black
        }
    }
}

struct ThemeManager {
    static func currentTheme() -> Theme {
        if let storedTheme = NSUserDefaults.standardUserDefaults().valueForKey(SelectedThemeKey)?.integerValue {
            print(storedTheme)
            return Theme(rawValue: storedTheme)!
        } else {
            return .Default
        }
    }
    
    static func applyTheme(theme: Theme) {
        
        NSUserDefaults.standardUserDefaults().setValue(theme.rawValue, forKey: SelectedThemeKey)
        NSUserDefaults.standardUserDefaults().synchronize()
        
    }
    
}

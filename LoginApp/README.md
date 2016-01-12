# Sample Theming App with a Login Screen

## This app demonstrates two approaches to theme a swift application.

### 1. Using globally available theme struct with colors
### 2. Using a third party open source library called NUI

## 1. Using globally available struct

Theme.swift is the main file which has a globally available theme with three colors Default, Dark and Graphical
Theme Manager is a struct which has two static helper functions which can be called from anywhere within the app. The manager persists the theme in NSUserDefaults so that the app is themed/colored when its killed and launched again.

LoginViewController.swift is the main controller of the app which has references of all the UI elements from the story board. The mainstoryboard has three buttons namely theme1, theme2 and theme 3 in the bottom tab bar which are used to demonstrate the apply of different themes.


## 2. Using NUI through cocoapods installation process.
Reference : https://github.com/tombenner/nui

Instructions to install a library using cocoapods can be found at http://www.raywenderlich.com/97014/use-cocoapods-with-swift

The themes for all the UI elements are defined in a file format called .nss. The application has two such files namely Blue.NUI.nss and Googolplex.NUI.nss

AppDelegate.swift has a method call to NUI (NUISettings.initWithStylesheet("SkyBlue.NUI")) to apply the styles for all the UI elements. NUI has lot more exposed function calls to apply styles and can be found in the NUI documentation. 
//
//  LoginViewController.swift
//  HR
//
//  Created by Arunkumar G on 08/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

enum TranslateField: String {
    case login = "LOGIN"
    case username = "USER NAME"
    case password = "PASSWORD"
    case rememberMe = "REMEMBER ME"
    case selectLanguage = "SELECT LANGUAGE"
}

class LoginViewController: BaseViewController, UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    //MARK: - IBOutlet
    @IBOutlet weak var loginScrollView: UIScrollView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var rememberMeImageView: UIImageView!
    @IBOutlet weak var selectedLanguage: UILabel!
    @IBOutlet weak var usernameTitleLabel: UILabel!
    @IBOutlet weak var passwordTitleLabel: UILabel!
    @IBOutlet weak var remembermeTitleLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var selectLanguageButton: UIButton!
    
    @IBOutlet weak var langPickerView: UIPickerView!
    @IBOutlet weak var pickerBottomConstraint: NSLayoutConstraint!
    //MARK: - Identifiers
    let loginViewModel = LoginViewModel()
    var rememberMe: Bool?
    var selectedLanguageCode: String = ""
    
    // Create UserDefaults
    let defaults = UserDefaults.standard
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        rememberMe = false
        
        // Get the Login credential from UserDefaults
        if let username = defaults.string(forKey: "LoginUsername") {
            print("defaults saved user: \(username)")
        }
        
         self.pickerBottomConstraint.constant = -212
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tap)
    }
    
    //Calls this function when the tap is recognized.
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        self.view.endEditing(true)
    }
    
    /// Intantiates ViewController from StoryBoard
    ///
    /// - Returns: LoginViewController instance
    class func instantiateFromStoryboard() -> LoginViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! LoginViewController
    }
    
    //MARK: - IBAction
    @IBAction func login(_ sender: Any) {
        if usernameTextField.text == "" {
            self.showAlert(title: "Alert", message: "Please enter username", actionTitles: ["OK"], actions: [nil])
        } else if passwordTextField.text == "" {
            self.showAlert(title: "Alert", message: "Please enter password", actionTitles: ["OK"], actions: [nil])
        } else {
            if rememberMe! {
                // Save Login credential to UserDefaults
                // Using defaults.set(value: Any?, forKey: String)
                defaults.set(usernameTextField.text, forKey: "LoginUsername")
                defaults.set(passwordTextField.text, forKey: "LoginPassword")
            } else {
                defaults.set("", forKey: "LoginUsername")
                defaults.set("", forKey: "LoginPassword")
            }
            
            self.showLoadingIndicator()
            let loginRequestModel = LoginRequestModel(restHeader: RestHeaderModel(), input: LoginInputModel(requestId: Utilities.getDeviceID(), deviceType: "iOS", deviceModel: Utilities.getDeviceFullModel(), deviceToken: Utilities.getDeviceID(), username: "sysadmin", password: "sysadmin", lang: "US"))
            loginViewModel.validateLogin(requestModel: loginRequestModel, successHandler: { (status, message) in
                self.hideLoadingIndicator()
                if status {
                    let homeViewController = HomeViewController.instantiateFromStoryboard()
                    self.navigationController?.pushViewController(homeViewController, animated: true)
                } else {
                    self.showAlert(title: "", message: message ?? "", actionTitles: ["OK"], actions: [nil])
                }
            }, failureHandler: { (status, error) in
                self.hideLoadingIndicator()
                if !status {
                    self.showAlert(title: "", message: error ?? "", actionTitles: ["OK"], actions: [nil])
                }
            })
        }
    }
    
    @IBAction func rememberMe(_ sender: Any) {
        if rememberMeImageView.image == UIImage.init(named: "remembercheck") {
            rememberMe = false
            rememberMeImageView.image = UIImage.init(named: "rememberuncheck")
        } else {
            rememberMe = true
            rememberMeImageView.image = UIImage.init(named: "remembercheck")
        }
    }
    
    @IBAction func selectLanguage(_ sender: Any) {
        self.view.endEditing(true)
        self.pickerBottomConstraint.constant = 0
    }
    
    @IBAction func pickerDone(_ sender: Any) {
        self.pickerBottomConstraint.constant = -212
        self.configLanguage()
    }
    
    //MARK: - Set Language
    func configLanguage() {
        for item in DataManager.sharedInstance.translateItems ?? [] {
            if item.code == selectedLanguageCode {
                switch item.meaning {
                case TranslateField.login.rawValue:
                    loginButton.titleLabel?.text = item.lang
                    break
                case TranslateField.username.rawValue:
                    usernameTitleLabel.text = item.lang
                    break
                case TranslateField.password.rawValue:
                    passwordTitleLabel.text = item.lang
                    break
                case TranslateField.rememberMe.rawValue:
                    remembermeTitleLabel.text = item.lang
                    break
                case TranslateField.selectLanguage.rawValue:
                    selectLanguageButton.titleLabel?.text = item.lang
                    break
                default:
                    break
                }
            }
        }
    }
    
    //MARK: - UITextFieldDelegate
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.pickerDone(UIButton())
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == usernameTextField {
            passwordTextField.becomeFirstResponder()
            return false
        } else if textField == passwordTextField {
            self.login(UIButton())
            return false
        } else {
            return true
        }
    }
    
    //MARK: - UIPickerViewDelegate
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return DataManager.sharedInstance.languageItems?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return DataManager.sharedInstance.languageItems?[row].language
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedLanguageCode = DataManager.sharedInstance.languageItems?[row].code ?? ""
        selectedLanguage.text = DataManager.sharedInstance.languageItems?[row].language ?? ""
    }
}

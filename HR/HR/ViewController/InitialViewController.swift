//
//  InitialViewController.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

enum RetryServiceType {
    case updateDate
    case language
    case translate
    case message
}

class InitialViewController: BaseViewController {
    
    //MARK: - Identifiers
    var initialViewModel = InitialViewModel()
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.fetchLastUpdateDate()
    }
    
    /// Intantiates ViewController from StoryBoard
    ///
    /// - Returns: InitialViewController instance
    class func instantiateFromStoryboard() -> InitialViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! InitialViewController
    }
    
    //MARK: - Web Service Call
    func fetchLastUpdateDate() {
        self.showLoadingIndicator()
        let updateDateRequestModel = UpdateDateRequestModel(restHeader: RestHeaderModel(), input: UpdateDateInputModel(requestId: Utilities.getDeviceID(), subject: "TEST"))
        initialViewModel.getUpdateDate(requestModel: updateDateRequestModel, successHandler: { (status, message) in
            if status {
                DataManager.sharedInstance.lastUpdateDate = self.initialViewModel.updateDateResponseModel.output?.date
                self.fetchSystemLanguages()
            } else {
                self.hideLoadingIndicator()
                self.showRetryAlert(service: .updateDate)
            }
        }, failureHandler: { (status, error) in
            self.hideLoadingIndicator()
            if !status {
                self.showRetryAlert(service: .updateDate)
            }
        })
    }
    
    func fetchSystemLanguages() {
        let languageRequestModel = LanguageRequestModel(restHeader: RestHeaderModel(), input: LanguageInputModel(requestId: Utilities.getDeviceID()))
        initialViewModel.getLanguages(requestModel: languageRequestModel, successHandler: { (status, message) in
            if status {
                DataManager.sharedInstance.languageItems = self.initialViewModel.languageResponseModel.output?.languageTable?.languageTableItem
                self.fetchSystemTranslate()
            } else {
                self.hideLoadingIndicator()
                self.showRetryAlert(service: .language)
            }
        }, failureHandler: { (status, error) in
            self.hideLoadingIndicator()
            if !status {
                self.showRetryAlert(service: .language)
            }
        })
    }
    
    func fetchSystemTranslate() {
        let translateRequestModel = TranslateRequestModel(restHeader: RestHeaderModel(), input: TranslateInputModel(requestId: Utilities.getDeviceID()))
        initialViewModel.getTranslate(requestModel: translateRequestModel, successHandler: { (status, message) in
            if status {
                DataManager.sharedInstance.translateItems = self.initialViewModel.translateResponseModel.output?.translateTable?.translateTableItem
                self.fetchSystemMessage()
            } else {
                self.hideLoadingIndicator()
                self.showRetryAlert(service: .translate)
            }
        }, failureHandler: { (status, error) in
            self.hideLoadingIndicator()
            if !status {
                self.showRetryAlert(service: .translate)
            }
        })
    }
    
    func fetchSystemMessage() {
        let messageRequestModel = MessageRequestModel(restHeader: RestHeaderModel(), input: MessageInputModel(requestId: Utilities.getDeviceID()))
        initialViewModel.getMessage(requestModel: messageRequestModel, successHandler: { (status, message) in
            self.hideLoadingIndicator()
            if status {
                DataManager.sharedInstance.messageItems = self.initialViewModel.messageResponseModel.output?.messageTable?.messageTableItem
                let loginViewController = LoginViewController.instantiateFromStoryboard()
                self.navigationController?.pushViewController(loginViewController, animated: true)
            } else {
                self.showRetryAlert(service: .message)
            }
        }, failureHandler: { (status, error) in
            self.hideLoadingIndicator()
            if !status {
                self.showRetryAlert(service: .message)
            }
        })
    }
    
    //MARK: - Alert
    func showRetryAlert(service: RetryServiceType) {
        
        // Create the alert controller
        let alertController = UIAlertController(title: "", message: "Failed to fetch initial configuration", preferredStyle: .alert)
        
        // Create the actions
        var cancelAction = UIAlertAction(title: "OK", style: .default) {
        UIAlertAction in
            
        }
        
        switch service {
        case .updateDate:
            cancelAction = UIAlertAction(title: "Retry", style: .cancel) {
                UIAlertAction in
                self.fetchLastUpdateDate()
            }
            break
        case .language:
            cancelAction = UIAlertAction(title: "Retry", style: .cancel) {
                UIAlertAction in
                self.showLoadingIndicator()
                self.fetchSystemLanguages()
            }
            break
        case .translate:
            cancelAction = UIAlertAction(title: "Retry", style: .cancel) {
                UIAlertAction in
                self.showLoadingIndicator()
                self.fetchSystemTranslate()
            }
            break
        case .message:
            cancelAction = UIAlertAction(title: "Retry", style: .cancel) {
                UIAlertAction in
                self.showLoadingIndicator()
                self.fetchSystemMessage()
            }
            break
        }
        
        // Add the actions
        alertController.addAction(cancelAction)
        
        // Present the controller
        self.present(alertController, animated: true, completion: nil)
    }
}

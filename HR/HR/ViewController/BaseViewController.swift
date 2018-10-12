//
//  BaseViewController.swift
//  HR
//
//  Created by Arunkumar G on 10/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    /// instance for NotificationCenter
    var observer: AnyObject?
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []
        
        // setUp LoadingIndicator
        setUpLoadingIndicator()
    }
    
    /// Called when the parent application receives a memory warning. On iOS 6.0 it will no longer clear the view by default.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /// Called when the view is about to made visible. Default does nothing
    ///
    /// - Parameter animated: animation property
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /// Called when the view has been fully transitioned onto the screen. Default does nothing
    ///
    /// - Parameter animated: animation property
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    /// Deinit method for NotificationCenter --- remove observer from self
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    func showAlert(title: String?, message: String?, actionTitles: [String?], actions: [((UIAlertAction) -> Void)?]) {
        
        if let currentAlert = self.presentedViewController as? UIAlertController {
            currentAlert.dismissAlert(viewController: self, animated: true)
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let action = UIAlertAction(title: title, style: .default, handler: actions[index])
            alert.addAction(action)
        }
        DispatchQueue.main.async {
            alert.dismissPresentedAlert()
            alert.showAlert(animated: true)
        }
    }
    
    /// Instance for LoadingIndicatorView
    var loadingIndicatorView: LoadingIndicatorView!
    
    /// Set up the LoadingIndicatorView
    func setUpLoadingIndicator() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        loadingIndicatorView = LoadingIndicatorView()
        loadingIndicatorView.isOpaque = false
        loadingIndicatorView.loadingIndicatorType = LoadingIndicatorType.activityIndicator
        loadingIndicatorView.frame = self.view.bounds
        loadingIndicatorView.center = self.view.center
    }
    
    /// Show LoadingIndicator
    func showLoadingIndicator() {
        UIApplication.shared.keyWindow?.addSubview(loadingIndicatorView)
        loadingIndicatorView.show()
    }
    
    /// Hide LoadingIndicator
    func hideLoadingIndicator() {
        loadingIndicatorView.hide()
        loadingIndicatorView.removeFromSuperview()
    }
    
    /// Show LoadingIndicator
    func showLoadingIndicatorOnVC(vc: UIViewController) {
        vc.view.addSubview(loadingIndicatorView)
        loadingIndicatorView.show()
    }
    
    // MARK: KeyBoard Hide/Show
    /**
     Triggers when Keyboard is visible and scroll the view if the focussed textfield is not visible
     
     - parameter scrollView: UIScrollView object
     - parameter block: NSNotification object
     */
    func registerForKeyboardDidShowNotification(scrollView: UIScrollView, usingBlock block: ((NSNotification) -> Void)? = nil) {
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil, using: { (notification) -> Void in
            let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            scrollView.contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: keyboardSize.height, right: scrollView.contentInset.right)
            block?(notification as NSNotification)
        })
        
    }
    
    // MARK: KeyBoard Hide/Show
    /**
    ///  Triggers when Keyboard hides down and reset scroll view content inset
    
    - parameter scrollView: UIScrollView object
    - parameter block: NSNotification object
    */
    func registerForKeyboardWillHideNotification(scrollView: UIScrollView, usingBlock block: ((NSNotification) -> Void)? = nil) {
        /// NotificationCenter addObserver method
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification) -> Void in
            scrollView.contentInset = UIEdgeInsets(top: scrollView.contentInset.top, left: scrollView.contentInset.left, bottom: 0, right: scrollView.contentInset.right)
            block?(notification as NSNotification)
        })
    }
    
    
    // MARK: KeyBoard Hide/Show
    /**
     Triggers when Keyboard is visible and scroll the view if the focussed TableView is not visible
     
     - parameter scrollView: UIScrollView object
     - parameter block: NSNotification object
     */
    func registerForKeyboardDidShowNotificationForTableView(tableView: UITableView, usingBlock block: ((NSNotification) -> Void)? = nil) {
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardDidShow, object: nil, queue: nil, using: { (notification) -> Void in
            let keyboardSize = (notification.userInfo![UIKeyboardFrameEndUserInfoKey] as AnyObject).cgRectValue.size
            let contentInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height + 5, right: 0)
            tableView.contentInset = contentInsets
            tableView.scrollIndicatorInsets = contentInsets
            block?(notification as NSNotification)
        })
    }
    
    /// Triggers when Keyboard is hide and scroll the view if the focussed TableView is not visible
    ///
    /// - Parameters:
    ///   - tableView: tableView object
    ///   - block: NSNotification object
    func registerForKeyboardWillHideNotificationForTableView(tableView: UITableView, usingBlock block: ((NSNotification) -> Void)? = nil) {
        observer = NotificationCenter.default.addObserver(forName: NSNotification.Name.UIKeyboardWillHide, object: nil, queue: nil, using: { (notification) -> Void in
            tableView.contentInset = UIEdgeInsets.zero
            tableView.scrollIndicatorInsets = UIEdgeInsets.zero
            block?(notification as NSNotification)
        })
    }
    
    func setShadowView(view : UIView) {
        view.layer.shadowOffset = CGSize(width: 0, height: 3)
        view.layer.shadowOpacity = 0.6
        view.layer.shadowRadius = 3.0
        view.layer.shadowColor = UIColor.lightGray.cgColor
    }
}

extension UIAlertController {
    
    /// show alert
    ///
    /// - Parameter animated: Bool type, isAnimated parameter
    func showAlert(animated: Bool) {
        let topViewController = self.getVisibleViewController(UIApplication.shared.keyWindow?.rootViewController)
        topViewController?.present(self, animated: animated, completion: nil)
    }
    
    /// show alert on top of the window
    ///
    /// - Parameters:
    ///   - animated: Bool value
    ///   - completion: for a return type
    func showAlertOnWindow(animated: Bool, completion: @escaping (() -> Swift.Void)) {
        let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        window.rootViewController = vc
        window.windowLevel = UIWindowLevelAlert + 1
        window.makeKeyAndVisible()
        window.rootViewController?.present(self, animated: animated, completion: completion)
    }
    
    /// dismiss alert
    ///
    /// - Parameters:
    ///   - viewController: on a viewcontroller instance
    ///   - animated: Bool value
    func dismissAlert(viewController: UIViewController, animated: Bool) {
        viewController.dismiss(animated: animated, completion: nil)
    }
    
    /// Dissmiss alert on top of the viewcontroller
    func dismissPresentedAlert() {
        let topViewController = self.getVisibleViewController(UIApplication.shared.keyWindow?.rootViewController)
        if let currentAlert = topViewController?.presentedViewController as? UIAlertController {
            currentAlert.dismissAlert(viewController: (topViewController?.presentedViewController)!, animated: true)
        }
    }
    
    /// Find the visible view controller
    ///
    /// - Parameter rootViewController: root view controller
    /// - Returns: UIViewController type
    func getVisibleViewController(_ rootViewController: UIViewController?) -> UIViewController? {
        var rootVC = rootViewController
        if rootVC == nil {
            rootVC = UIApplication.shared.keyWindow?.rootViewController
        }
        if rootVC?.presentedViewController == nil {
            return rootVC
        }
        if let presented = rootVC?.presentedViewController {
            if presented.isKind(of: UINavigationController.self) {
                let navigationController = presented as! UINavigationController
                return navigationController.viewControllers.last!
            }
            if presented.isKind(of: UITabBarController.self) {
                let tabBarController = presented as! UITabBarController
                return tabBarController.selectedViewController!
            }
            if presented.isKind(of: UIAlertController.self) {
                let alertController = presented as! UIAlertController
                return alertController
            }
            
            return getVisibleViewController(presented)
        }
        return nil
    }
}

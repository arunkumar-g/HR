//
//  HomeViewController.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

private enum HomeTile: Int {
    case workList = 0
    case businessTrip
    case employeeInfo
    case assignment
    case vacation
    case payslip
}

class HomeViewController: BaseViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    //MARK: - IBOutlet
    @IBOutlet weak var profileBgView: UIView!
    @IBOutlet weak var profilePictureBgView: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var designationLabel: UILabel!
    @IBOutlet weak var leaveBgView: UIView!
    @IBOutlet weak var sickCountLabel: UILabel!
    @IBOutlet weak var casualCountLabel: UILabel!
    @IBOutlet weak var leaveCountLabel: UILabel!
    @IBOutlet weak var sickLabel: UILabel!
    @IBOutlet weak var casualLabel: UILabel!
    @IBOutlet weak var leaveLabel: UILabel!
    @IBOutlet weak var collectionBgView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    //MARK: - Identifiers
    let loginViewModel = LoginViewModel()
    
    //MARK: - ViewController Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(UINib.init(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
    }
    
    /// Intantiates ViewController from StoryBoard
    ///
    /// - Returns: HomeViewController instance
    class func instantiateFromStoryboard() -> HomeViewController {
        let storyboard = UIStoryboard(name: Constants.Storyboard.main, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! HomeViewController
    }
    
    //MARK: - IBAction
    @IBAction func setting(_ sender: Any) {
        
    }
    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 90.0, height: 120.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if (Utilities.getScreenType() == .iPhones_4_4S || Utilities.getScreenType() == .iPhones_5_5s_5c_SE || Utilities.getScreenType() == .iPhones_6_6s_7_8 || Utilities.getScreenType() == .iPhone_XR || Utilities.getScreenType() == .iPhones_X_XS) {
            return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        } else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if (Utilities.getScreenType() == .iPhones_4_4S || Utilities.getScreenType() == .iPhones_5_5s_5c_SE) {
            return 5.0
        } else if (Utilities.getScreenType() == .iPhones_6_6s_7_8 || Utilities.getScreenType() == .iPhone_XR || Utilities.getScreenType() == .iPhones_X_XS) {
            return 30.0
        } else {
            return 50.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if (Utilities.getScreenType() == .iPhones_4_4S || Utilities.getScreenType() == .iPhones_5_5s_5c_SE) {
            return 5.0
        } else if (Utilities.getScreenType() == .iPhones_6_6s_7_8 || Utilities.getScreenType() == .iPhone_XR || Utilities.getScreenType() == .iPhones_X_XS) {
            return 30.0
        } else {
            return 5.0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        
        switch indexPath.item {
        case HomeTile.workList.rawValue:
            cell.configure(image: UIImage.init(named: "worklist")!, name: "Work List", showNotification: false, count: "")
            break
            
        case HomeTile.employeeInfo.rawValue:
            cell.configure(image: UIImage.init(named: "empinfo")!, name: "Employee Info", showNotification: false, count: "")
            break
            
        case HomeTile.vacation.rawValue:
            cell.configure(image: UIImage.init(named: "vacation")!, name: "Vacation", showNotification: false, count: "")
            break
            
        case HomeTile.businessTrip.rawValue:
            cell.configure(image: UIImage.init(named: "businesstrip")!, name: "Business Trip", showNotification: false, count: "")
            break
            
        case HomeTile.assignment.rawValue:
            cell.configure(image: UIImage.init(named: "assignment")!, name: "Assignment", showNotification: true, count: "5")
            break
            
        case HomeTile.payslip.rawValue:
            cell.configure(image: UIImage.init(named: "payslip")!, name: "Payslip", showNotification: false, count: "")
            break
            
        default:
            cell.configure(image: UIImage.init(named: "payslip")!, name: "Payslip", showNotification: false, count: "")
            break
        }
        
        return cell
    }
    
    //MARK: - UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case HomeTile.workList.rawValue:
            self.showAlert(title: "", message: "Work List", actionTitles: ["OK"], actions: [nil])
            break
            
        case HomeTile.employeeInfo.rawValue:
            self.showAlert(title: "", message: "Employee Info", actionTitles: ["OK"], actions: [nil])
            break
            
        case HomeTile.vacation.rawValue:
            self.showAlert(title: "", message: "Vacation", actionTitles: ["OK"], actions: [nil])
            break
            
        case HomeTile.businessTrip.rawValue:
            self.showAlert(title: "", message: "Business Trip", actionTitles: ["OK"], actions: [nil])
            break
            
        case HomeTile.assignment.rawValue:
            self.showAlert(title: "", message: "Assignment", actionTitles: ["OK"], actions: [nil])
            break
            
        case HomeTile.payslip.rawValue:
            self.showAlert(title: "", message: "Payslip", actionTitles: ["OK"], actions: [nil])
            break
            
        default:
            break
        }
    }
}

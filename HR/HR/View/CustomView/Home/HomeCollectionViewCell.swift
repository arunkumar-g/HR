//
//  HomeCollectionViewCell.swift
//  HR
//
//  Created by Arunkumar G on 11/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit
import QuartzCore

class HomeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - IBOutlet
    @IBOutlet weak var tileImageView: UIImageView!
    @IBOutlet weak var tileNameLabel: UILabel!
    @IBOutlet weak var notificationCountLabel: UILabel!
    @IBOutlet weak var notificationBgView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    //MARK: - Configure
    public func configure(image: UIImage, name: String, showNotification: Bool, count: String) {
        self.tileImageView.image = image
        self.tileNameLabel.text = name
        if showNotification {
            self.notificationBgView.isHidden = false
            self.notificationCountLabel.text = count
        } else {
            self.notificationBgView.isHidden = true
            self.notificationCountLabel.text = ""
        }
    }
}

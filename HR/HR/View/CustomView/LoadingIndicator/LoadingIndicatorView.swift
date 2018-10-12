//
//  LoadingIndicatorView.swift
//  HR
//
//  Created by Arunkumar G on 08/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

public enum LoadingIndicatorType {
    case activityIndicator
    case loadingImageIndicator
}

public class LoadingIndicatorView: UIView {
    
    @IBOutlet weak var activityIndicatorBackGroundView: UIView!
    
    @IBOutlet weak var loadingImageContainerView: UIView!
    @IBOutlet weak var loadingImageView: UIImageView!
    
    @IBOutlet weak var activityIndicatorContainerView: UIView!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBOutlet weak var titleContainerView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var mesageContainerView: UIView!
    @IBOutlet weak var messageLabel: UILabel!
    
    var loadingIndicatorType: LoadingIndicatorType?
    
    var messageLabelText: String? {
        get {
            return messageLabel.text
        }
        set(text) {
            messageLabel.text = text
        }
    }
    
    var titleLabelText: String? {
        get {
            return titleLabel.text
        }
        set(text) {
            titleLabel.text = text
        }
    }
    
    // MARK: - Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupLoadingTypeView()
        setupLoadingImageIndicatorView()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //        setupView()
        //        setupLoadingTypeView()
        //        setupLoadingImageIndicatorView()
    }
    
    // MARK: - Private Helper Methods
    
    // Performs the initial setup.
    private func setupView() {
        let view = viewFromNibForClass()
        view.frame = bounds
        
        // Auto-layout stuff.
        view.autoresizingMask = [
            UIViewAutoresizing.flexibleWidth,
            UIViewAutoresizing.flexibleHeight
        ]
        
        // Show the view.
        addSubview(view)
    }
    
    // Loads a XIB file into a view and returns this view.
    private func viewFromNibForClass() -> UIView {
        
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    private func setupLoadingTypeView() {
        
        self.activityIndicatorView.stopAnimating()
        self.loadingImageView.stopAnimating()
        
        self.activityIndicatorContainerView.isHidden = false
        self.loadingImageContainerView.isHidden = false
    }
    
    
    public func setupLoadingImageIndicatorView() {
        
        self.isUserInteractionEnabled = true
        self.clipsToBounds = true
        
        self.loadingImageView.contentMode = .scaleAspectFit
        self.loadingImageView.animationImages = [
            //            UIImage(named: "loaderImage1", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage2", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage3", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage4", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage5", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage6", in: nil, compatibleWith: nil)!,
            //            UIImage(named: "loaderImage7", in: nil, compatibleWith: nil)!
        ]
        self.loadingImageView.animationDuration = 2.0
    }
    
    public func show() {
        
        if loadingIndicatorType == LoadingIndicatorType.activityIndicator {
            self.loadingImageContainerView.isHidden = true
        } else if loadingIndicatorType == LoadingIndicatorType.loadingImageIndicator {
            self.activityIndicatorContainerView.isHidden = true
        }
        
        UIView.animate(withDuration: 0.3, animations: {
        }) { (_) in
            if self.loadingIndicatorType == LoadingIndicatorType.activityIndicator {
                self.activityIndicatorView.startAnimating()
            } else if self.loadingIndicatorType == LoadingIndicatorType.loadingImageIndicator {
                self.loadingImageView.startAnimating()
            }
        }
    }
    
    public func hide() {
        UIView.animate(withDuration: 0.3, animations: {
        }) { (_) in
            if self.loadingIndicatorType == LoadingIndicatorType.activityIndicator {
                self.activityIndicatorView.stopAnimating()
                //                self.activityIndicatorView.removeFromSuperview()
            } else if self.loadingIndicatorType == LoadingIndicatorType.loadingImageIndicator {
                self.loadingImageView.stopAnimating()
                //                self.activityIndicatorView.removeFromSuperview()
            }
        }
    }
}

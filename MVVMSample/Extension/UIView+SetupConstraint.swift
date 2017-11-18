//
//  UIView+SetupConstraint.swift
//  MVVMSample
//
//  Created by 桐山圭祐 on 2017/11/18.
//  Copyright © 2017年 桐山圭祐. All rights reserved.
//

import UIKit

extension UIView {
    
    func setupConstraints(view: UIView) {
        let topConstraint = NSLayoutConstraint(item: view, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0)
        let bottomConstraint = NSLayoutConstraint(item: view, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0)
        let leftConstraint = NSLayoutConstraint(item: view, attribute: .left, relatedBy: .equal, toItem: self, attribute: .left, multiplier: 1.0, constant: 0.0)
        let rightConstraint = NSLayoutConstraint(item: view, attribute: .right, relatedBy: .equal, toItem: self, attribute: .right, multiplier: 1.0, constant: 0.0)
        let constraints = [topConstraint, bottomConstraint, leftConstraint, rightConstraint]
        view.translatesAutoresizingMaskIntoConstraints = false
        addConstraints(constraints)
        
    }
    
}

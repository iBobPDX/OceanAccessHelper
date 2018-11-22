//
//  UIView+Blur.swift
//  OceanAccessHelper
//
//  Created by Robert Corlett on 11/21/18.
//  Copyright © 2018 Robert Corlett. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func addBlur(style: UIBlurEffect.Style) {
        addBlur(at: self.subviews.count, style: style)
    }
    
    func addBlur(at index:Int, style: UIBlurEffect.Style) {
        let blur = UIVisualEffectView(effect: UIBlurEffect(style: .regular))
        blur.isUserInteractionEnabled = false
        blur.layer.masksToBounds = true
        blur.layer.cornerRadius = self.layer.cornerRadius
        blur.translatesAutoresizingMaskIntoConstraints = false
        self.insertSubview(blur, at: index)
        self.addConstraints([
            blur.heightAnchor.constraint(equalTo: self.heightAnchor),
            blur.widthAnchor.constraint(equalTo: self.widthAnchor),
            blur.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            blur.centerYAnchor.constraint(equalTo: self.centerYAnchor)
            ])
    }
}

//
//  RoundedUIImageView.swift
//  NetworkingExample
//
//  Created by Miguel on 5/19/23.
//

import UIKit

class RoundedImageView: UIImageView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = frame.height / cornerRadius
        clipsToBounds = true
    }
}

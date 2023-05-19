//
//  UIImageView+loadImageFromString.swift
//  NetworkingExample
//
//  Created by Miguel on 5/18/23.
//

import UIKit

extension UIImageView {
    
    func loadImage(from url: String) -> UIImage {
        
        let image = UIImage()
        
        if let url = URL(string: url) {
            
            let task = URLSession.shared
            
            task.dataTask(with: url) { data, _, error in
                
                if case .some(_) = error {
                    return
                }
                
                guard let imageData = data,
                      let fetchedImage = UIImage(data: imageData) else { return }
                self.image = fetchedImage
                
            }
        }
        
        return image
    }
}

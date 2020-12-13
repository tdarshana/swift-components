//
//  Interest.swift
//  CarouselEffect
//
//  Created by Tharindu Darshana on 12/12/20.
//

import UIKit

class Interest{
    // MARK - Public API
    var title = ""
    var featuredImage: UIImage
    var color: UIColor
    
    init(title: String, featuredImage: UIImage, color: UIColor) {
        self.title = title
        self.featuredImage = featuredImage
        self.color = color
    }
    
    // MARK - Private
    // Dummy data
    
    static func fetchInterests()-> [Interest]{
        return [
            Interest(
                title: "Travelling Around The World",
                featuredImage: UIImage(named: "f1")!,
                color: UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)
            ),
            Interest(
                title: "Cafe with best friends",
                featuredImage: UIImage(named: "f2")!,
                color: UIColor(red:240/255.0, green: 133/255.0, blue: 91/255.0, alpha: 0.8)
            ),
            Interest(
                title: "Study Programming",
                featuredImage: UIImage(named: "f3")!,
                color: UIColor(red:105/255.0, green: 80/255.0, blue: 227/255.0, alpha: 0.8)
            ),
            Interest(
                title: "Stay safe and healthy",
                featuredImage: UIImage(named: "f4")!,
                color: UIColor(red:102/255.0, green: 102/255.0, blue: 102/255.0, alpha: 0.8)
            ),
            Interest(
                title: "Build amaizing iOS apps",
                featuredImage: UIImage(named: "f5")!,
                color: UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)
            ),Interest(
                title: "Learn new things",
                featuredImage: UIImage(named: "f6")!,
                color: UIColor(red:63/255.0, green: 71/255.0, blue: 80/255.0, alpha: 0.8)
            ),
        ]
    }
}

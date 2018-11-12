//
//  GradientLayer.swift
//  HTCHHKR
//
//  Created by Adam Rikardsen-Smith on 12/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation
import UIKit

class GradientLayer: UIView{
    
    let gradient = CAGradientLayer()
    
    override func awakeFromNib() {
        setUpGradientView()
    }
    
    func setUpGradientView(){
        gradient.frame = self.bounds
        gradient.colors = [UIColor.white.cgColor, UIColor.init(white: 1.0, alpha: 0.0).cgColor]
        
        gradient.startPoint = CGPoint.zero
        gradient.endPoint = CGPoint(x: 0, y: 1)
        gradient.locations = [0.8, 1.0]
        self.layer.addSublayer(gradient)
    }
    
}

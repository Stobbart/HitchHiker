//
//  RoundedImageView.swift
//  HTCHHKR
//
//  Created by Adam Rikardsen-Smith on 12/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import Foundation
import UIKit

class RoundedImageView: UIImageView{
    
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView(){
        clipsToBounds = true
        layer.cornerRadius = frame.width / 2
    }
    
}

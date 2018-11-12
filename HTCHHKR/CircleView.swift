//
//  CircleView.swift
//  HTCHHKR
//
//  Created by Adam Rikardsen-Smith on 12/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    override func awakeFromNib() {
        setUpView()
    }

    @IBInspectable var borderColor: UIColor?{
        didSet{
            setUpView()
        }
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.width / 2
        self.layer.borderWidth = 1.5
        self.layer.borderColor = borderColor?.cgColor
    }

}

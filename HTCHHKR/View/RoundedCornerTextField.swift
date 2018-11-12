//
//  RoundedCornerTextField.swift
//  HTCHHKR
//
//  Created by Adam Rikardsen-Smith on 12/11/2018.
//  Copyright © 2018 Adam Rikardsen-Smith. All rights reserved.
//

import UIKit

class RoundedCornerTextField: UITextField {

    let textRectOffSet: CGFloat = 20
    
    override func awakeFromNib() {
        setUpView()
    }
    
    func setUpView(){
        self.layer.cornerRadius = self.frame.height / 2
        
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffSet, y: 0,  width: self.frame.width - textRectOffSet, height: self.frame.height)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 0 + textRectOffSet, y: 0 , width: self.frame.width - textRectOffSet, height: self.frame.height)
    }

}

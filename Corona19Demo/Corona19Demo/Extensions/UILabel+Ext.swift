//
//  UILabel+Ext.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/10.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

extension UILabel {
    
    func setLineSpacing(lineSpacing: CGFloat = 0.0, lineHeightMultiple: CGFloat = 0.0) {

           guard let labelText = self.text else { return }

           let paragraphStyle = NSMutableParagraphStyle()
           paragraphStyle.lineSpacing = lineSpacing
           paragraphStyle.lineHeightMultiple = lineHeightMultiple

           let attributedString:NSMutableAttributedString
           if let labelattributedText = self.attributedText {
               attributedString = NSMutableAttributedString(attributedString: labelattributedText)
           } else {
               attributedString = NSMutableAttributedString(string: labelText)
           }

           // (Swift 4.2 and above) Line spacing attribute
           attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))


           // (Swift 4.1 and 4.0) Line spacing attribute
        attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))

           self.attributedText = attributedString
       }
}

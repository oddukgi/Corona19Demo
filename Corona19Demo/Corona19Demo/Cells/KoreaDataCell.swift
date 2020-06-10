//
//  KoreaDataCell.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class KoreaDataCell: UICollectionViewCell {
      static let reuseIdentifier = "KoreaDataCell"

      let infoLabel = CR19TitleLabel(textAlignment: .left, fontSize: 14)
      
      override init(frame: CGRect) {
          super.init(frame: frame)
          configure()
          
      }
      
      required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
    
     func configure() {
          addSubview(infoLabel)
          infoLabel.translatesAutoresizingMaskIntoConstraints = false
          infoLabel.adjustsFontForContentSizeCategory = true
          let inset = CGFloat(10)
          NSLayoutConstraint.activate([
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
          ])
          infoLabel.font = UIFont.preferredFont(forTextStyle: .title2)
          let darkblue = UIColor(red: 0.0392, green: 0.2078, blue: 0.8118, alpha: 1.0) /* #0a35cf */
          infoLabel.textColor = darkblue
      }
    
     func set(model: SimpleCoronaModel) {
         
         infoLabel.text = "대한민국 \n 확진자: \(model.totalCase),완치자: \(model.recovered), 사망자: \(model.death)"
       let darkBrown = UIColor(red: 0.3765, green: 0.2667, blue: 0.0549, alpha: 1.0) /* #60440e */
       infoLabel.changeFontColor(clr: darkBrown)
     }
     
    
}

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

    let infoLabel = CR19TitleLabel(textAlignment: .left, fontSize: 20)
      
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
          let inset = CGFloat(15)
          NSLayoutConstraint.activate([
            infoLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            infoLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            infoLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            infoLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
         
          ])
          infoLabel.textColor = UIColor.systemBlue
      }
    
     func set(model: SimpleCoronaModel) {
         
       infoLabel.text = "대한민국 \n 확진자: \(model.totalCase), 완치자: \(model.recovered), 사망자: \(model.death)"
     
     }
     
    
}


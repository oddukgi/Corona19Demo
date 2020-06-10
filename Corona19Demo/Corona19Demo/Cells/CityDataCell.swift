//
//  CityDataCell.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class CityDataCell: UICollectionViewCell {
    
    static let reuseIdentifier = "CityDataCell"
    
    let citynameLabel = CR19TitleLabel(textAlignment: .left, fontSize: 15)
    let detailLabel = CR19BodyLabel(textAlignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    func set(model: SimpleCoronaModel) {
        
        citynameLabel.text = model.countryName
        detailLabel.text = """
                            확진자수: \(model.totalCase),\n
                            완치자수: \(model.recovered),사망자: \(model.death),\n
                            발생률: \(model.percentage),해외유입: \(model.newFcase),\n
                            지역발생: \(model.newCcase)
                           """
    
    }
    
    private func configure() {
        addSubview(citynameLabel)
        addSubview(detailLabel)
        
        let padding: CGFloat = 5
        
        // set layout: citynameLabel, detailLabel
        NSLayoutConstraint.activate([
            
            // cityNameLabel
            citynameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            citynameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            citynameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
           // citynameLabel.heightAnchor.constraint(equalToConstant: 75),
            // detailLabel
            detailLabel.topAnchor.constraint(equalTo: citynameLabel.bottomAnchor, constant: 8),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            //detailLabel.heightAnchor.constraint(equalToConstant: 145)
        
        ])
    }
    
}
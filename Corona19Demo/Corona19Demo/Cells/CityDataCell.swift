//
//  CityCoronaCell.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class CityCoronaCell: UICollectionViewCell {
    
    static let reuseID = "CityCoronaCell"
    
    let citynameLabel = CR19Label(textAlignment: .left, fontSize: 15, fontWeight: .semibold)
    let detailLabel = CR19Label(textAlignment: .left, fontSize: 12, fontWeight: .regular)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }

    func update(coronaModel: CoronaCityModel) {
        
        citynameLabel.text = coronaModel.countryName
        detailLabel.text = """
                            확진자수: \(coronaModel.totalCase),
                            완치자수: \(coronaModel.recovered),
                            사망자: \(coronaModel.death),
                            발생률: \(coronaModel.percentage),
                            해외유입: \(coronaModel.newFcase),
                            지역발생: \(coronaModel.newCcase)
                           """
        
        
    }
    
    private func configure() {
        addSubview(citynameLabel)
        addSubview(detailLabel)
        
        let padding: CGFloat = 8
        
        // set layout: citynameLabel, detailLabel
        NSLayoutConstraint.activate([
            
            // cityNameLabel
            citynameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            citynameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            citynameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            citynameLabel.heightAnchor.constraint(equalToConstant: 75),
            
            // detailLabel
            detailLabel.topAnchor.constraint(equalTo: citynameLabel.bottomAnchor, constant: padding),
            detailLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            detailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            detailLabel.heightAnchor.constraint(equalToConstant: 145)
        
        ])
    }
    
}

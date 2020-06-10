//
//  CR19Button.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class CR19Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(backgroundClr: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundClr
        self.setTitle(title, for: .normal)
        configure()
    }
    private func configure() {
        layer.cornerRadius = 10
        
        setTitleColor(.white, for: .normal)
        titleLabel?.textColor = .white
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        // use autolayout
        translatesAutoresizingMaskIntoConstraints = false
    }

}

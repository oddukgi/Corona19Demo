//
//  CR19EmptyStateView.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/23.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit

class CR19EmptyStateView: UIView {

    let messageLabel  = CR19TitleLabel(textAlignment: .center, fontSize: 28)
    let logoImageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
      super.init(frame: .zero)
      configure()
    }
      
    private func configure() {
      addSubview(messageLabel)
      addSubview(logoImageView)
      
      messageLabel.numberOfLines  = 3
      messageLabel.textColor      = .secondaryLabel
      
      logoImageView.image         = UIImage(named: "EmptyData")
      logoImageView.translatesAutoresizingMaskIntoConstraints = false
      
      NSLayoutConstraint.activate([
          messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150),
          messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
          messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
          messageLabel.heightAnchor.constraint(equalToConstant: 80),
          
          logoImageView.widthAnchor.constraint(equalToConstant: 100),
          logoImageView.heightAnchor.constraint(equalToConstant: 100),
          logoImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
          logoImageView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 90)
      ])
    }
    
    func updateMessage(message: String) {
        messageLabel.text = message
    }

}

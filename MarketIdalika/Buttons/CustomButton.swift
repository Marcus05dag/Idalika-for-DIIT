//
//  CustomButton.swift
//  MarketIdalika
//
//  Created by Дмитрий Папушин on 28.07.2020.
//  Copyright © 2020 Дмитрий Папушин. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    init(backgroundColor: UIColor, title: String) {
        super.init(frame: .zero)
        self.backgroundColor = backgroundColor
        self.setTitle(title, for: .normal)
        configure()
    }
    
    func configure() {
        layer.cornerRadius = 0
        setTitleColor(.white, for: .normal)
        titleLabel?.font = UIFont(name: "SFProDisplay-Bold", size: 14)
        contentHorizontalAlignment = .left
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

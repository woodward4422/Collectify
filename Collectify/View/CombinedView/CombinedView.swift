//
//  CombinedView.swift
//  Collectify
//
//  Created by Noah Woodward on 5/4/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit
import FunctionalTableData

public class CombinedView<View1: UIView, View2: UIView>: UIView {
    public let view1 = View1()
    public let view2 = View2()
    public let stackView: UIStackView
    
    public override init(frame: CGRect) {
        stackView = UIStackView(frame: frame)
        super.init(frame: frame)
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        self.backgroundColor = UIColor.shopGreen
        self.clipsToBounds = true
        self.layer.cornerRadius = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: bottomAnchor)
        ])
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

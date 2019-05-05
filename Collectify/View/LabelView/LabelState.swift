//
//  LabelState.swift
//  Collectify
//
//  Created by Noah Woodward on 5/4/19.
//  Copyright © 2019 Noah Woodward. All rights reserved.
//

import Foundation
import UIKit
import FunctionalTableData

public typealias LabelCell = HostCell<UILabel,LabelState,LayoutMarginsTableItemLayout>

public struct LabelState: Equatable {
    let title: String
    let color: UIColor
    let alignment: NSTextAlignment
    
    public init(title: String, color: UIColor, alignment: NSTextAlignment) {
        self.title = title
        self.color = color
        self.alignment = alignment
    }
    
    public static func ==(lhs: LabelState, rhs: LabelState) -> Bool {
        return lhs.color == rhs.color && lhs.title == rhs.title && lhs.alignment == rhs.alignment
    }
    
    public static func updateView(_ view: UILabel, state: LabelState?) {
        guard let state = state else {
            return
        }
        view.lineBreakMode = .byWordWrapping
        view.numberOfLines = 0
        view.text = state.title
        view.textColor = state.color
        view.textAlignment = state.alignment
    }
}

//
//  UIElementsBuilder.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit

class UIElementsBuilder {
	func setViewToMultiplier(view: UIView, topMultiplier: Float, superView: UIView) {
		
		view.heightAnchor.constraint(equalTo: superView.heightAnchor, multiplier: CGFloat(topMultiplier)).isActive = true
		
	}
}

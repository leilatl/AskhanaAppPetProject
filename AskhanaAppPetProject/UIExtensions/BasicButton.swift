//
//  BasicButton.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit

class BasicButton: UIButton {
	
	init(title: String, color: UIColor = UIColor(named: "Green")!, width: Int = 250) {
		super.init(frame: .zero)
		backgroundColor = color
		setTitleColor(.white, for: .normal)
		setTitle(title, for: .normal)
		layer.cornerRadius = 10
		translatesAutoresizingMaskIntoConstraints = false
		heightAnchor.constraint(equalToConstant: 40).isActive = true
		widthAnchor.constraint(equalToConstant: CGFloat(width)).isActive = true
		
		
		
	}
	 
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

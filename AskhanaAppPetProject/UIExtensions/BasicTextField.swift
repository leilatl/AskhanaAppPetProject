//
//  BasicTextField.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit
class BasicTextField: UITextField {
	
	init(placeholder: String) {
		super.init(frame: .zero)
		
		layer.borderWidth = 1.0
		layer.borderColor = UIColor(named: "Yellow")?.cgColor
		backgroundColor = .white
		self.placeholder = placeholder
		textAlignment = .left
		leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
		leftViewMode = .always
		widthAnchor.constraint(equalToConstant: 250).isActive = true
		heightAnchor.constraint(equalToConstant: 40).isActive = true
		layer.cornerRadius = 10
		
	}
	 
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

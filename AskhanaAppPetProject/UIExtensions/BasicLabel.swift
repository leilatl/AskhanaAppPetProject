//
//  BasicLabel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit

class BasicLabel: UILabel {
	
	init(text: String, color: UIColor = .black) {
		super.init(frame: .zero)
		self.text = text
		textColor = color
		textAlignment = .center
		backgroundColor = .clear
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

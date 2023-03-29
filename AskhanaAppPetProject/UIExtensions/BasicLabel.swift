//
//  BasicLabel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit

class BasicLabel: UILabel {
	
	init(text: String,
		 color: UIColor = .black,
		 size: CGFloat = 15,
		 weight: UIFont.Weight = .medium) {
		super.init(frame: .zero)
		self.text = text
		textColor = color
		textAlignment = .center
		backgroundColor = .clear
		font = UIFont.systemFont(ofSize: size, weight: weight)
		numberOfLines = 0
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

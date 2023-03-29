//
//  RoundButton.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 27.03.2023.
//

import Foundation
import UIKit

class RoundButton: UIButton {
	
	init(title: String) {
		super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
		layer.cornerRadius = 15 // half the width/height to make it round
		layer.borderWidth = 1.0
		layer.borderColor = UIColor(named: "Yellow")?.cgColor
		setTitle(title, for: .normal)
		titleLabel?.font = UIFont.systemFont(ofSize: 15, weight: .medium)
		setTitleColor(UIColor(named: "Yellow"), for: .normal)
	}
	 
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

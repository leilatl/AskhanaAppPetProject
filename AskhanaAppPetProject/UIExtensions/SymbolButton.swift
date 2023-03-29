//
//  SymbolButton.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 27.03.2023.
//

import Foundation
import UIKit

class SymbolButton: UIButton {
	
	init(symbolSystemName: String) {
		super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
		layer.cornerRadius = 5
		backgroundColor = UIColor(named: "Yellow")
		setImage(UIImage(systemName: "cart"), for: .normal)
		tintColor = .white
		
	}
	 
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

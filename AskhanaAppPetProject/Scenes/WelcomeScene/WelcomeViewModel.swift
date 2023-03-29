//
//  WelcomeViewModel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
class WelcomeViewModel {
	weak var viewController: WelcomeViewController?
	
	func buttonTapped() {
		let loginVC = LogInViewController()
		loginVC.modalPresentationStyle = .fullScreen
		viewController?.present(loginVC, animated: true, completion: nil)
	}
}

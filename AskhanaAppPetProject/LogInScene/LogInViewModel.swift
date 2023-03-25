//
//  LogInViewModel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
class LogInViewModel {
	weak var viewController: LogInViewController?
	
	func registerButtonTapped() {
		let registerVC = RegisterViewController()
		registerVC.modalPresentationStyle = .fullScreen
		viewController?.present(registerVC, animated: true, completion: nil)
	}
	
	func logInButtonTapped() {
		print("edit logInButtonTapped() in LogInViewModel")
	}
}

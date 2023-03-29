//
//  RegisterViewModel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 26.03.2023.
//

import Foundation
class RegisterViewModel {
	weak var viewController: RegisterViewController?
	
	func registerButtonTapped() {
		viewController?.dismiss(animated: true)
	}
}

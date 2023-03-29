//
//  LogInViewController.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import Foundation
import UIKit

class LogInViewController: UIViewController {
	
	// MARK: - Dependencies
	private var viewModel: LogInViewModel!
	let elementsBuilder = UIElementsBuilder()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// Creating elements
		let topView = setUpTopView()
		
		let centerView = setUpCenterView()
		
		let bottomView = setUpBottomView()
		
		// Creating main stack view
		let stackView = UIStackView(arrangedSubviews:
										[topView, centerView, bottomView])
		
		elementsBuilder.setViewToMultiplier(view: topView, topMultiplier: 0.2, superView: stackView)
		elementsBuilder.setViewToMultiplier(view: bottomView, topMultiplier: 0.2, superView: stackView)
		
		setUpStackView(stackView: stackView)
		
		setUpViewModel()
	}
	
	private func setUpViewModel() {
		viewModel = LogInViewModel()
		viewModel.viewController = self
	}
	
	private func setUpStackView(stackView: UIStackView) {
		stackView.distribution = .equalCentering
		stackView.axis = .vertical
		stackView.backgroundColor = .white
		stackView.alignment = .center
		view.addSubview(stackView)
		stackView.fillSuperview()
	}
	
	private func setUpTopView() -> UIStackView {
		let stackView = UIStackView()
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .fill
		
		
		let imageView = UIImageView(image: UIImage(named: "top"))
		imageView.contentMode = .scaleAspectFit
		
		let label = BasicLabel(text: "Authorization", color: .black)
		
		imageView.addSubview(label)
		label.translatesAutoresizingMaskIntoConstraints = false
		label.centerXAnchor.constraint(equalTo: imageView.centerXAnchor).isActive = true
		label.centerYAnchor.constraint(equalTo: imageView.centerYAnchor).isActive = true
		
		stackView.addArrangedSubview(imageView)
		
		return stackView
	}
	
	private func setUpCenterView() -> UIStackView {
		let emailTextView = BasicTextField(placeholder: "Email")

		let passwordTextView = BasicTextField(placeholder: "Password")

		let loginBtn = BasicButton(title: "Log In")

		let stackView = UIStackView(arrangedSubviews: [emailTextView, passwordTextView, loginBtn])
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .equalCentering
		stackView.setCustomSpacing(20, after: emailTextView)

		loginBtn.addTarget(viewModel, action: #selector(loginButtonTapped), for: .touchUpInside)
		
		return stackView
	}
	
	
	
	private func setUpBottomView() -> UIStackView {
		let registrationLabel = BasicLabel(text: "If you are a new user", color: UIColor(named: "Yellow") ?? .yellow)
		
		let registerBtn = BasicButton(title: "Register")
		
		let fillerView = UIView()
		fillerView.backgroundColor = .white
		
		let stackView = UIStackView(arrangedSubviews:
										[registrationLabel, registerBtn, fillerView])
		elementsBuilder.setViewToMultiplier(view: fillerView, topMultiplier: 0.4, superView: stackView)
		
		stackView.axis = .vertical
		stackView.alignment = .center
		stackView.distribution = .equalSpacing
		
		registerBtn.addTarget(viewModel, action: #selector(registerButtonTapped), for: .touchUpInside)
		
		
		return stackView
	}
	
	@objc func registerButtonTapped() {
		viewModel.registerButtonTapped()
	}
	
	@objc func loginButtonTapped() {
		viewModel.logInButtonTapped()
	}
}




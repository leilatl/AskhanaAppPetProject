//
//  WelcomeViewController.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 25.03.2023.
//

import UIKit

/// the very first scene in the app. it shows the welcome message and a button
class WelcomeViewController: UIViewController {
	
	// MARK: - Dependencies
	private var viewModel: WelcomeViewModel!
	private var elementsBuilder: UIElementsBuilder!

	// MARK: - Lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		elementsBuilder = UIElementsBuilder()
		
		// creating ui elements
		
		let topImageView = UIImageView(image: #imageLiteral(resourceName: "top"))

		let bottomImageView = UIImageView(image: #imageLiteral(resourceName: "LaunchScreen1"))

		let centerView = setUpCenterView()

		// creating main stack view
		let stackView = UIStackView(arrangedSubviews:
									[topImageView, centerView, bottomImageView])
		setUpStackView(stackView: stackView)
		
		elementsBuilder.setViewToMultiplier(view: topImageView, topMultiplier: 0.15, superView: stackView)
		elementsBuilder.setViewToMultiplier(view: bottomImageView, topMultiplier: 0.3, superView: stackView)
		
		// creating view model
		setUpViewModel()
	}
	
	// MARK: - Private methods
	
	private func setUpStackView(stackView: UIStackView) {
		stackView.distribution = .fill
		stackView.axis = .vertical
		view.addSubview(stackView)
		stackView.fillSuperview()
	}
	
	private func setUpViewModel() {
		viewModel = WelcomeViewModel()
		viewModel.viewController = self
	}
	
	private func setUpCenterView() -> UIStackView {
		let topfillerView = UIView()
		topfillerView.backgroundColor = .white
		
		let welcomeImage = UIImageView(image: #imageLiteral(resourceName: "Welcome"))
		welcomeImage.contentMode = .scaleAspectFit
		
		let beginBtn = BasicButton(title: "Begin", color: UIColor(named: "Yellow")!, width: 100)
		
		let fillerView = UIView()
		fillerView.backgroundColor = .white
		
		
		
		let centerView = UIStackView(arrangedSubviews: [topfillerView,welcomeImage, beginBtn, fillerView])
		centerView.backgroundColor = .white
		centerView.axis = .vertical
		centerView.alignment = .center
		
		topfillerView.heightAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 0.35).isActive = true
		fillerView.heightAnchor.constraint(equalTo: centerView.heightAnchor, multiplier: 0.3).isActive = true
		
		beginBtn.addTarget(viewModel, action: #selector(buttonTapped), for: .touchUpInside)
		
		
		return centerView
	}
	@objc func buttonTapped() {
		viewModel.buttonTapped()
	}
}


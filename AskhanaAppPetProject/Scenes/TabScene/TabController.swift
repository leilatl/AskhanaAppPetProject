//
//  TabController.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 26.03.2023.
//

import UIKit

class TabViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let tabBarController = MyTabBarController()
		self.addChild(tabBarController)
		self.view.addSubview(tabBarController.view)
		tabBarController.didMove(toParent: self)
		
		//UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.gray], for: .normal)
	}
	
}

class MyTabBarController: UITabBarController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let firstVC = MenuViewController()
		let secondVC = SecondViewController()
		let thirdVC = ThirdViewController()
		
		firstVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "house"), selectedImage: nil)
		
		secondVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "archivebox"), selectedImage: nil)
		
		thirdVC.tabBarItem = UITabBarItem(title: "", image: UIImage(systemName: "person.crop.circle"), selectedImage: nil)
		
		UITabBar.appearance().tintColor = UIColor(named: "Green")

		
		
		self.viewControllers = [firstVC, secondVC, thirdVC]
	}
}

class SecondViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
	}
}

class ThirdViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.backgroundColor = .white
	}
}

//
//  MenuViewController.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 26.03.2023.
//

import Foundation
import UIKit
class MenuViewController: UIViewController {
	
	let tableView = UITableView()
	let networkingService = MenuNetworkService()
	var categoriesCollectionView: UICollectionView!
	let searchFieldContainerView = UIView()
	let searchTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 300, height: 30))
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		setUpSearchTextField(searchTextField, container: searchFieldContainerView)
		setUpCollectionView()
		setTableView(tableView)
	}
	
	private func setUpSearchTextField(_ textField: UITextField, container: UIView) {
		
		container.backgroundColor = UIColor(named: "LightYellow")
		container.layer.cornerRadius = 10
		
		textField.translatesAutoresizingMaskIntoConstraints = false
		container.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(container)
		container.addSubview(textField)
		
		textField.borderStyle = .roundedRect
		textField.backgroundColor = UIColor.clear
		textField.borderStyle = .none
		textField.textColor = UIColor(named: "Yellow")
		textField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "Yellow")!])
		
		NSLayoutConstraint.activate([
			container.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
			container.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
			container.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
			container.heightAnchor.constraint(equalToConstant: 40),
			
			textField.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 10),
			textField.trailingAnchor.constraint(equalTo: container.trailingAnchor,constant: -10),
			textField.centerYAnchor.constraint(equalTo: container.centerYAnchor)
			
		])
	}
	
	private func setTableView(_ tableView: UITableView) {
		tableView.translatesAutoresizingMaskIntoConstraints = false
		view.addSubview(tableView)
		NSLayoutConstraint.activate([
			tableView.topAnchor.constraint(equalTo: categoriesCollectionView.bottomAnchor),
			tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
		])
		
		tableView.dataSource = self
		tableView.delegate = self
		
		tableView.register(MenuTableViewCell.self, forCellReuseIdentifier: "MyCell")
	}
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return networkingService.getMenuItems(for: networkingService.currentCategoryTitle).count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let menuItems = networkingService.getMenuItems(for: networkingService.currentCategoryTitle)
		
		let cell = tableView.dequeueReusableCell(withIdentifier: "MyCell", for: indexPath) as! MenuTableViewCell
		
		cell.itemTitlelabel.text = menuItems[indexPath.row].title
		cell.decriptionLabel.text = menuItems[indexPath.row].description
		cell.priceLabel.text = menuItems[indexPath.row].price
		
		cell.plusButton.addTarget(self, action: #selector(plusButtonTapped(_:)), for: .touchUpInside)
		cell.minusButton.addTarget(self, action: #selector(minusButtonTapped(_:)), for: .touchUpInside)
		
		cell.count = 0
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 100
	}
	
	// MARK: - Table View Delegate
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
	// MARK: - Button Action
	
	@objc func minusButtonTapped(_ sender: UIButton) {
		// Handle button tap event here
		guard let cell = sender.superview?.superview as? MenuTableViewCell
		else {
			return
		}
		
		if cell.count == 0 {
			
		}else{
			cell.count  -= 1
			cell.countLabel.text = String(cell.count)
		}
		
	}
	
	@objc func plusButtonTapped(_ sender: UIButton) {
		// Handle button tap event here
		guard let cell = sender.superview?.superview as? MenuTableViewCell
		else {
			return
		}
		
		cell.count  += 1
		cell.countLabel.text = String(cell.count)
	}
}

extension MenuViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	
	private func setUpCollectionView() {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		categoriesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		categoriesCollectionView.delegate = self
		categoriesCollectionView.dataSource = self
		categoriesCollectionView.backgroundColor = .white
		categoriesCollectionView.translatesAutoresizingMaskIntoConstraints = false
		
		// register the custom cell
		categoriesCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCollectionViewCell")
		
		// add the collection view to the view controller's view
		view.addSubview(categoriesCollectionView)
		
		// set up collection view constraints
		NSLayoutConstraint.activate([
			categoriesCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			categoriesCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			categoriesCollectionView.topAnchor.constraint(equalTo: searchFieldContainerView.bottomAnchor, constant: 10),
			categoriesCollectionView.heightAnchor.constraint(equalToConstant: 40)
		])
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return networkingService.getCategoryItems().count // number of items in the collection view
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
		
		// configure the cell's label
		cell.label.text = networkingService.getCategoryItems()[indexPath.item].title
		
		if networkingService.getCategoryItems()[indexPath.item].status == .normal {
			cell.labelView.backgroundColor = UIColor(named: "LightYellow")
			cell.label.textColor = UIColor(named: "Yellow")
		} else {
			cell.labelView.backgroundColor = UIColor(named: "Yellow")
			cell.label.textColor = .white
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		// set the size of each cell
		return CGSize(width: 80, height: 40)
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		networkingService.currentCategoryTitle = networkingService.getCategoryItems()[indexPath.item].title
		
		for index in 0 ... networkingService.getCategoryItems().count-1 {
			networkingService.changeCategoryStatus(index: index, status: .normal)
		}
		
		networkingService.changeCategoryStatus(index: indexPath.item, status: .selected)
		collectionView.reloadData()
		tableView.reloadData()
	}
}


class CustomCollectionViewCell: UICollectionViewCell {
	
	let label = UILabel()
	let labelView = UIView()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		// configure the cell's label
		labelView.backgroundColor = UIColor(named: "LightYellow")
		labelView.layer.cornerRadius = 10
		
		
		labelView.translatesAutoresizingMaskIntoConstraints = false
		label.translatesAutoresizingMaskIntoConstraints = false
		
		label.font = UIFont.systemFont(ofSize: 16)
		label.textColor = UIColor(named: "Yellow")
		
		contentView.addSubview(labelView)
		labelView.addSubview(label)
		
		
		NSLayoutConstraint.activate([
			labelView.widthAnchor.constraint(equalToConstant: 70),
			labelView.heightAnchor.constraint(equalToConstant: 30),
			labelView.topAnchor.constraint(equalTo: contentView.topAnchor),
			labelView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
			
			label.centerXAnchor.constraint(equalTo: labelView.centerXAnchor),
			label.centerYAnchor.constraint(equalTo: labelView.centerYAnchor),
		])
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	
}

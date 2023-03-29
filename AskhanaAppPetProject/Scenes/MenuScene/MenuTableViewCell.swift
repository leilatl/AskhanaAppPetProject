//
//  MenuTableViewCell.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 28.03.2023.
//

import Foundation
import UIKit
class MenuTableViewCell: UITableViewCell {
	
	let itemTitlelabel = BasicLabel(text: "", size: 18.5, weight: .semibold)
	let decriptionLabel = BasicLabel(text: "", size: 10)
	let priceLabel = BasicLabel(text: "", color: UIColor(named: "Green")!, size: 12, weight: .semibold)
	let plusButton = RoundButton(title: "+")
	let minusButton = RoundButton(title: "-")
	let cartButton = SymbolButton(symbolSystemName: "cart")
	let countLabel = BasicLabel(text: "0", color: UIColor(named: "Yellow")!, size: 20)
	var count = Int()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		addSubviews(views: [itemTitlelabel, decriptionLabel, priceLabel, cartButton, minusButton, countLabel, plusButton])
		decriptionLabel.textAlignment = .left
		NSLayoutConstraint.activate([
			itemTitlelabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			itemTitlelabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
			decriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			decriptionLabel.topAnchor.constraint(equalTo: itemTitlelabel.bottomAnchor, constant: 10),
			decriptionLabel.widthAnchor.constraint(equalToConstant: 200),
			priceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
			priceLabel.topAnchor.constraint(equalTo: decriptionLabel.bottomAnchor, constant: 10),
			cartButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
			cartButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			cartButton.widthAnchor.constraint(equalToConstant: 35),
			cartButton.heightAnchor.constraint(equalToConstant: 35),
			minusButton.trailingAnchor.constraint(equalTo: cartButton.leadingAnchor, constant: -16),
			minusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			countLabel.trailingAnchor.constraint(equalTo: minusButton.leadingAnchor, constant: -16),
			countLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
			plusButton.trailingAnchor.constraint(equalTo: countLabel.leadingAnchor, constant: -16),
			plusButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
		])
	}
	
	private func addSubviews(views: [UIView]) {
		for view in views {
			view.translatesAutoresizingMaskIntoConstraints = false
			contentView.addSubview(view)
		}
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

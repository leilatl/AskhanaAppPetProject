//
//  MenuModel.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 27.03.2023.
//

import Foundation
struct MenuModel {
	struct MenuItem {
		var title: String
		var description: String
		var price: String
	}
	
	struct CategoryItem {
		var title: String
		var status: CellStatus
		var menuItems: [MenuItem]
	}
	
	enum CellStatus {
		case selected
		case normal
	}
}

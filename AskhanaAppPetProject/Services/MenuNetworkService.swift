//
//  MenuNetworkService.swift
//  AskhanaAppPetProject
//
//  Created by Dmitry Serebrov on 27.03.2023.
//

import Foundation
class MenuNetworkService {
	var currentCategoryTitle = "Завтрак"
	
	func getMenuItems(for category: String) -> [MenuModel.MenuItem] {
		switch category {
		case "Завтрак":
			return categoryItemsStub[0].menuItems
		case "Первое":
			return categoryItemsStub[1].menuItems
		case "Второе":
			return categoryItemsStub[2].menuItems
		case "Салаты":
			return categoryItemsStub[3].menuItems
		case "Десерты":
			return categoryItemsStub[4].menuItems
		case "Выпечка":
			return categoryItemsStub[5].menuItems
		case "Напитки":
			return categoryItemsStub[6].menuItems
		default:
			return []
		}
	}
	
	func getCategoryItems() -> [MenuModel.CategoryItem] {
		return categoryItemsStub
	}
	
	private var categoryItemsStub = [
		MenuModel.CategoryItem(title: "Завтрак", status: .selected, menuItems: [
			MenuModel.MenuItem(title: "Рисовая каша", description: "Классическая рисовая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Манная каша", description: "Классическая манная каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Овсяная каша", description: "Классическая овсяная каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Гречневая каша", description: "Классическая гречневая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Пшеничная каша", description: "Классическая пшеничная каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Первое", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Борщ", description: "Борщ со свежей капустой, свеклой и мясом", price: "390 тенге"),
			MenuModel.MenuItem(title: "Пельмени", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Куриный суп", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Второе", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Лагман Узбекский", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Котлеты", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Салаты", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Цезарь", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Греческий", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Десерты", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Штрудель", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Чизкейк", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Выпечка", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Самса", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Хлеб", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
		MenuModel.CategoryItem(title: "Напитки", status: .normal, menuItems: [
			MenuModel.MenuItem(title: "Айран", description: "Классическая каша на молоке", price: "390 тенге"),
			MenuModel.MenuItem(title: "Яблочный сок", description: "Классическая каша на молоке", price: "390 тенге"),
		]),
	]
	
	func changeCategoryStatus(index: Int, status: MenuModel.CellStatus) {
		categoryItemsStub[index].status = status
	}
}

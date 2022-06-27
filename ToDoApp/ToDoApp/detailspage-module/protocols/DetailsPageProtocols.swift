//
//  DetailsPageProtocols.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//


import Foundation

protocol ViewToPresenterDetailsPageProtocol {
    var detailsPageInteractor:PresenterToInteractorDetailsPageProtocol? {get set}
    
    func update(toDo_ID:Int,things_toDo:String)
}

protocol PresenterToInteractorDetailsPageProtocol {
    func thingUpdate(toDo_ID:Int,things_toDo:String)
}

protocol PresenterToRouterDetailsPageProtocol {
    static func createModule(ref:DetailsPage)
}

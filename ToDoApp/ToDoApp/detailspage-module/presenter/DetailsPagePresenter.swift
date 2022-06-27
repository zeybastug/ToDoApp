//
//  DetailsPagePresenter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//


import Foundation

class DetailsPagePresenter : ViewToPresenterDetailsPageProtocol {
    var DetailsPageInteractor: PresenterToInteractorDetailsPageProtocol?
    
    
    var detailsPageInteractor: PresenterToInteractorDetailsPageProtocol?
    
    func update(toDo_ID:Int,things_toDo:String) {
        detailsPageInteractor?.thingUpdate(toDo_ID: toDo_ID, things_toDo: things_toDo)
    }
}






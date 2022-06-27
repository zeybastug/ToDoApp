//
//  DetailsPageInteractor.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//


import Foundation

class DetailsPageInteractor : PresenterToInteractorDetailsPageProtocol {
    func thingUpdate(toDo_ID:Int, things_toDo:String) {
        print("Update the thing : \(toDo_ID) - \(things_toDo)")
    }
}


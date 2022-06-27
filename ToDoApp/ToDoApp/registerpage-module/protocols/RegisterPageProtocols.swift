//
//  RegisterPageProtocols.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

protocol ViewToPresenterRegisterPageProtocol {
    var RegisterPageInteractor:PresenterToInteractorRegisterPageProtocol? {get set}
    
    func addd(things_toDo:String)
}

protocol PresenterToInteractorRegisterPageProtocol {
    func thingAdd(things_toDo:String)
}

protocol PresenterToRouterRegisterPageProtocol {
    static func createModule(ref:RegisterPage)
}




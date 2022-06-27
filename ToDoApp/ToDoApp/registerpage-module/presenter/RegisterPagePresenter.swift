//
//  RegisterPagePresenter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

class RegisterPagePresenter : ViewToPresenterRegisterPageProtocol {
    var RegisterPageInteractor: PresenterToInteractorRegisterPageProtocol?
    
    func addd(things_toDo:String) {
        RegisterPageInteractor?.thingAdd(things_toDo: things_toDo)
    }
}




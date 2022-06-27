//
//  RegisterPageRouter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

class RegisterPageRouter : PresenterToRouterRegisterPageProtocol {
    static func createModule(ref: RegisterPage) {
        ref.registerPagePresenterNesnesi = RegisterPagePresenter()
        ref.registerPagePresenterNesnesi?.RegisterPageInteractor = RegisterPageInteractor()
    }
}




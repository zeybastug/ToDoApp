//
//  MainPageRouter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

class MainPageRouter : PresenterToRouterMainPageProtocol {
    static func createModule(ref: MainPage) {
        let presenter = MainPagePresenter()
        //View
        ref.mainPagePresenterNesnesi = presenter
        //Presenter
        ref.mainPagePresenterNesnesi?.mainPageInteractor = MainPageInteractor()
        ref.mainPagePresenterNesnesi?.mainPageView = ref
        //Interactor
        ref.mainPagePresenterNesnesi?.mainPageInteractor?.mainPagePresenter = presenter
    }
}







//
//  DetailsPageRouter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

class DetailsPageRouter : PresenterToRouterDetailsPageProtocol {
    static func createModule(ref: DetailsPage) {
        ref.detailsPagePresenterNesnesi = DetailsPagePresenter()
        ref.detailsPagePresenterNesnesi?.detailsPageInteractor = DetailsPageInteractor()
    }
}











//
//  MainPagePresenter.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

class MainPagePresenter : ViewToPresenterMainPageProtocol {
    var mainPageInteractor: PresenterToInteractorMainPageProtocol?
    var mainPageView: PresenterToViewMainPageProtocol?
    
    func Yukle() {
        mainPageInteractor?.tumYapilacaklariAl()
    }
    
    func ara(aramaKelimesi: String) {
        // Arama kelimesi convert camel case
        mainPageInteractor?.yapilacakAra(aramaKelimesi: aramaKelimesi)
    }

    func sil(toDo_ID: Int) {
        mainPageInteractor?.yapilacakSil(toDo_ID: toDo_ID)
    }
}

extension MainPagePresenter : InteractorToPresenterMainPageProtocol {
    func presenteraVeriGonder(toDoList: Array<ThingsToDo>) {
        mainPageView?.vieweVeriGonder(toDoList: toDoList)
    }
}

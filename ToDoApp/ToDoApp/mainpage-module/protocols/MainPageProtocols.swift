//
//  MainPageProtocols.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation

protocol ViewToPresenterMainPageProtocol {
    var mainPageInteractor:PresenterToInteractorMainPageProtocol? {get set}
    var mainPageView:PresenterToViewMainPageProtocol? {get set}
    
    func Yukle()
    func ara(aramaKelimesi:String)
    func sil(toDo_ID:Int)
}

protocol PresenterToInteractorMainPageProtocol {
    var mainPagePresenter:InteractorToPresenterMainPageProtocol? {get set}
    
    func tumYapilacaklariAl()
    func yapilacakAra(aramaKelimesi:String)
    func yapilacakSil(toDo_ID:Int)
}

protocol InteractorToPresenterMainPageProtocol {
    func presenteraVeriGonder(toDoList:Array<ThingsToDo>)
}

protocol PresenterToViewMainPageProtocol {
    func vieweVeriGonder(toDoList:Array<ThingsToDo>)
}

protocol PresenterToRouterMainPageProtocol {
    static func createModule(ref:MainPage)
}

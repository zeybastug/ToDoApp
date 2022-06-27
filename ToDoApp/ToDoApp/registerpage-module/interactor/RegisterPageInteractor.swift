//
//  RegisterPageInteractor.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//


import Foundation

class RegisterPageInteractor : PresenterToInteractorRegisterPageProtocol {
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    
    func thingAdd(things_toDo: String) {
        db?.open()
        
        do{
            try db!.executeUpdate("INSERT INTO toDoTable (yapilacak_is) VALUES(?)", values: [things_toDo])
            
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
}

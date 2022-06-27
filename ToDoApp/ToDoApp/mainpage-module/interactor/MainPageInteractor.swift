//
//  MainPageInteractor.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 16.05.2022.
//

import Foundation


class MainPageInteractor : PresenterToInteractorMainPageProtocol {
    var mainPagePresenter: InteractorToPresenterMainPageProtocol?
    
    let db:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veritabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        db = FMDatabase(path: veritabaniURL.path)
    }
    
    func tumYapilacaklariAl() {
        db?.open()
        var liste = [ThingsToDo]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM toDoTable", values: nil)
            
            while rs.next(){
                let yapilacak = ThingsToDo(toDo_ID: Int(rs.string(forColumn: "yapilacak_id"))!, things_toDo: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacak)
            }
            mainPagePresenter?.presenteraVeriGonder(toDoList: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func yapilacakAra(aramaKelimesi: String) {
        db?.open()
        var liste = [ThingsToDo]()
        
        do{
            let rs = try db!.executeQuery("SELECT * FROM toDoTable WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while rs.next(){
                let yapilacak = ThingsToDo(toDo_ID: Int(rs.string(forColumn: "yapilacak_id"))!, things_toDo: rs.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacak)
            }
            mainPagePresenter?.presenteraVeriGonder(toDoList: liste)
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func yapilacakSil(toDo_ID yapilacak_id: Int) {
        db?.open()
        
        do{
            try db!.executeUpdate("DELETE FROM toDoTable WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumYapilacaklariAl()
        }catch{
            print(error.localizedDescription)
        }
        db?.close()
    }
    
}



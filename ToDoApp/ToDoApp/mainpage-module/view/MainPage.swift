//
//  ViewController.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 11.05.2022.
//

import UIKit

class MainPage: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var toDoListTable: UITableView!

    
    var ThingsToDoListe = [ThingsToDo]()
    
    var mainPagePresenterNesnesi:ViewToPresenterMainPageProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        toDoListTable.delegate = self
        toDoListTable.dataSource = self
        
        MainPageRouter.createModule(ref: self)
        veriTabaniKopyala()
        mainPagePresenterNesnesi?.Yukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TransitionToDetailsPage" {
            let thing = sender as? ThingsToDo
            let gidilecekVC = segue.destination as! DetailsPage
            gidilecekVC.thing = thing
        }
    }
    
    func veriTabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "toDoApp", ofType: "sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("toDoApp.sqlite")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: kopyalanacakYer.path) {
            print("Veritabanı zaten var!")
        }else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }catch{}
        }
    }
}

extension MainPage : PresenterToViewMainPageProtocol {
    func vieweVeriGonder(toDoList ThingsToDoListesi: Array<ThingsToDo>) {
        self.ThingsToDoListe = ThingsToDoListesi
        self.toDoListTable.reloadData()
    }
}

extension MainPage : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        mainPagePresenterNesnesi?.ara(aramaKelimesi: searchText)
    }
}

extension MainPage : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ThingsToDoListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let thing = ThingsToDoListe[indexPath.row]
        let celll = tableView.dequeueReusableCell(withIdentifier: "thingCell", for: indexPath) as! TableViewThingCell
       
            if(thing.things_toDo != nil)
            {
                celll.cellLabel.text = "\(String(describing: thing.things_toDo)))"
            }
        
        return celll
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let thing = ThingsToDoListe[indexPath.row]
        performSegue(withIdentifier: "TransitionToDetailsPage", sender: thing)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,bool) in
            let thing = self.ThingsToDoListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(thing.things_toDo!) silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.mainPagePresenterNesnesi?.sil(toDo_ID: thing.toDo_ID!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
















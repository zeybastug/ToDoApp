//
//  DetailsPage.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 11.05.2022.
//

import UIKit

class DetailsPage: UIViewController {
    
    @IBOutlet weak var detailsTextField: UITextField!

    
    var thing:ThingsToDo?

    
    var detailsPagePresenterNesnesi:ViewToPresenterDetailsPageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let k = thing {
            detailsTextField.text = k.things_toDo
           
        }
        
        DetailsPageRouter.createModule(ref: self)

    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let ka = detailsTextField.text ,let k = thing {
            detailsPagePresenterNesnesi?.update(toDo_ID: k.toDo_ID!, things_toDo: ka)
    }
}

}




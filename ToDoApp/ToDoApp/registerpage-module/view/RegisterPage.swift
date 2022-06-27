//
//  RegisterPage.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 11.05.2022.
//

import UIKit

class RegisterPage: UIViewController {

    @IBOutlet weak var registerTextField: UITextField!
        
        var registerPagePresenterNesnesi:ViewToPresenterRegisterPageProtocol?
        
        override func viewDidLoad() {
            super.viewDidLoad()
            RegisterPageRouter.createModule(ref: self)
        }
        
    
    @IBAction func addButton(_ sender: Any) {

        if let kt = registerTextField.text {
            registerPagePresenterNesnesi?.addd(things_toDo: kt)
        }
    }
    }
    
    


//
//  TableViewThingCell.swift
//  ToDoApp
//
//  Created by Zeynep Baştuğ on 15.05.2022.
//

import UIKit

class TableViewThingCell: UITableViewCell {

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}

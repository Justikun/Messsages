//
//  ToggleTableViewCell.swift
//  Messages
//
//  Created by Justin Lowry on 12/15/21.
//

import UIKit

protocol ToggleTableViewCellDelegate {
    func didToggle(isOn: Bool)
}

class ToggleTableViewCell: UITableViewCell {
    @IBAction func didtoggle(_ sender: UISwitch) {
        self.delegate?.didToggle(isOn: sender.isOn)
    }
    
    var delegate: ToggleTableViewCellDelegate?
}

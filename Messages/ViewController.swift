//
//  ViewController.swift
//  Messages
//
//  Created by Justin Lowry on 12/15/21.
//

import UIKit

struct Message {
    var sender: Sender
    var message: String
    var dateString: String
}

struct Sender {
    var name: String
    var avatar: UIImage?
}


var contacts = [
    Sender(name: "Morgan Moroney", avatar: UIImage(named: "MorganMoroney"))
]

var dummyMessages = [
    Message(sender: contacts[0], message: "Hi. Just checking if we're still on for tonight at 7.", dateString: "12-15-2021")
]

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ToggleTableViewCellDelegate {
    enum Section: Int {
        case doNotDisturb
        case messages
    }
    
    // MARK: - Properties
    var messages = dummyMessages
    
    // MARK: - Outlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: - Lifecycles
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    // MARK: - Tableview
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch Section(rawValue: section)! {
        case .doNotDisturb:
            return 1
        case .messages:
            return messages.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch Section(rawValue: indexPath.section)! {
        case .doNotDisturb:
            let cell = tableView.dequeueReusableCell(withIdentifier: "toggleCell", for: indexPath)
            if let cell = cell as? ToggleTableViewCell {
                cell.delegate = self
            }
            
            return cell
        case .messages:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "messageCell", for: indexPath)
            
            let message = messages[indexPath.row]
            
            if let cell = cell as? MessageTableViewCell {
                cell.nameLabel.text = message.sender.name
                cell.messageLabel.text = message.message
                cell.avatarView.image = message.sender.avatar
                cell.dateLabel.text = message.dateString
            }
            
            return cell
        }
    }
    
    func didToggle(isOn: Bool) {
        print("Toggle status \(isOn)")
    }
}


//
//  EmojiTableTableViewController.swift
//  EmojiDictionary
//
//  Created by AK on 14.07.2023.
//

import UIKit

class EmojiTableTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //cellLayoutMarginsFollowReadableWidth = true

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
         navigationItem.leftBarButtonItem = editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojis.count
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmojiCell", for: indexPath)
        
        let emoji = emojis[indexPath.row]
        
        var config = cell.defaultContentConfiguration()
        
        config.text = "\(emoji.symbol) - \(emoji.name)"
        config.secondaryText = "\(emoji.description)"
        cell.contentConfiguration = config
        
        cell.showsReorderControl = true

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print("\(emoji.symbol)")
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt
    fromIndexPath: IndexPath, to: IndexPath) {
        let movedEmoji = emojis.remove(at: fromIndexPath.row)
        emojis.insert(movedEmoji, at: to.row)
    }

}

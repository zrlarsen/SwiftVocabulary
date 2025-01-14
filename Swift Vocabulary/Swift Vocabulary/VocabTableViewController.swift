//
//  VocabTableViewController.swift
//  Swift Vocabulary
//
//  Created by Zack Larsen on 11/4/19.
//  Copyright © 2019 Zack Larsen. All rights reserved.
//

import UIKit

class VocabTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    var vocabWords: [Vocab] =
        [Vocab(word: "Variable", definition: "You use variables and constants in Swift to store information. It's that simple! Variables are the “things” in your code, like numbers, text, buttons and images. "),
         Vocab(word: "Constant", definition: "Constants refer to fixed values that a program may not alter during its execution."),
         Vocab(word: "Function", definition: "Functions are self-contained chunks of code that perform a specific task.")
    ]
    // MARK: - Table view data source
    
    //    override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    //        return vocabWord.count
    //
    //    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return vocabWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath)
        
        // Configure the cell...
        let vocab = vocabWords[indexPath.row]
        cell.textLabel?.text = vocab.word
        return cell
    }
    
    // MARK: - Navigation
    
    //     In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //         where are we going?
        
        if segue.identifier == "showDefinitionSegue" {
            // we know we are goin to the vocab detail view controller.

            //        what are we giving to the new view controller?
            if let wordDetailVC = segue.destination as? vocabDetailViewController,
                let indexPath = self.tableView.indexPathForSelectedRow {
            let word = vocabWords[indexPath.row]
            wordDetailVC.cellWord = word
            }
        }
    }
    
}

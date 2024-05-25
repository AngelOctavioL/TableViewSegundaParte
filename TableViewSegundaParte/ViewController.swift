//
//  ViewController.swift
//  TableViewSegundaParte
//
//  Created by Diplomado on 24/05/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var  searchBar: UISearchBar!
    
    var myArray = ["Pedro", "Juan", "Maria", "Jose", "Mariana", "Dante", "Isabel", "Victoria"]
    var searchArray: [String] = []
    // esta variable nos va a servir para logica de "buscar"
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.searchBar.delegate = self
    }
    
    @IBAction func editTable () {
        if tableView.isEditing {
            tableView.isEditing = false
        } else {
            tableView.isEditing = true
        }
    }
}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    // los dos incidices nos ayudan a saber el indice en el que se esta y el indice al que
    // va a llegar
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // esta funcion swapAt le pasas dos posiciones y te las intercambia
        myArray.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching {
            searchArray.count
        } else {
            myArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = myArray[indexPath.row]
        
        return cell!
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = myArray.filter({ $0.prefix(searchText.count) == searchText })
            searching = true
        print(searchArray)
    }
}


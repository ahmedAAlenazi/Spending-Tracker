//
//  searchTableViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 02/06/1443 AH.
//

import UIKit
import CoreData

class SearchTableViewController: UITableViewController, UISearchResultsUpdating, UISearchBarDelegate {
    
    
    
    let persistentContainer : NSPersistentContainer = {
        let container = NSPersistentContainer(name: "CoreDataModel")
        
        container.loadPersistentStores(completionHandler: { desc , error in
            
            if let readError = error {
                print(readError)
            }
        })
        
        return container
    }()
    var budgets:[BudgetCD] = []
    var entries:[CDEntry] = []
    var filteredEntries:[CDEntry] = []
    
    
    var searchController: UISearchController!
    var resultController = UITableViewController()
    
    // this function will be called when the page is loaded
    override func viewDidLoad() {
        super.viewDidLoad()
        getBudgetData()
        tableView.reloadData()
        
        
        self.resultController.tableView.dataSource = self
        self.resultController.tableView.delegate = self
        
        self.searchController = UISearchController(searchResultsController: self.resultController)
        self.tableView.tableHeaderView = self.searchController.searchBar
        self.searchController.searchResultsUpdater = self
        definesPresentationContext = true // remove the white space on top of the cells
        
        self.searchController.searchBar.scopeButtonTitles = ["All", "USD"]
        self.searchController.searchBar.delegate = self
        //        let frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        //        searchController.searchBar.frame = frame
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier:"cell")
        

       
    }
    
    // shift down the scope buttons when the search bar is clicked so they don't overlap each other
    override func viewDidLayoutSubviews() {
        self.searchController.searchBar.sizeToFit()
    }
    
    // filter entries by search input and scope
    func applySearch(searchText:String, scope:String = "All") {
        // filter by scope
        if searchController.searchBar.text! == ""{
            filteredEntries = entries.filter { entry in
                let entryCur = (scope == "All") || (entry.currency == scope)
                return entryCur
            }
            print("no search input")
        }
        
        // filter by search input and scope
        else{
            filteredEntries = entries.filter { entry in
                let entryCur = (scope == "All") || (entry.currency == scope)
                return entryCur && (entry.note!.lowercased().contains(searchText.lowercased()) || (entry.category!.lowercased() == (searchText.lowercased())) )
            }
        }
        
        for _ in filteredEntries {
            print("found 1 entry")
        }
        
        
        // update the results
//        self.resultController.tableView.reloadData()
       
    }
    
    
    func deleteFav(_ sender: Any) {
        
        if tableView.isEditing{
            tableView.isEditing = false
        }else{
            tableView.isEditing = true
        }
        tableView.reloadData()
    }
    // update search results, call applySearch
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let selectedScope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
        applySearch(searchText: searchController.searchBar.text!, scope:selectedScope)
    }
    
    // apply search inputs
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        applySearch(searchText: searchController.searchBar.text!,scope: searchBar.scopeButtonTitles![selectedScope])
    }
    
    // this function is sent to the view controller when the app receives a memory warning.
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    // MARK: - Table view data source
//    // get the entry data and reload data
//    override func viewWillAppear(_ animated: Bool) {
//
//        entries.removeAll()
//        print("budget count: \(budgets.count)")
//
//        tableView.reloadData()
//
//        getBudgetData()
//
//    }
//
    
    // display tableView based on cell count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//if tableView == self.tableView{
        print("entries\(entries.count)")
            return entries.count
            
     //   }
//        else{
//            print("filteredEntries")
//
//            return filteredEntries.count
//        }
    }
    
    // display tableView
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
     
        
        // update self.tableView
        

        
       // if tableView == self.tableView{
            
            print("entriescellForRowAt")
         //   print( entries.reversed()[indexPath.row])
            print(entries.count)
            // display entries in reverse order so that the newest entries are displayed on top
            let entry = entries[indexPath.row]
            
            var displayedString = ""
            var emoji = "🍔"
            if let cur = entry.currency {
                displayedString = "\("      ")\(cur)"
            }
            
            if let a = entry.amount{
                displayedString = "\(displayedString)\(" ")\(a)"
            }
            
            
            if let cat = entry.category {
                if entry.category == "food" {
                    emoji = "🍔"
                }
                else if entry.category == "housing" {
                    emoji = "🏠"
                }
                else if entry.category == "transport" {
                    emoji = "🚗"
                }
                else if entry.category == "shopping" {
                    emoji = "👠"
                }
                else if entry.category == "health" {
                    emoji = "🏥"
                }
                else if entry.category == "travel" {
                    emoji = "✈️"
                }
                else if entry.category == "bills" {
                    emoji = "📞"
                }
                else if entry.category == "investments" {
                    emoji = "💰"
                }
                else if entry.category == "income" {
                    emoji = "💸"
                }
                displayedString = "\(displayedString)\n\(emoji)\(" ")\(cat)"
            }
            if let n = entry.note {
                displayedString = "\(displayedString)\n\("      ")\(n)"
            }
            cell.textLabel?.text = displayedString
            cell.textLabel?.numberOfLines = 0
            
       // }
//                 update result tableView
        
        
//                else{
//
//                    let entry = filteredEntries[indexPath.row]
//
//                    var displayedString = ""
//                    var emoji = "🍔"
//                    if let cur = entry.currency {
//                        displayedString = "\("      ")\(cur)"
//                    }
//
//                    if let a = entry.amount{
//                        displayedString = "\(displayedString)\(" ")\(a)"
//                    }
//
//                    if let cat = entry.category {
//                        if entry.category == "food" {
//                            emoji = "🍔"
//                        }
//                        else if entry.category == "housing" {
//                            emoji = "🏠"
//                        }
//                        else if entry.category == "transport" {
//                            emoji = "🚗"
//                        }
//                        else if entry.category == "shopping" {
//                            emoji = "👠"
//                        }
//                        else if entry.category == "health" {
//                            emoji = "🏥"
//                        }
//                        else if entry.category == "travel" {
//                            emoji = "✈️"
//                        }
//                        else if entry.category == "bills" {
//                            emoji = "📞"
//                        }
//                        else if entry.category == "investments" {
//                            emoji = "💰"
//                        }
//                        else if entry.category == "income" {
//                            emoji = "💸"
//                        }
//                        displayedString = "\(displayedString)\n\(emoji)\(" ")\(cat)"
//                    }
//                    if let n = entry.note {
//                        displayedString = "\(displayedString)\n\("      ")\(n)"
//                    }
//                    cell.textLabel?.text = displayedString
//                    cell.textLabel?.numberOfLines = 0
//                }


        return cell

    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        
//        let context = persistentContainer.viewContext
//
//
//        if editingStyle == .delete {
//            //let budget = budgets[indexPath.row]
//            let entry = entries.reversed()[indexPath.row]
//
//            let dateFormatter = DateFormatter()
//
//            dateFormatter.dateFormat = "M"
//            let deleted_month = Int(dateFormatter.string(from: entry.date!))
//
//            dateFormatter.dateFormat = "y"
//            let deleted_year = Int(dateFormatter.string(from:entry.date!))
//
//            // delete the entry amount from the corresponding budget sum
//            for b in budgets {
//                let m: Int = Int(b.month)
//                let y: Int = Int(b.year)
//                if (m == deleted_month) && (y == deleted_year){
//                    if let a = entry.amount {
//                        var num = Double(a)!
//
//
//                        if entry.currency == "CAD" {
//                            num = 0.78 * num
//                        }
//                        else if entry.currency == "CNY" {
//                            num = 0.16 * num
//                        }
//                        else if entry.currency == "JPY" {
//                            num = 0.0093 * num
//                        }
//                        else if entry.currency == "EUR" {
//                            num = 1.23 * num
//                        }
//                        else if entry.currency == "GBP" {
//                            num = 1.4 * num
//                        }
//                        else {}
//
//                        let category = entry.category!
//
//                        if category != "income" {
//                            // update sum
//                            b.sum -= num
//                        }
//
//                        switch category {
//                            case "food":
//                                b.food -= num
//                            case "housing":
//                                b.housing -= num
//                            case "transport":
//                                b.transport -= num
//                            case "travel":
//                                b.travel -= num
//                            case "bills":
//                                b.bills -= num
//                            case "investments":
//                                b.investments -= num
//                            case "shopping":
//                                b.shopping -= num
//                            case "health":
//                                b.health -= num
//                            case "income":
//                                b.income -= num
//                            default:
//                                print("invalid category")
//                        }
//                    }
//                    break
//                }
//            }
//
//            // delete selected entry and update context
//            context.delete(entry)
//
//            do {
//                try context.save()
//            } catch let error as NSError {
//                print("Error While Deleting Note: \(error.userInfo)")
//            }
//
////            do {
////                entries = try context.fetch(CDEntry.fetchRequest())
////            }
////            catch {
////                print("Fetching Failed")
////            }
////            print("delete")
//            tableView.reloadData()
        
        
        let context = persistentContainer.viewContext
        let deleted = entries[indexPath.row]

        if editingStyle == .delete {
           context.delete(deleted)

           do {
               try context.save()
           } catch let error as NSError {
               print("Error While Deleting Note: \(error.userInfo)")
           }

        }
        //getBudgetData()
       tableView.reloadData()
        

        
        
        
    }
    
        
        
       
        
        
        
  
    
    
    // fetch data
    func getBudgetData() {
        
        let context = persistentContainer.viewContext
        
        do {
            entries = try context.fetch(CDEntry.fetchRequest())
            
        }  catch {
            
            print("Fetching Failed")
        }
    }
}


//
//  HomeViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 10/05/1443 AH.
//

import UIKit

class HomeViewController: UIViewController {

    
    
    private let _tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(DigramTableViewCell.self, forCellReuseIdentifier: DigramTableViewCell.identefire)
        tableView.register(BarTableViewCell.self, forCellReuseIdentifier: BarTableViewCell.identefire)
        tableView.register(pieTableViewCell.self, forCellReuseIdentifier: pieTableViewCell.identefire)
        tableView.translatesAutoresizingMaskIntoConstraints = false

        
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        _tableView.reloadData()
        view.addSubview(_tableView)
        _tableView.delegate = self
        _tableView.dataSource = self
       
      
        view.backgroundColor = .systemCyan
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()


        _tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
        _tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor).isActive = true
        _tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor).isActive = true
        _tableView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        _tableView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor).isActive = true
        
        _tableView.reloadData()
    }
    

   
}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        if (indexPath.section == 0)  {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: DigramTableViewCell.identefire, for: indexPath) as! DigramTableViewCell
                
            cell.isUserInteractionEnabled = false
            return cell

        }else if (indexPath.section == 1){
            print("indexPath1")
            
            let cell = tableView.dequeueReusableCell(withIdentifier: pieTableViewCell.identefire, for: indexPath) as! pieTableViewCell
                
            cell.isUserInteractionEnabled = false
            return cell
            
        }else if (indexPath.section == 2){
            print("indexPath2")
            let cell = tableView.dequeueReusableCell(withIdentifier:BarTableViewCell.identefire, for: indexPath) as! BarTableViewCell
                
            cell.isUserInteractionEnabled = false
            return cell
            
            
        }else{
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
                
                    
            return cell
           
        }
        
        }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
                 
        
            return view.frame.size.width
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
      //  tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
}
   
    




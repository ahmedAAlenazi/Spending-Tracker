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
        tableView.register(Incom_SpendingsTableViewCell.self, forCellReuseIdentifier: Incom_SpendingsTableViewCell.identefire)
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(_tableView)
        _tableView.delegate = self
        _tableView.dataSource = self
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        _tableView.frame = view.bounds
        
    }
    

   
}
extension HomeViewController: UITableViewDataSource , UITableViewDelegate {
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DigramTableViewCell.identefire, for: indexPath) as? DigramTableViewCell else { fatalError() }
            
        cell.backgroundColor = .link
                
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    
}

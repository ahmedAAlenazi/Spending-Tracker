//
//  OptionViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 07/06/1443 AH.
//

import UIKit

class OptionViewController: UIViewController {
   
    
    private var anniuty : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Anniuty", comment: ""), titlePosition: .top, additionalSpacing: 10, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    private var laverege : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Averege", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        
       
        return botton
        
    }()
    
    private var double : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Double", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    private var simple : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Simple Interest", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    private var compound : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Compound Interest", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    private var cashFlow : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: "cashFlow"), title:NSLocalizedString( "Cash Flow", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()

        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    private var budget : UIButton = {
        
        
        let botton = UIButton()
        botton.set(image: UIImage(named: ""), title: NSLocalizedString("Budget", comment: ""), titlePosition: .top, additionalSpacing: 0, state: .normal)
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        botton.layer.cornerRadius = 12
        botton.sizeToFit()

        botton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)

       
        return botton
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(anniuty)
        view.addSubview(laverege)
        view.addSubview(double)
        view.addSubview(simple)
        
        view.addSubview(compound)
        view.addSubview(cashFlow)
        view.addSubview(budget)
        
        constrainsBottons()
    }
    func constrainsBottons(){
        
        anniuty.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: -100).isActive = true
        anniuty.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        anniuty.widthAnchor.constraint(equalToConstant: 150).isActive = true
        anniuty.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        laverege.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: -100).isActive = true
        laverege.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 220).isActive = true
        laverege.widthAnchor.constraint(equalToConstant: 150).isActive = true
        laverege.heightAnchor.constraint(equalToConstant: 150).isActive = true

        
        double.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: -100).isActive = true
        double.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 390).isActive = true
        double.widthAnchor.constraint(equalToConstant: 150).isActive = true
        double.heightAnchor.constraint(equalToConstant: 150).isActive = true


        simple.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: -100).isActive = true
        simple.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 560).isActive = true
        simple.widthAnchor.constraint(equalToConstant: 150).isActive = true
        simple.heightAnchor.constraint(equalToConstant: 150).isActive = true


        compound.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: 100).isActive = true
        compound.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        compound.widthAnchor.constraint(equalToConstant: 150).isActive = true
        compound.heightAnchor.constraint(equalToConstant: 150).isActive = true



        cashFlow.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: 100).isActive = true
        cashFlow.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 220).isActive = true
        cashFlow.widthAnchor.constraint(equalToConstant: 150).isActive = true
        cashFlow.heightAnchor.constraint(equalToConstant: 150).isActive = true



        budget.centerXAnchor.constraint(equalTo:view.safeAreaLayoutGuide.centerXAnchor,constant: 100).isActive = true
        budget.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor, constant: 390).isActive = true
        budget.widthAnchor.constraint(equalToConstant: 150).isActive = true
        budget.heightAnchor.constraint(equalToConstant: 150).isActive = true


    }
    @objc func nextPage(sender: UIButton!)  {
       
        print("Button tapped")
       
    if sender == anniuty{
    performSegue(withIdentifier: "toAnniuty", sender: nil)
}
    if sender == laverege{
    performSegue(withIdentifier: "toLaverege", sender: nil)
}
    if sender == double{
    performSegue(withIdentifier: "toDouble", sender: nil)
}
    if sender == simple{
    performSegue(withIdentifier: "toSimple", sender: nil)
}
    if sender == compound{
    performSegue(withIdentifier: "toCompound", sender: nil)
}
    if sender == cashFlow{
    performSegue(withIdentifier: "toCashFlow", sender: nil)
}
    if sender == budget{
    performSegue(withIdentifier: "toBudget", sender: nil)
}
}
}


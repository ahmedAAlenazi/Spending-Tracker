//
//  EnterDataViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 05/05/1443 AH.
//

import UIKit
import CoreData





class EnterDataViewController:  UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{
   
    
    let persistentContainer : NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CoreDataModel")
        
            container.loadPersistentStores(completionHandler: { desc , error in
                
                if let readError = error {
                    print(readError)
                }
            })
        
        return container
    }()
    
    
//    let context = PersistentStorage.shared.context
   
    let currency = ["USD", "CAD", "CNY", "EUR", "GBP", "JPY","RS"]

   
    let category = [NSLocalizedString("Food", comment: ""), NSLocalizedString("Housing", comment: ""), NSLocalizedString("Transport", comment: ""), NSLocalizedString("Shopping", comment: ""), NSLocalizedString("Health", comment: ""), NSLocalizedString("Travel", comment: ""), NSLocalizedString("Bills", comment: ""), NSLocalizedString("Investments", comment: ""), NSLocalizedString("Income", comment: "")]
    var selectedCur = "USD"
    var selectedCat = "Food"
    var imageFilePath = ""
    
    var budgets:[BudgetCD] = []
    
    
   
    var pickviewCur: UIPickerView = {
      
        var pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView = UIPickerView(frame: CGRect(x: 220, y: 350, width: 150, height: 80))
        pickerView.backgroundColor = .systemPurple.withAlphaComponent(0.9)
        pickerView.layer.cornerRadius = 16
        return pickerView
    }()
    
    var pickviewCat: UIPickerView = {

        var pickerView = UIPickerView()
        pickerView.translatesAutoresizingMaskIntoConstraints = false
        pickerView = UIPickerView(frame: CGRect(x: 20, y:350, width: 150, height: 80))
        pickerView.backgroundColor = .systemPurple.withAlphaComponent(0.9)
        pickerView.layer.cornerRadius = 16
          return pickerView
    }()
    
    private var currencyLabal : UILabel = {
        var labal = UILabel()
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal = UILabel(frame: CGRect(x: 260, y: 440, width: 80, height: 40))
        labal.text = NSLocalizedString("currency", comment: "")
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.layer.backgroundColor = UIColor.systemPurple.cgColor
        labal.layer.cornerRadius = 16
        labal.textColor = .white
      
        return labal
    }()
    
    private var categoryLabal : UILabel = {
        var labal = UILabel()
        
        labal.translatesAutoresizingMaskIntoConstraints = false
        labal = UILabel(frame: CGRect(x: 55, y: 440, width: 80, height: 40))
        labal.text = NSLocalizedString("category", comment: "")
        labal.font = UIFont.systemFont(ofSize: 14)
        labal.textAlignment = .center
        labal.layer.backgroundColor = UIColor.systemPurple.cgColor
        labal.layer.cornerRadius = 16
        labal.textColor = .white

        return labal
    }()
    
    
    private var bottonNext : UIButton = {
        
        
        var botton = UIButton()
        botton.translatesAutoresizingMaskIntoConstraints = false
        botton.setTitle(NSLocalizedString("Next", comment: ""), for: [])
        botton.backgroundColor = UIColor.systemPurple
        botton.layer.cornerRadius = 12
        botton.sizeToFit()
        botton.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)

        
        
        return botton
        
    }()
    
    private var numberField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 100, y: 550, width: 200, height: 40))
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.placeholder = NSLocalizedString("number...", comment: "")
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    private var noteField : UITextField = {
        var textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField = UITextField(frame: CGRect(x: 100, y: 600, width: 200, height: 40))
        textField.keyboardType = .default
        textField.layer.cornerRadius = 6
        textField.placeholder = NSLocalizedString("what did you spend it on ?", comment: "")
        textField.font = UIFont.systemFont(ofSize: 15)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        
        return textField
    }()
    
    
    
override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemCyan
    view.addSubview(currencyLabal)
    view.addSubview(categoryLabal)
    view.addSubview(pickviewCur)
    view.addSubview(pickviewCat)
    view.addSubview(noteField)
    view.addSubview(numberField)
    view.addSubview(bottonNext)
    pickviewCat.delegate = self
    pickviewCat.dataSource = self
    pickviewCur.delegate = self
    pickviewCur.dataSource = self
    
    constrainsBottons()
    

    
     }
    
    // touch on the screen will hide the keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        numberField.resignFirstResponder()
         noteField.resignFirstResponder()
        
    }
    func constrainsBottons(){
        
        
        bottonNext.centerXAnchor.constraint(equalTo:self.view.centerXAnchor).isActive = true
        bottonNext.bottomAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.bottomAnchor, constant: -100).isActive = true
        bottonNext.widthAnchor.constraint(equalToConstant: 100.0).isActive = true
        bottonNext.heightAnchor.constraint(equalToConstant: 40.0).isActive = true
        //bottonNext.addTarget(self, action: #selector(buttonNextAction), for: .touchUpInside)
    }
    
        //return the number of components based on the pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if pickerView == pickviewCur{
            return 1
        }
        else if pickerView == pickviewCat{
            return 1
        }
        return 0
    }
    
    //return the contents of the selected row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == pickviewCur{
            return currency[row]
        }
        else if pickerView == pickviewCat{
            return category[row]
        }
        return ""
    }
    
    //return the length of the pickerView
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickviewCur{
            return currency.count
        }
        else if pickerView == pickviewCat{
            return category.count
        }
        return 0
    }
    
    //set the label to the value that is gotten from the pickerView
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == pickviewCur{
            currencyLabal.text = currency[row]
            selectedCur = currency[row]
            
        }
        else if pickerView == pickviewCat{
            categoryLabal.text = category[row]
            selectedCat = category[row]
        }
   
    }
          
   
     
     @objc func buttonNextAction(sender: UIButton!) {
         
         let context = persistentContainer.viewContext
         let entry = CDEntry(context: context) // Link Entry & Context
         
         setData(entry: entry,context:context)
         
         performSegue(withIdentifier: "ToHome", sender: nil)
         
     }
    
    func setData(entry: CDEntry,context: NSManagedObjectContext) {
        
        if Double(numberField.text!) != nil{
            entry.amount = numberField.text!
        }
        else{
            entry.amount = "0.00"
        }

        entry.category = selectedCat.lowercased()
        entry.currency = selectedCur
        entry.note = noteField.text!
        print("stage two")

        let now = NSDate()
        let dateFormatter = DateFormatter()

        entry.date = now as Date
        
        dateFormatter.dateFormat = "M"
        let current_month = Int(dateFormatter.string(from:now as Date))
        
        dateFormatter.dateFormat = "y"
        let current_year = Int(dateFormatter.string(from:now as Date))
            
        
     
        var new_month = true
        var reach_budget = false
        var current_budget = 0.0
        
        print("stage 3")

        for b in budgets {
            
            print("stage 4")

            let m: Int = Int(b.month)
            let y: Int = Int(b.year)

            if (m == current_month ?? 0) && (y == current_year ?? 0){
                print("stage 5")
                new_month = false
                if let a = entry.amount {
                    var num = Double(a)!
              

                    if entry.currency == "RS" {
                        num = 1 * num
                    }
                    if entry.currency == "CAD" {
                        num = 0.78 * num
                    }
                    else if entry.currency == "CNY" {
                        num = 0.16 * num
                    }
                    else if entry.currency == "JPY" {
                        num = 0.0093 * num
                    }
                    else if entry.currency == "EUR" {
                        num = 1.23 * num
                    }
                    else if entry.currency == "GBP" {
                        num = 1.4 * num
                    }
                    else {                     print("stage 6")
}
                    print("stage 6.5")

                    // update category sum
                    let category = entry.category!
                    // update sum
                    if category != "income" {
                        
                        print("stage 6.9")

                        b.sum += num
                    }
                    
                    switch category {
                        case "food":
                            b.food += num
                        case "housing":
                            b.housing += num
                        case "transport":
                            b.transport += num
                        case "travel":
                            b.travel += num
                        case "bills":
                            b.bills += num
                        case "investments":
                            b.investments += num
                        case "shopping":
                            b.shopping += num
                        case "health":
                            b.health += num
                        case "income":
                            b.income += num
                        default:
                            print("invalid category")
                    }
//                      check if the budget of the current month is reached
                    if b.sum >= b.budget {
                        reach_budget = true
                        current_budget = b.budget
                    }
                    
                    break
                }
            }
        }
        
       
        if new_month {
            print("stage 7")

            let context = persistentContainer.viewContext
            let b = BudgetCD(context: context)
            
            b.budget = 1000
            b.sum = 0.0
            b.month = Int16(current_month ?? 0)
            b.year = Int16(current_year ?? 0)
            b.food = 0.0
            b.housing = 0.0
            b.transport = 0.0
            b.travel = 0.0
            b.bills = 0.0
            b.investments = 0.0
            b.shopping = 0.0
            b.health = 0.0
            b.income = 0.0
            
            // convert amount to USD
            if let a = entry.amount {
                var num = Double(a)!
                print("stage 8")

                if entry.currency == "RS" {
                    num = 1 * num
                }
                if entry.currency == "CAD" {
                    num = 0.78 * num
                }
                else if entry.currency == "CNY" {
                    num = 0.16 * num
                }
                else if entry.currency == "JPY" {
                    num = 0.0093 * num
                }
                else if entry.currency == "EUR" {
                    num = 1.23 * num
                }
                else if entry.currency == "GBP" {
                    num = 1.4 * num
                }
                else {         print("stage 10")
}

                print("stage 9")

                let category = entry.category!
                
                // update sum
                if category != "income" {
                    b.sum += num
                }
                
                switch category {
                    case "food":
                        b.food += num
                    case "housing":
                        b.housing += num
                    case "transport":
                        b.transport += num
                    case "travel":
                        b.travel += num
                    case "bills":
                        b.bills += num
                    case "investments":
                        b.investments += num
                    case "shopping":
                        b.shopping += num
                    case "health":
                        b.health += num
                    case "income":
                        b.income += num
                    default:
                        print("invalid category")
                }
//                  check if the budget of the current month is reached
                if b.sum >= b.budget {
                    print("stage 11")

                    reach_budget = false
                    current_budget = b.budget
                }
            }
        }
        
        do {
            print("save")

            try context.save()
            
        }catch{
            print("not save")
        }
        getBudgetData()
//        display a pop up alert box if budget is reached
        if reach_budget {
            
            createAlert(title: "You've reached your monthly budget: \(String(format: "%.2f", current_budget)) USD", message: "Change your budget?")
        }
    }
     
     // fetch budget data
     func getBudgetData() {
         
         let context = persistentContainer.viewContext

         do {
             budgets = try context.fetch(BudgetCD.fetchRequest())
             
             }  catch {
             
             print("Fetching Failed")
         }
     }
    
     func createAlert (title:String, message:String) {

         let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)




         //CREATING ON BUTTON
         alert.addAction(UIAlertAction(title: "Yes", style: UIAlertAction.Style.default, handler: { (action) in
             alert.dismiss(animated: true, completion: nil)

         }))

         //close the alert window
         alert.addAction(UIAlertAction(title: "No", style: UIAlertAction.Style.default, handler: { (action) in
             alert.dismiss(animated: true, completion: nil)
             print("NO")
         }))

     }
    
    
    
}


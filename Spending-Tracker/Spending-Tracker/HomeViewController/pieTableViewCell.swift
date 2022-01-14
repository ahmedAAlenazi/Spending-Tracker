//
//  pieTableViewCell.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 08/06/1443 AH.
//

import UIKit
import Charts
import CoreData




class pieTableViewCell: UITableViewCell, ChartViewDelegate {

    
    static let identefire = "pieTableViewCell"
    
    
    let persistentContainer : NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CoreDataModel")
        
            container.loadPersistentStores(completionHandler: { desc , error in
                
                if let readError = error {
                    print(readError)
                }
            })
        
        return container
    }()
    
    
    var pieEntries = [PieChartDataEntry]()

    
    var selected_budget:[BudgetCD] = []

    private let pieChart: PieChartView = {
        
        var pieChart = PieChartView()
        pieChart = PieChartView(frame: CGRect(x: 0, y: 0, width: 400, height: 300))
        
        
        return pieChart
    }()
    //init the pie chart data entries
    
    var foodDataEntry = PieChartDataEntry (value: 0)
    var transportDataEntry = PieChartDataEntry (value: 0)
    var housingDataEntry = PieChartDataEntry (value: 0)
    var shoppingDataEntry = PieChartDataEntry (value: 0)
    var healthDataEntry = PieChartDataEntry (value: 0)
    var billsDataEntry = PieChartDataEntry (value: 0)
    var investmentsDataEntry = PieChartDataEntry (value: 0)
    var travelDataEntry = PieChartDataEntry (value: 0)
    
    
    var selected_month: String = "Dec"
    var selected_month_int: Int = 12
    var selected_year: Int = 2021
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        pieChart.delegate = self
        
        pieChart.center = contentView.center
        contentView.addSubview(pieChart)
            
      
        
        
        // get current month and year

        let now = NSDate()
        let dateFormatter = DateFormatter()

        dateFormatter.dateFormat = "MMMM"
        selected_month = dateFormatter.string(from:now as Date)

        dateFormatter.dateFormat = "M"
        let selected_month_int = Int(dateFormatter.string(from:now as Date))

        dateFormatter.dateFormat = "y"
        let selected_year = Int(dateFormatter.string(from:now as Date))


        // get budget data
        
        getSelectedBudget(month:selected_month_int ?? 0, year:selected_year ?? 0)
        
        // access chart description
        pieChart.chartDescription?.text = ""

    
        // center the legend
        pieChart.legend.xOffset += 20
        pieChart.legend.yOffset += 15
        pieChart.centerText = "Spending: \(String(format: "%.2f",selected_budget[0].sum)) USD \n Budget: \(String(format: "%.2f",selected_budget[0].budget)) USD"
        
        //set the pie chart data entry values and labels
        
        foodDataEntry.value = selected_budget[0].food
        foodDataEntry.label = NSLocalizedString("Food", comment: "")
        
        transportDataEntry.value = selected_budget[0].transport
        transportDataEntry.label = NSLocalizedString("Transport", comment: "")
    
        housingDataEntry.value = selected_budget[0].housing
        housingDataEntry.label = NSLocalizedString("Housing", comment: "")
        
        healthDataEntry.value = selected_budget[0].health
        healthDataEntry.label = NSLocalizedString("Health", comment: "")
        
        shoppingDataEntry.value = selected_budget[0].shopping
        shoppingDataEntry.label = NSLocalizedString("Shopping", comment: "")
        
        billsDataEntry.value = selected_budget[0].bills
        billsDataEntry.label = NSLocalizedString("Bills", comment: "")
        
        investmentsDataEntry.value = selected_budget[0].investments
        investmentsDataEntry.label = NSLocalizedString("Investments", comment: "")
        
        travelDataEntry.value = selected_budget[0].travel
        travelDataEntry.label = NSLocalizedString("Travel", comment: "")
        
    
        //add entries to the pie chart entry list
        pieEntries = [foodDataEntry, transportDataEntry, housingDataEntry, healthDataEntry, shoppingDataEntry,
                    billsDataEntry, investmentsDataEntry, travelDataEntry]
        
        
        //call updateChartData to get the most recent results and update the charts
        updateChartData()
    }
        func updateChartData(){
            let chartDataSet = PieChartDataSet(entries: pieEntries, label: nil)
            let chartData = PieChartData(dataSet: chartDataSet)

            var colors: [UIColor] = []
            colors.append(UIColor(red: 1, green: 165/255, blue: 0, alpha: 1))
            colors.append(UIColor(red: 0.3, green: 0.6, blue: 0.3, alpha: 1))
            colors.append(UIColor(red: 0.3, green: 0.4, blue: 0.9, alpha: 1))
            colors.append(UIColor(red: 0.4, green: 0.3, blue: 0.5, alpha: 1))
            colors.append(UIColor(red: 0.6, green: 0.4, blue: 0.5, alpha: 1))
            colors.append(UIColor(red: 0.9, green: 0.6, blue: 0.7, alpha: 1))
            colors.append(UIColor(red: 0.9, green: 0.8, blue: 0, alpha: 1))
            colors.append(UIColor(red: 0.4, green: 0.3, blue: 0, alpha: 1))
            
            chartDataSet.colors = colors
            pieChart.data = chartData

            
        }
        
    
        
        //get the current budget
        func getSelectedBudget(month:Int, year:Int){
            
            let context = persistentContainer.viewContext

            do {
                let budgets:[BudgetCD]  = try context.fetch(BudgetCD.fetchRequest())
                for b in budgets {
                    let m: Int = Int(b.month)
                    let y: Int = Int(b.year)
                    if (m == month) && (y == year){
                        selected_budget.append(b)
                        break
                    }
                }
            }
            catch {
                print("Fetching Selected Budget Failed")
            }
        }
        
    }


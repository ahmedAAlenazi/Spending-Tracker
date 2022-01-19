//
//  DigramViewController.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 15/06/1443 AH.
//

import UIKit
import Charts
import CoreData

class DigramViewController: UIViewController {

    
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
    var selected_budget:[BudgetCD] = []
    
    private let pieChart: PieChartView = {
        
        var pieChart = PieChartView()
        pieChart = PieChartView(frame: CGRect(x: 0, y: 80, width: 400, height: 400))
        
        
        return pieChart
    }()
    
    
    private let  barChart: HorizontalBarChartView = {
        
    var barChart = HorizontalBarChartView ()
         
        barChart = HorizontalBarChartView(frame: CGRect(x: 0, y: 500, width: 350, height: 200))
        
      return barChart
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
    //init the bar char data entries
    
    var sumDataEntry = BarChartDataEntry (x: 1.0, y: 0.0)
    var budgetDataEntry = BarChartDataEntry (x: 2.0, y: 0.0)
    var incomeDataEntry = BarChartDataEntry (x: 3.0, y: 0.0)
    
    var barEntries = [BarChartDataEntry]()
    var pieEntries = [PieChartDataEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(pieChart)
        view.addSubview(barChart)
        
        
        
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
        getSelectedBudget(month:selected_month_int!, year:selected_year!)
        
        pieDataEntry()
        barDataEntry()
        
        //call updateChartData to get the most recent results and update the charts
        updateChartData()
        
    }

    func barDataEntry() {
       
       budgetDataEntry.y = selected_budget[0].budget
       sumDataEntry.y = selected_budget[0].sum
       incomeDataEntry.y = selected_budget[0].income
       
       let labels = ["", "Spending", "Budget","Income"]
       
       // format bar chart
       barChart.chartDescription?.text = ""
       barChart.legend.enabled = false
       barChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: labels)
       barChart.xAxis.labelPosition = .bottom
       barChart.xAxis.drawGridLinesEnabled = false
       barChart.xAxis.granularityEnabled = true
       barChart.xAxis.granularity = 1
       barChart.rightAxis.drawLabelsEnabled = true
       barChart.rightAxis.drawGridLinesEnabled = false
       barChart.leftAxis.drawGridLinesEnabled = false
       barChart.animate(xAxisDuration: 1.5, yAxisDuration: 1.5, easingOption: .easeInOutQuad)
       
       barEntries = [sumDataEntry, budgetDataEntry, incomeDataEntry]
       
   }
   
    func pieDataEntry() {
       // center the legend
       pieChart.legend.xOffset += 20
       pieChart.legend.yOffset += 15
       pieChart.centerText = "Spending: \(String(format: "%.2f",selected_budget[0].sum)) USD \n Budget: \(String(format: "%.2f",selected_budget[0].budget)) USD"
       
       //set the pie chart data entry values and labels
       foodDataEntry.value = selected_budget[0].food
       foodDataEntry.label = "Food"
       
       transportDataEntry.value = selected_budget[0].transport
       transportDataEntry.label = "Transport"
       
       housingDataEntry.value = selected_budget[0].housing
       housingDataEntry.label = "Housing"
       
       healthDataEntry.value = selected_budget[0].health
       healthDataEntry.label = "Health"
       
       shoppingDataEntry.value = selected_budget[0].shopping
       shoppingDataEntry.label = "Shopping"
       
       billsDataEntry.value = selected_budget[0].bills
       billsDataEntry.label = "Bills"
       
       investmentsDataEntry.value = selected_budget[0].investments
       investmentsDataEntry.label = "Investments"
       
       travelDataEntry.value = selected_budget[0].travel
       travelDataEntry.label = "Travel"
       
       
       //add entries to the pie chart entry list
       pieEntries = [foodDataEntry, transportDataEntry, housingDataEntry, healthDataEntry, shoppingDataEntry,
                     billsDataEntry, investmentsDataEntry, travelDataEntry]
   }


func updateChartData(){
    
    
    let chartDataSet = PieChartDataSet(entries: pieEntries, label: nil)
    let chartData = PieChartData(dataSet: chartDataSet)
    
    let barDataSet = BarChartDataSet(entries: barEntries, label: "Types")
    let barData = BarChartData(dataSet: barDataSet)
    barData.barWidth = barData.barWidth * 0.4 // make the bar width smaller
    
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
    
    barDataSet.colors = ChartColorTemplates.joyful()
    barDataSet.drawValuesEnabled = true
    barChart.data = barData
    barChart.notifyDataSetChanged()
    
}


    //make sure the controller receives memory warning
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
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

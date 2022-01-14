//
//  DigramDataCollectionViewCell.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 10/05/1443 AH.
//

import UIKit
import Charts
import CoreData
import CoreGraphics





  
class DigramDataCollectionViewCell: UICollectionViewCell, ChartViewDelegate {
    
    
    static let identefire = "DigramDataCollectionViewCell"
    
    let persistentContainer : NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CoreDataModel")
        
            container.loadPersistentStores(completionHandler: { desc , error in
                
                if let readError = error {
                    print(readError)
                }
            })
        
        return container
    }()
    
    
    

    var selected_budget:[BudgetCD] = []

    let chartTitle : UILabel = {
        var  chartTitle = UILabel()
        
        chartTitle = UILabel(frame: CGRect(x: 50, y:10, width: 300, height: 50))
        
       return chartTitle
    }()
    let currentBudget : UILabel = {
        var currentBudget = UILabel()
        currentBudget = UILabel(frame: CGRect(x: 50, y: 40, width: 300, height:50))
        
        
      return currentBudget
    }()
    private var chartView : LineChartView = {

        var lineChart = LineChartView ()
        lineChart = LineChartView(frame: CGRect(x: 0, y: 200, width: 370, height: 400))
        
        
        
        
        return lineChart
        
    }()
    

    
    var shouldHideData: Bool = false
    
    //init the line chart data entries

    var foodDataEntry = ChartDataEntry(x: 0, y:0)
    var transportDataEntry = ChartDataEntry(x: 0, y:0 )
    var housingDataEntry = ChartDataEntry(x: 0, y: 0)
    var shoppingDataEntry = ChartDataEntry(x: 0, y: 0)
    var healthDataEntry = ChartDataEntry(x: 0, y: 0)
    var billsDataEntry = ChartDataEntry(x: 0, y: 0)
    var investmentsDataEntry = ChartDataEntry(x: 0, y: 0)
    var travelDataEntry = ChartDataEntry(x: 0, y: 0)
    var lineDataLine = ChartDataEntry(x: 0, y: 0)
    var startingPoint =  ChartDataEntry(x: 0, y: 0)
  
    
    
    
    var lineEntries = [ChartDataEntry]()
    
    var selected_month: String = "Dec"
    var selected_month_int: Int = 12
    var selected_year: Int = 2021
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
        
    }
    
    
    override func layoutSubviews(){
        super.layoutSubviews()
      
        chartView.delegate = self
        
//         x-axis limit line
        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
        llXAxis.lineWidth = 4
        llXAxis.lineDashLengths = [10, 10, 0]
        llXAxis.labelPosition = .bottomRight
        llXAxis.valueFont = .systemFont(ofSize: 100)

        chartView.xAxis.gridLineDashLengths = [10, 10]
        chartView.xAxis.gridLineDashPhase = 0

        let ll1 = ChartLimitLine(limit: 10000, label: "Upper Limit")
        ll1.lineWidth = 4
        ll1.lineDashLengths = [5, 5]
        ll1.labelPosition = .topRight
        ll1.valueFont = .systemFont(ofSize: 10)

        let ll2 = ChartLimitLine(limit: 1000, label: "Lower Limit")
        ll2.lineWidth = 4
        ll2.lineDashLengths = [5,5]
        ll2.labelPosition = .bottomRight
        ll2.valueFont = .systemFont(ofSize: 10)

        let leftAxis = chartView.leftAxis
        leftAxis.removeAllLimitLines()
        leftAxis.addLimitLine(ll1)
        leftAxis.addLimitLine(ll2)
        leftAxis.axisMaximum = 12000
        leftAxis.axisMinimum = -2000
        leftAxis.gridLineDashLengths = [10, 5]
        leftAxis.drawLimitLinesBehindDataEnabled = true

        chartView.rightAxis.enabled = false
        chartView.legend.form = .line
        chartView.animate(xAxisDuration: 2.5)

    
        contentView.addSubview(chartTitle)
        contentView.addSubview(currentBudget)
        chartView.center = contentView.center
        contentView.addSubview(chartView)
        
        
      

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
//        
//        if selected_year != nil {
////
////            chartTitle.text = " \(selected_month) \(selected_year!)\nMonthly budget: \(selected_budget[0])"
////
////            currentBudget.text = "Balance: \(String(format: "%.2f",selected_budget[0].income - selected_budget[0].sum)) USD"
//        }
        // center the legend
        chartView.legend.xOffset += 20
        chartView.legend.yOffset += 15
        chartView.chartDescription?.text = "Spending: \(String(format: "%.2f",selected_budget[0].sum)) USD \n Budget: \(String(format: "%.2f",selected_budget[0].budget)) USD"
        //set the line chart data entry values and labels
        
       
       
        startingPoint = ChartDataEntry (x: 10, y: selected_budget[0].income, data:nil)
        
        foodDataEntry = ChartDataEntry (x: 20, y: selected_budget[0].income - selected_budget[0].food , data: nil)
//        foodDataEntry.label = "Food"
        transportDataEntry = ChartDataEntry(x: 30, y: selected_budget[0].income - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        transportDataEntry.label = "Transport"
    
        housingDataEntry = ChartDataEntry (x: 40, y: selected_budget[0].income - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        housingDataEntry.label = "Housing"

        healthDataEntry =  ChartDataEntry (x: 50, y: selected_budget[0].income -  selected_budget[0].health - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        healthDataEntry.label = "Health"

        shoppingDataEntry =  ChartDataEntry (x: 60, y: selected_budget[0].income - selected_budget[0].shopping  -  selected_budget[0].health - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        shoppingDataEntry.label = "Shopping"

        billsDataEntry =   ChartDataEntry (x: 70, y: selected_budget[0].income - selected_budget[0].bills - selected_budget[0].shopping  -  selected_budget[0].health - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        billsDataEntry.label = "Bills"

        investmentsDataEntry = ChartDataEntry (x: 80, y: selected_budget[0].income - selected_budget[0].investments - selected_budget[0].bills - selected_budget[0].shopping  -  selected_budget[0].health - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food, data: nil)
//        investmentsDataEntry.label = "Investments"

        travelDataEntry = ChartDataEntry (x:90, y: selected_budget[0].income - selected_budget[0].travel - selected_budget[0].investments - selected_budget[0].bills - selected_budget[0].shopping  -  selected_budget[0].health - selected_budget[0].housing  - selected_budget[0].transport - selected_budget[0].food )
//        travelDataEntry.label = "Travel"

//
        lineEntries = [startingPoint,foodDataEntry, transportDataEntry, housingDataEntry, healthDataEntry, shoppingDataEntry,billsDataEntry, investmentsDataEntry, travelDataEntry]
        

        print("line entries")
        print(selected_budget[0])
       
        
        self.setDataCount()
    }
    
    func updateChartData() {
       if shouldHideData {
           chartView.data = nil
           return
       }
   }
    
    func setDataCount(){

        var colors: [UIColor] = []

        colors.append(UIColor(red: 1, green: 165/255, blue: 0, alpha: 1))
        colors.append(UIColor(red: 0.3, green: 0.6, blue: 0.3, alpha: 1))
        colors.append(UIColor(red: 0.3, green: 0.4, blue: 0.9, alpha: 1))
        colors.append(UIColor(red: 0.4, green: 0.3, blue: 0.5, alpha: 1))
        colors.append(UIColor(red: 0.6, green: 0.4, blue: 0.5, alpha: 1))
        colors.append(UIColor(red: 0.9, green: 0.6, blue: 0.7, alpha: 1))
        colors.append(UIColor(red: 0.9, green: 0.8, blue: 0, alpha: 1))
        colors.append(UIColor(red: 0.4, green: 0.3, blue: 0, alpha: 1))

       

        let set = LineChartDataSet(entries: lineEntries, label: "Types")
        set.drawIconsEnabled = true
        setup(set)

        let data = LineChartData(dataSet: set)
        chartView.data = data
        set.colors = colors
        set.fillAlpha = 0.5
        set.drawFilledEnabled = false

        chartView.notifyDataSetChanged()

        
    }

    
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
//    func setDataCountSet(_ count: Int, range: UInt32) {
//        let now = Date().timeIntervalSince1970
//        let hourSeconds: TimeInterval = 3600
//
//        let from = now - (Double(count) / 2) * hourSeconds
//        let to = now + (Double(count) / 2) * hourSeconds
//
//        let values = stride(from: from, to: to, by: hourSeconds).map { (x) -> ChartDataEntry in
//            let y = arc4random_uniform(range) + 50
//            return ChartDataEntry(x: x, y: Double(y))
//        }
    }
     func setup(_ dataSet: LineChartDataSet) {
         if dataSet.isDrawCirclesEnabled {
            dataSet.lineDashLengths = nil
            dataSet.highlightLineDashLengths = nil
            dataSet.setColors(.black, .red, .white)
            dataSet.setCircleColor(.black)
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = nil
            dataSet.formLineWidth = 1
            dataSet.formSize = 15
        } else {
            dataSet.lineDashLengths = [5, 2.5]
            dataSet.highlightLineDashLengths = [5, 2.5]
            dataSet.setColor(.black)
            dataSet.setCircleColor(.black)
            dataSet.lineWidth = 1
            dataSet.circleRadius = 3
            dataSet.drawCircleHoleEnabled = false
            dataSet.valueFont = .systemFont(ofSize: 9)
            dataSet.formLineDashLengths = [5, 2.5]
            dataSet.formLineWidth = 1
            dataSet.formSize = 15
        }
    }
  
     

  




    
    


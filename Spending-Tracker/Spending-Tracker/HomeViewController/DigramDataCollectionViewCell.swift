//
//  DigramDataCollectionViewCell.swift
//  Spending-Tracker
//
//  Created by Ahmed Alenazi on 10/05/1443 AH.
//

import UIKit
import Charts


    

  
class DigramDataCollectionViewCell: UICollectionViewCell, ChartViewDelegate {
    
    
    static let identefire = "DigramDataCollectionViewCell"
    
    let context = PersistentStorage.shared.context
    var capetil: [CDCapetil]? = []
    
       let _labal = UILabel()
   
    private let lineChart : LineChartView = {
      
        let lineChart = LineChartView ()
        
    
      return lineChart
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(lineChart)
        lineChart.delegate = self
        lineChart.frame = CGRect(x: 25, y: 100, width: 350,
                                height: 250)
        
        _labal.text = "Capetil:   "
        _labal.textAlignment = .left
        _labal.font = UIFont.systemFont(ofSize: 30)
        _labal.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        
        contentView.addSubview(_labal)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews(){
        super.layoutSubviews()
        
        capetil = PersistentStorage.shared.fetchManagedObject(managedObject: CDCapetil.self)
        
//
//        var entries = [ChartDataEntry]()
//        var xS = DateComponents(calendar: nil, timeZone: nil, era: nil, year: 2021, month: 1, day: 1, hour: 1, minute: 1, second: 1, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
//
//        var xF = DateComponents(calendar: nil, timeZone: nil, era: nil, year: 2021, month: 1, day: 1, hour: 1, minute: 1, second: 1, nanosecond: nil, weekday: nil, weekdayOrdinal: nil, quarter: nil, weekOfMonth: nil, weekOfYear: nil, yearForWeekOfYear: nil)
//        var sd = Date(timeIntervalSinceNow: timeInterval(capetil))
        
        for x in 0..<12 {
            entries.append(ChartDataEntry(x:Double(x),
                                          // Random number between 0 to 30
                                          y:Double.random(in:0...12)))
        }
        
        let set =  LineChartDataSet(entries : entries)
        // costemise the chart
        set.colors = ChartColorTemplates.material()
        let data = LineChartData(dataSet: set)
        lineChart.data = data
        
        
    }
 
    
    
}


    
    


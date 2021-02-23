//
//  ViewController.swift
//  CalendarDemoTutorial
//
//  Created by marco rodriguez on 23/02/21.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {

    var calendar: FSCalendar!
    var formatter = DateFormatter()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar = FSCalendar(frame: CGRect(x: 0.0, y: 40.0, width: self.view.frame.width - 20, height: 300.0))
        calendar.scrollDirection = .vertical
        calendar.scope = .month
        self.view.addSubview(calendar)
        
        calendar.appearance.titleFont = UIFont.systemFont(ofSize: 17.0)
        calendar.appearance.headerTitleFont = UIFont.boldSystemFont(ofSize: 18.0)
        calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 15.0)
        calendar.appearance.todayColor = .systemGreen
        
        calendar.delegate = self
        calendar.dataSource = self
    }
    
    //MARK:- Datasource
    func minimumDate(for calendar: FSCalendar) -> Date {
        return Date()
    }
    
    func maximumDate(for calendar: FSCalendar) -> Date {
        return Date().addingTimeInterval((24*60*60) * 5)
    }

    //MARK: - Delegate
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MM-yyyy"
        print("Fecha seleccionada :\(formatter.string(from: date))")
        let alert = UIAlertController(title: "Your Selection", message: "Is the day: \(formatter.string(from: date))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        //present(alert, animated: true)
    }
    
    func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        formatter.dateFormat = "dd-MMM-yyyy"
        print("Date de-selected: \(formatter.string(from: date))")
    }
}



//
//  CafeDataManager.swift
//  FoodLuxMea
//
//  Created by Seong Yeol Yi on 2020/08/23.
//

import SwiftUI
import WidgetKit

/// Retrieves, saves and updates all cafe datas.
class Cafeteria: ObservableObject {
    
    /// Loads existing datas or initializes them into default values.
    init() {
        if appStatus.isFirstVersionRun {
            SNUCOHandler.clear()
            OurhomeHandler.clear()
            print("Version first run: Cafe data eliminated.")
        }
    }
    
    func clear() {
        SNUCOHandler.clear()
        OurhomeHandler.clear()
        if #available(iOS 14.0, *) {
            WidgetCenter.shared.reloadAllTimelines()
        }
    }
    
    /// Get all data of certain date.
    func loadAll(at date: Date) -> [Cafe] {
        try! SNUCOHandler.cafe(date: date) + (OurhomeHandler.cafe(date: date) != nil ? [OurhomeHandler.cafe(date: date)!] : [])
    }

    /// Get specific cafe data from selected date.
    func cafe(at date: Date, name: String) -> Cafe? {
        loadAll(at: date).first(where: {$0.name == name})
    }
}
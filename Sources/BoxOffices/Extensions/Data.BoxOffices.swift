//
//  Data.BoxOffices.swift
//  BoxOffices
//
//  Created by 이정선 on 4/16/25.
//

import Foundation
 
extension Date {
    var yesterday: Date? {
        Calendar.current.date(byAdding: .day, value: -1, to: self)
    }
}

//
//  File.swift
//  BoxOffices
//
//  Created by 이정선 on 4/13/25.
//

import Foundation

enum HTTPMethod: String {
    case get
    
    var capitalizedValue: String {
        self.rawValue.capitalized
    }
}

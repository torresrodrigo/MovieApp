//
//  String+Extensions.swift
//  TheAppMovie
//
//  Created by Rodrigo Torres on 27/11/2021.
//

import Foundation

extension String {
    func convertDateFormater() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-d"
        let date = dateFormatter.date(from: self)
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let finalDate = dateFormatter.string(from: date!)
        return finalDate
    }
}

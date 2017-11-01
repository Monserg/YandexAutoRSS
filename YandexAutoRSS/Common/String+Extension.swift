//
//  String+Extension.swift
//  YandexAutoRSS
//
//  Created by msm72 on 01.11.2017.
//  Copyright © 2017 RemoteJob. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm:ss Z"
       
        // Current time zone
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT+0:00")
        
        return dateFormatter.date(from: self)!
    }
}

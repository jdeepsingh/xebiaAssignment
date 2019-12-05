//
//  AppConstants.swift
//  XebiaTest
//
//  Created by mojave on 05/12/19.
//  Copyright © 2019 Jagandeep. All rights reserved.
//

import Foundation
import UIKit

struct AppConstants {
    
    static let protocolo    : String = "https://"
    static let apiVersion   : String = "v2/viewed/"
    static let domain       : String = "api.nytimes.com/svc/mostpopular/"
    static let apiKey       : String = "nokdZkw2cOz74TsWz9LryMlUBFsMm0XQ"
    static let keyPath      : String = "api-key="
    static let baseUrl      : String = AppConstants.protocolo + AppConstants.domain + AppConstants.apiVersion
    
    struct NewsTableView {
        static let heightForRow = 100.0
    }
     
}

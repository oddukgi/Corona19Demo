//
//  SimpleCoronaModel.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import Foundation

struct SimpleCoronaModel: Codable, Hashable {
    var countryName: String
    var newCase: String
    var totalCase: String
    var recovered: String
    var death: String
    var percentage: String
    var newFcase: String
    var newCcase: String
}

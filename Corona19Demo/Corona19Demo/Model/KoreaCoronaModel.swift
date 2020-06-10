//
//  KoreaCoronaModel.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import Foundation


struct KoreaCoronaModel: Codable {
    
    var resultCode: String
    var resultMessage: String
    var korea: Korea
    var seoul: Seoul
    var busan: Busan
    var daegu: Daegu
    var incheon: Incheon
    var gwangju: Gwangju
    var daejeon: Daejeon
    var ulsan: Ulsan
    var sejong: Sejong
    var gyeonggi: Gyeonggi
    var gangwon: Gangwon
    var chungbuk: Chungbuk
    var chungnam: Chungnam
    var jeonbuk: Jeonbuk
    var jeonnam: Jeonnam
    var gyeongbuk: Gyeongbuk
    var gyeongnam: Gyeongnam
    var jeju: Jeju
    var quarantine: Quarantine
    
    enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMessage
        case korea     = "korea"
        case seoul     = "seoul"
        case busan     = "busan"
        case daegu     = "daegu"
        case incheon   = "incheon"
        case gwangju   = "gwangju"
        case daejeon   = "daejeon"
        case ulsan     = "ulsan"
        case sejong    = "sejong"
        case gyeonggi  = "gyeonggi"
        case gangwon   = "gangwon"
        case chungbuk  = "chungbuk"
        case chungnam  = "chungnam"
        case jeonbuk   = "jeonbuk"
        case jeonnam   = "jeonnam"
        case gyeongbuk = "gyeongbuk"
        case gyeongnam = "gyeongnam"
        case jeju      = "jeju"
        case quarantine = "quarantine"
    }
    
     
      
}

struct Korea: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Seoul
struct Seoul: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Busan
struct Busan: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Daegu
struct Daegu: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}


// MARK: - Incheon
struct Incheon: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Gwangju
struct Gwangju: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Daejeon
struct Daejeon: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}
// MARK: - Ulsan
struct Ulsan: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Sejong
struct Sejong: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}


// MARK: - Gyeonggi
struct Gyeonggi: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}


// MARK: - Gangwon
struct Gangwon: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Chungbuk
struct Chungbuk: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Chungnam
struct Chungnam: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}



// MARK: - Jeonbuk
struct Jeonbuk: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Jeonnam
struct Jeonnam: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Gyeongbuk
struct Gyeongbuk: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Gyeongnam
struct Gyeongnam: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Jeju
struct Jeju: Codable {
   var countryName: String
   var newCase: String
   var totalCase: String
   var recovered: String
   var death: String
   var percentage: String
   var newFcase: String
   var newCcase: String
}

// MARK: - Quarantine (격리자)
struct Quarantine: Codable {
    var countryName: String
    var newCase: String
    var totalCase: String
    var recovered: String
    var death: String
    var percentage: String
    var newFcase: String
    var newCcase: String
}

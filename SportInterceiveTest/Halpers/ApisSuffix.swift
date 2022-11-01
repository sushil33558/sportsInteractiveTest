//
//  ApisSuffix.swift
//
//  Created by Sushil on 9/17/21.
//  Copyright © 2021 Temp. All rights reserved.
//
import Foundation
enum APISuffix {
    //MARK: - LastVal
    //---------------
    case indnewz
    case pakAfric

    func getDescription() -> String
    {
        switch self {
        case .indnewz:
        return "nzin01312019187360.json"
        case .pakAfric:
        return "sapk01222019186652.json"
        }
    }
}
    //MARK: - BaseUrl
    //---------------
enum URLS {
    case baseUrl
  
    
    func getDescription() -> String {
        switch self {
        case .baseUrl :
            return "https://demo.sportz.io/"
        }
    }
}
//MARK: - UnifonicSmsGateWay
class UnifonicSmsGateway {
    
    var messageBody: String = ""
    let recipient: String
    let appSid: String = "evxaORfSlxgB7t3_NbAGclushgrQPl"
        
    
    init(otp: String , recipient: String) {
        self.messageBody = "Dear user, " + "\n" + otp + " is your one time password(OTP)." + "\n" + "Please enter the otp to proceed." + "\n" + "Thank you," + "\n" + "Team TAJR."
        self.recipient = recipient
    }
    
    deinit {
        print(#file , "UniFormSmsgateway Destructed")
    }
}

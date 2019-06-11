//
//  Deposit.swift
//  Task
//
//  Created by Symbat Bashkeyeva on 6/11/19.
//  Copyright © 2019 Symbat Bashkeyeva. All rights reserved.
//

import Foundation
class Deposit {
    var depositor:String
    var status:String
    var message:String
    var date:String
    var count:String
    init(depositor:String, status:String,message:String,date:String,count:String) {
        self.depositor = depositor
        self.status = status
        self.message = message
        self.date=date
        self.count=count
    }
    
}

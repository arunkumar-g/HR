//
//  UpdateDateModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - RESTHeader Model -
class RestHeaderModel: Serializable {
    
}

//MARK: - Request Model -
class UpdateDateRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: UpdateDateInputModel?
    
    init (restHeader: RestHeaderModel, input: UpdateDateInputModel) {
        self.restHeader = restHeader
        self.input = input
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case restHeader = "RESTHeader"
        case input = "InputParameters"
    }
}

class UpdateDateInputModel: Serializable {
    var requestId: String?
    var subject: String?
    
    init (requestId: String, subject: String) {
        self.requestId = requestId
        self.subject = subject
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case requestId = "P_REQUEST_ID"
        case subject = "P_SUBJECT"
    }
}

//{
//    "RESTHeader": {},
//    "InputParameters": {
//        "P_REQUEST_ID": "01",
//        "P_SUBJECT": "TEST"
//    }
//}


//MARK: - Response Model -
class UpdateDateResponseModel: Serializable {
    var output: UpdateDateModel?
    
    init (output: UpdateDateModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class UpdateDateModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var date: String?
    
    init (xmlns: String, xmlnsxsi: String, date: String) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.date = date
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case date = "P_DATE"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/get_last_update_date/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_DATE" : "2018-10-08T01:02:15.000+03:00"
//    }
//}

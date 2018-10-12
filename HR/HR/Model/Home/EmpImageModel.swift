//
//  EmpImageModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - Request Model -
class EmpImageRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: EmpImageInputModel?
    
    init (restHeader: RestHeaderModel, input: EmpImageInputModel) {
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

class EmpImageInputModel: Serializable {
    var requestId: String?
    var personId: String?
    var mgrId: String?
    var lang: String?
    
    init (requestId: String, personId: String, mgrId: String, lang: String) {
        self.requestId = requestId
        self.personId = personId
        self.mgrId = mgrId
        self.lang = lang
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case requestId = "P_REQUEST_ID"
        case personId = "P_PERSON_ID"
        case mgrId = "P_MGR_ID"
        case lang = "P_LANG"
    }
}

//{
//    "RESTHeader": {},
//    "InputParameters": {
//        "P_REQUEST_ID": "01",
//        "P_PERSON_ID": "131",
//        "P_MGR_ID": "01",
//        "P_LANG": "01"
//    }
//}


//MARK: - Response Model -
class EmpImageResponseModel: Serializable {
    var output: EmpImageModel?
    
    init (output: EmpImageModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class EmpImageModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var sysUpdateDate: String?
    var empImage: String?
    
    init (xmlns: String, xmlnsxsi: String, sysUpdateDate: String, empImage: String) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.sysUpdateDate = sysUpdateDate
        self.empImage = empImage
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case sysUpdateDate = "P_SYS_UPDATE_DATE"
        case empImage = "P_EMP_IMG"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/get_emp_image/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_SYS_UPDATE_DATE" : null,
//        "P_EMP_IMG" : "data"
//    }
//}

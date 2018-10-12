//
//  LoginModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - Request Model -
class LoginRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: LoginInputModel?
    
    init (restHeader: RestHeaderModel, input: LoginInputModel) {
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

class LoginInputModel: Serializable {
    var requestId: String?
    var deviceType: String?
    var deviceModel: String?
    var deviceToken: String?
    var username: String?
    var password: String?
    var lang: String?
    
    init (requestId: String, deviceType: String, deviceModel: String, deviceToken: String, username: String, password: String, lang: String) {
        self.requestId = requestId
        self.deviceType = deviceType
        self.deviceModel = deviceModel
        self.deviceToken = deviceToken
        self.username = username
        self.password = password
        self.lang = lang
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case requestId = "P_REQUEST_ID"
        case deviceType = "P_DEVICE_TYPE"
        case deviceModel = "P_DEVICE_MODEL"
        case deviceToken = "P_DEVICE_TOKEN"
        case username = "P_USER_NAME"
        case password = "P_USER_PASSWORD"
        case lang = "P_LANG"
    }
}

//{
//    "RESTHeader": {},
//    "InputParameters": {
//        "P_REQUEST_ID": "01",
//        "P_DEVICE_TYPE": "iOS",
//        "P_DEVICE_MODEL": "Enter Data",
//        "P_DEVICE_TOKEN": "Enter Device token",
//        "P_USER_NAME": "SYSADMIN",
//        "P_USER_PASSWORD": "sysadmin",
//        "P_LANG": "US"
//    }
//}


//MARK: - Response Model -
class LoginResponseModel: Serializable {
    var output: LoginModel?
    
    init (output: LoginModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class LoginModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var personID: String?
    var userID: String?
    var mgrID: String?
    var respID: String?
    var respAppID: String?
    var businessGroupID: String?
    var hrOrgID: String?
    var status: String?
    var errorMsg: String?
    
    init (xmlns: String, xmlnsxsi: String, personID: String, userID: String, mgrID: String, respID: String, respAppID: String, businessGroupID: String, hrOrgID: String, status: String, errorMsg: String) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.personID = personID
        self.userID = userID
        self.mgrID = mgrID
        self.respID = respID
        self.respAppID = respAppID
        self.businessGroupID = businessGroupID
        self.hrOrgID = hrOrgID
        self.status = status
        self.errorMsg = errorMsg
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case personID = "P_PERSON_ID"
        case userID = "P_USER_ID"
        case mgrID = "P_MGR_ID"
        case respID = "P_RESP_ID"
        case respAppID = "P_RESP_APP_ID"
        case businessGroupID = "P_BUSINESS_GROUP_ID"
        case hrOrgID = "P_HR_ORG_ID"
        case status = "P_STATUS"
        case errorMsg = "P_ERROR_MSG"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/validate_login/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_PERSON_ID" : "29971",
//        "P_USER_ID" : "0",
//        "P_MGR_ID" : "29971",
//        "P_RESP_ID" : "24178",
//        "P_RESP_APP_ID" : "800",
//        "P_BUSINESS_GROUP_ID" : "6786",
//        "P_HR_ORG_ID" : "6786",
//        "P_STATUS" : "S",
//        "P_ERROR_MSG" : null
//    }
//}

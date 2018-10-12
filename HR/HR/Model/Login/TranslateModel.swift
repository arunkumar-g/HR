//
//  TranslateModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - Request Model -
class TranslateRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: TranslateInputModel?
    
    init (restHeader: RestHeaderModel, input: TranslateInputModel) {
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

class TranslateInputModel: Serializable {
    var requestId: String?
    
    init (requestId: String) {
        self.requestId = requestId
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case requestId = "P_REQUEST_ID"
    }
}

//{
//    "RESTHeader": {},
//    "InputParameters": {
//        "P_REQUEST_ID": "02"
//    }
//}


//MARK: - Response Model -
class TranslateResponseModel: Serializable {
    var output: TranslateModel?
    
    init (output: TranslateModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class TranslateModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var translateTable: TranslateTableModel?
    
    init (xmlns: String, xmlnsxsi: String, translateTable: TranslateTableModel) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.translateTable = translateTable
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case translateTable = "P_TRANSLATE_TABLE"
    }
}

class TranslateTableModel: Serializable {
    var translateTableItem: [TranslateTableItemModel]?
    
    init (translateTableItem: [TranslateTableItemModel]) {
        self.translateTableItem = translateTableItem
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case translateTableItem = "P_TRANSLATE_TABLE_ITEM"
    }
}

class TranslateTableItemModel: Serializable {
    var code: String?
    var meaning: String?
    var lang: String?
    
    init (code: String, meaning: String, lang: String) {
        self.code = code
        self.meaning = meaning
        self.lang = lang
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case code = "P_ENG_CODE"
        case meaning = "P_MEANING"
        case lang = "P_LANG"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/get_system_translate/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_TRANSLATE_TABLE" : {
//            "P_TRANSLATE_TABLE_ITEM" : [ {
//            "P_ENG_CODE" : "AR",
//            "P_MEANING" : "LOGIN",
//            "P_LANG" : "دخول"
//            }, {
//            "P_ENG_CODE" : "US",
//            "P_MEANING" : "LOGIN",
//            "P_LANG" : "Login"
//            }, {
//            "P_ENG_CODE" : "AR",
//            "P_MEANING" : "PASSWORD",
//            "P_LANG" : "كلمة المرور"
//            }, {
//            "P_ENG_CODE" : "US",
//            "P_MEANING" : "PASSWORD",
//            "P_LANG" : "Password"
//            }, {
//            "P_ENG_CODE" : "AR",
//            "P_MEANING" : "REMEMBER ME",
//            "P_LANG" : "تذكرني"
//            }, {
//            "P_ENG_CODE" : "US",
//            "P_MEANING" : "REMEMBER ME",
//            "P_LANG" : "Remember Me"
//            }, {
//            "P_ENG_CODE" : "AR",
//            "P_MEANING" : "SELECT LANGUAGE",
//            "P_LANG" : "اختيار اللغة"
//            }, {
//            "P_ENG_CODE" : "US",
//            "P_MEANING" : "SELECT LANGUAGE",
//            "P_LANG" : "Select Language"
//            }, {
//            "P_ENG_CODE" : "AR",
//            "P_MEANING" : "USER NAME",
//            "P_LANG" : "اسم المستخدم"
//            }, {
//            "P_ENG_CODE" : "US",
//            "P_MEANING" : "USER NAME",
//            "P_LANG" : "User Name"
//            } ]
//        }
//    }
//}

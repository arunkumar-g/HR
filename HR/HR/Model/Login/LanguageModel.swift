//
//  LanguageModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - Request Model -
class LanguageRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: LanguageInputModel?
    
    init (restHeader: RestHeaderModel, input: LanguageInputModel) {
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

class LanguageInputModel: Serializable {
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
//        "P_REQUEST_ID": "01"
//    }
//}


//MARK: - Response Model -
class LanguageResponseModel: Serializable {
    var output: LanguageModel?
    
    init (output: LanguageModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class LanguageModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var languageTable: LanguageTableModel?
    
    init (xmlns: String, xmlnsxsi: String, languageTable: LanguageTableModel) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.languageTable = languageTable
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case languageTable = "P_LANG_TABLE"
    }
}

class LanguageTableModel: Serializable {
    var languageTableItem: [LanguageTableItemModel]?
    
    init (languageTableItem: [LanguageTableItemModel]) {
        self.languageTableItem = languageTableItem
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case languageTableItem = "P_LANG_TABLE_ITEM"
    }
}

class LanguageTableItemModel: Serializable {
    var code: String?
    var language: String?
    
    init (code: String, language: String) {
        self.code = code
        self.language = language
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case code = "P_CODE"
        case language = "P_LANG"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/get_system_language/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_LANG_TABLE" : {
//            "P_LANG_TABLE_ITEM" : [ {
//            "P_CODE" : "AR",
//            "P_LANG" : "العربية"
//            }, {
//            "P_CODE" : "US",
//            "P_LANG" : "English"
//            } ]
//        }
//    }
//}

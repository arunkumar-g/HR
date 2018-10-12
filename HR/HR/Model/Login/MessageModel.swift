//
//  MessageModel.swift
//  HR
//
//  Created by Arunkumar G on 09/10/18.
//  Copyright © 2018 Arunkumar G. All rights reserved.
//

import UIKit

//MARK: - Request Model -
class MessageRequestModel: Serializable {
    var restHeader: RestHeaderModel?
    var input: MessageInputModel?
    
    init (restHeader: RestHeaderModel, input: MessageInputModel) {
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

class MessageInputModel: Serializable {
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
class MessageResponseModel: Serializable {
    var output: MessageModel?
    
    init (output: MessageModel) {
        self.output = output
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case output = "OutputParameters"
    }
}

class MessageModel: Serializable {
    var xmlns: String?
    var xmlnsxsi: String?
    var messageTable: MessageTableModel?
    
    init (xmlns: String, xmlnsxsi: String, messageTable: MessageTableModel) {
        self.xmlns = xmlns
        self.xmlnsxsi = xmlnsxsi
        self.messageTable = messageTable
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case xmlns = "@xmlns"
        case xmlnsxsi = "@xmlns:xsi"
        case messageTable = "P_SYS_MESSAGE_TABLE"
    }
}

class MessageTableModel: Serializable {
    var messageTableItem: [MessageTableItemModel]?
    
    init (messageTableItem: [MessageTableItemModel]) {
        self.messageTableItem = messageTableItem
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case messageTableItem = "P_SYS_MESSAGE_TABLE_ITEM"
    }
}

class MessageTableItemModel: Serializable {
    var messageName: String?
    var messageText: String?
    var languageCode: String?
    
    init (messageName: String, messageText: String, languageCode: String) {
        self.messageName = messageName
        self.messageText = messageText
        self.languageCode = languageCode
    }
    
    init () {
    }
    
    private enum CodingKeys: String, CodingKey {
        case messageName = "P_MESSAGE_NAME"
        case messageText = "P_MESSAGE_TEXT"
        case languageCode = "P_LANGUAGE_CODE"
    }
}

//{
//    "OutputParameters" : {
//        "@xmlns" : "http://xmlns.oracle.com/apps/gl/rest/xx_test/get_system_message/",
//        "@xmlns:xsi" : "http://www.w3.org/2001/XMLSchema-instance",
//        "P_SYS_MESSAGE_TABLE" : {
//            "P_SYS_MESSAGE_TABLE_ITEM" : [ {
//            "P_MESSAGE_NAME" : "XX_MOB_TEST",
//            "P_MESSAGE_TEXT" : "تجريبي",
//            "P_LANGUAGE_CODE" : "AR"
//            }, {
//            "P_MESSAGE_NAME" : "XX_MOB_TEST",
//            "P_MESSAGE_TEXT" : "Test",
//            "P_LANGUAGE_CODE" : "US"
//            } ]
//        }
//    }
//}

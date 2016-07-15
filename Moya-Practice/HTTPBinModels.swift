//
//  HTTPBinModels.swift
//  
//
//  Created by Popeye Lau on 16/7/15.
//
//

import Foundation
import YYModel

class HTTPBinGetHeaders: NSObject {
    var accept: String?
    var accept_encoding: String?
    var accept_language: String?
    var host: String?
    var user_agent: String?

    class func modelCustomPropertyMapper() -> Dictionary<String,AnyObject>? {
        return ["accept":"Accept",
                "accept_encoding":"Accept-Encoding",
                "accept_language":"Accept-Language",
                "host":"Host",
                "user_agent":"User-Agent"]
    }
}

class HTTPBinGetModel: NSObject {

    var args: Dictionary<String,AnyObject>?
    var headers: HTTPBinGetHeaders?
    var origin: String?
    var url: String?

    class func modelContainerPropertyGenericClass() -> [String : AnyObject]? {
        return ["headers":HTTPBinGetHeaders.self]
    }
}
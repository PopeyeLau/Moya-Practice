//
//  HTTPBinAPI.swift
//  Moya-Practice
//
//  Created by Popeye Lau on 16/7/14.
//  Copyright © 2016年 Popeye. All rights reserved.
//

import Foundation
import Moya

let HTTPBinProvider = MoyaProvider<HTTPBinAPI>()
let RxHTTPBinProvider = RxMoyaProvider<HTTPBinAPI>()

public enum HTTPBinAPI {
	case Get
	case Post(Dictionary<String, AnyObject>)
    case Headers
}

extension HTTPBinAPI: TargetType {

	public var baseURL: NSURL { return NSURL(string: "https://httpbin.org")! }

	public var path: String {
		switch self {
		case .Get:
			return "/get"
		case .Post:
			return "/post"
        case .Headers:
            return "/headers"
		}
	}

	public var method: Moya.Method {
		switch self {
		case .Get,.Headers:
			return .GET
        case .Post:
            return .POST
        }
        
	}

	public var parameters: [String: AnyObject]? {
		switch self {
		case .Post(let params):
			return params
        default:
            return nil
		}
	}

	public var sampleData: NSData {
		return "".dataUsingEncoding(NSUTF8StringEncoding)!
	}

	public var multipartBody: [MultipartFormData]? {
		switch self {
		case .Post:
			guard let data = NSData(contentsOfURL: NSURL(string: "http://ww2.sinaimg.cn/large/7a4027b5gw1f20y9czrt3j20sg0sgq4n.jpg")!) else {
				return nil
			}
            let avatar = MultipartFormData(provider: .Data(data), name: "file", fileName: "avatar.png", mimeType: "image/jpeg")
            return [avatar]
		default:
			return nil
		}
	}
}
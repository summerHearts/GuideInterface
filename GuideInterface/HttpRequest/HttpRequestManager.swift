//
//  HttpRequestManager.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/13.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


public enum HTTPRequestError: ErrorType {
    case None
    case SystemError(error: NSError?)
    case NetworkError
    case BusinessError(description: String)
}

public typealias HTTPRequestHandler = (responseObject: AnyObject?, error: HTTPRequestError?) -> Void
public typealias HTTPRequestJSONHandler = (responseObject: JSON?, error: HTTPRequestError?) -> Void

public class HTTPRequestManager {
    public enum Method : String {
        case GET, POST
        var alamofireMethod: Alamofire.Method {
            var results = Alamofire.Method.GET
            switch self {
            case .GET:
                results = Alamofire.Method.GET
            case .POST:
                results = Alamofire.Method.POST
            }
            return results
        }
    }
    
    
    public func dataRequest(method m: Method, urlString url: URLStringConvertible, parameter param: [String : AnyObject]?, complectionHandler: HTTPRequestHandler?) -> Request{
        

        let req = Alamofire.request(m.alamofireMethod, url, parameters: param, encoding: .URL, headers: nil)
        req.responseJSON { (resp) -> Void in
            if resp.result.isSuccess {
                if let handler = complectionHandler {
                    handler(responseObject: resp.result.value, error: nil)
                }
            } else {
                if let handler = complectionHandler {
                    handler(responseObject: nil, error: HTTPRequestError.SystemError(error: resp.result.error))
                }
            }
        }
        
        return req
    }
    
}

extension HTTPRequestManager {
    
    public func dataRequest(requestParams param: HTTPRequestParameters, completionHandler: HTTPRequestHandler?) {
        let req = HttpRequest(requestParams: param)
        
        dataRequest(method: req.method, urlString: req.URLString, parameter: req.parameters) { (responseObject, error) -> Void in
            if error == nil {
               
            }else {
                
                if let handler = completionHandler {
                    handler(responseObject: nil, error: error)
                }
            }
        }
    }
}

//
//  HttpRequest.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/13.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import Foundation

//测试环境
let  TestHttpBaseURL = "http://asfjlkjasfka/"
//模拟环境
let SimulationHttpBaseURL = "http://ssakljfjashf/"
//正式
let FormalHttpBaseURL  = "http://ssakljfjashf/"

//Mock
let MockHttpBaseURL = "http://ssakljfjashf/"


enum HttPRequestType: NSInteger {
    case HttpGetMothod = 0
    case HttpPostMothod
}


enum HttPRequestEnvironment: NSInteger {
    case HttpFormal = 0
    case HttpSimulation
    case HttpTest
    case HttpMock
}

public struct HTTPRequestParameters {
    var type: HttPRequestType
    
    var requestEnvironmentType : HttPRequestEnvironment
    
    var parameters: [String: AnyObject]?
    
    init(requestType: HttPRequestType , EnvironmentType : HttPRequestEnvironment) {
        type = requestType
        requestEnvironmentType = EnvironmentType
    }
}


class HttpRequest {
    
    private static let HTTPCacheTimeStampKey = "com.alamofire.cacheTimeStampKey"
    var requestParams: HTTPRequestParameters
    init (requestParams: HTTPRequestParameters) {
        self.requestParams = requestParams
    }
}



extension HttpRequest {
    
    var httpRequestParameters: (method: HTTPRequestManager.Method, urlString: String, params : [String : AnyObject]?) {
        return (method, URLString, parameters)
    }
    
    var method: HTTPRequestManager.Method {
        switch requestParams.type {
        case .HttpGetMothod:
            return HTTPRequestManager.Method.GET
        default:
            return HTTPRequestManager.Method.POST
        }
    }
    var URLString: String {
        switch requestParams.requestEnvironmentType {
        case .HttpFormal:
            return TestHttpBaseURL
        case .HttpSimulation:
            return SimulationHttpBaseURL
        case .HttpTest:
            return SimulationHttpBaseURL
        case .HttpMock:
            return SimulationHttpBaseURL
        }
    }
        
    var parameters: [String: AnyObject]? {
        return requestParams.parameters
    }
}


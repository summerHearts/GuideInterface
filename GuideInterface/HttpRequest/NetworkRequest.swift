//
//  NetworkRequest.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/13.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import Foundation
import Alamofire

enum Result {
  case Success
}

public enum APIResult<T> {
  case Success(T)
  case Failure(NSError, AnyObject?)
}

class NetworkRequest {
  
  var url: String?
  var params: [String: AnyObject]?
  
  var success: (AnyObject -> Void)?
  var failure: ((Int, NSError) -> Void)?
  
  func fetch(url: String) -> NetworkRequest {
    self.url = url
    return self
  }
  
  func success(handler: (AnyObject -> Void)) -> NetworkRequest {
    self.success = handler
    return self
  }
  
  func error(handler: ((Int, NSError) -> Void)) -> NetworkRequest {
    self.failure = handler
    return self
  }
  
  func request() {
    if let url = url {
      Alamofire.request(.GET, url)
        .response { request, response, data, error in
          let json = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableLeaves)
          if let success = self.success {
            success(json)
          }
      }
    }
  }
}
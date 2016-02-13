//
//  HttpPNetworkReachability.swift
//  GuideInterface
//
//  Created by 佐毅 on 16/2/13.
//  Copyright © 2016年 上海乐住信息技术有限公司. All rights reserved.
//

import UIKit

class HttpPNetworkReachability {
    static let sharedManager = HttpPNetworkReachability()
    
    let reachability: Reachability!
    var status: Reachability.NetworkStatus! {
        return reachability.currentReachabilityStatus
    }
    var description: String {
        return reachability.currentReachabilityString
    }
    
    init() {
        do {
            try reachability = Reachability.init(hostname: "www.baidu.com")
            NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityChanged:", name: ReachabilityChangedNotification, object: reachability)
        } catch {
            reachability = nil
        }
    }
    
    func startMonitoring() {
        do {
            try reachability.startNotifier()
        } catch {
            print("reachability开启失败")
        }
    }
    
    func stopMonitoring() {
        reachability.stopNotifier()
    }
    
    func reachabilityChanged(note: NSNotification) {
        print(reachability.currentReachabilityString)
    }
    
    deinit {
        reachability.stopNotifier()
        NSNotificationCenter.defaultCenter().removeObserver(self, name: ReachabilityChangedNotification, object: nil)
    }
    
}

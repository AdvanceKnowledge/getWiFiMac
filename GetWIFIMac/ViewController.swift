//
//  ViewController.swift
//  GetWIFIMac
//
//  Created by 王延磊 on 2018/11/13.
//  Copyright © 2018 追@寻. All rights reserved.
//

import UIKit


import SystemConfiguration.CaptiveNetwork

import SnapKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let macName = UILabel()
        macName.text = self.getWIFINmae() as String;
        macName.font = UIFont.systemFont(ofSize: 14)
        macName.textColor = UIColor.gray
        self.view.addSubview(macName)
        
        macName.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX);
            make.top.equalTo(self.view.snp.top).offset(100);
        }
        
        
        let macIP = UILabel()
        macIP.text = self.getWiFiMacName() as String;
        macIP.font = UIFont.systemFont(ofSize: 14)
        macIP.textColor = UIColor.gray
        self.view.addSubview(macIP)
        macIP.snp.makeConstraints { (make) in
            make.centerX.equalTo(self.view.snp.centerX);
            make.top.equalTo(macName.snp.bottom).offset(20);
        }
    }
    
    
    func getWIFINmae() -> NSString {
        var ssid = "Not Found"
        //
        let myArray:NSArray = CNCopySupportedInterfaces()!
       
        for sub in myArray {
            if let dict:NSDictionary = CFBridgingRetain(CNCopyCurrentNetworkInfo(sub as! CFString)) as? NSDictionary{
                ssid = (dict["SSID"] as? String)!
                /*
                 dict :
                 ▿ 0 : 2 elements
                 - key : SSIDDATA
                 - value : <e68a80e6 9cafe983 a8>
                 ▿ 1 : 2 elements
                 - key : BSSID
                 - value : Mac地址
                 ▿ 2 : 2 elements
                 - key : SSID
                 - value : WiFi名称
                 */
            }
        }
        return ssid as NSString;
    }
    
    func getWiFiMacName() -> NSString {
        var macIp = "Not Found"
        let myArrary:NSArray =  CNCopySupportedInterfaces()!
        for sub in myArrary {
            if let dict = CFBridgingRetain(CNCopyCurrentNetworkInfo(sub as! CFString)){
                macIp = (dict["BSSID"] as? String)!
                
            }
        }
        return macIp as NSString
    }
    
}


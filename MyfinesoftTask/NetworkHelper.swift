//
//  NetworkHelper.swift
//  MyfinesoftTask
//
//  Created by Karthik on 4/1/19.
//  Copyright © 2019 Slyly Infotech. All rights reserved.
//

import Foundation

class NetworkHelper: NSObject {
    
    func post(withurl urlobj:String, withparameters parameters:String, completionhandler completionblock:@escaping(_ response:Dictionary<String,AnyObject>,_ error:String) -> Void)
    {
        
        let url = URL(string: urlobj)
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        request.httpBody = parameters.data(using: .utf8)
        
        
        let download = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            
            
            if data != nil
            {
                do{
                    let json = try JSONSerialization.jsonObject(with: data!, options: []) as AnyObject
                    let error = ""
                    completionblock(json as! Dictionary<String, AnyObject>,error)
                }
                catch
                {
                    
                }
            }
        }
        download.resume()
    }
    
    
    
    
}

//
//  ViewController.swift
//  swapi_demo_may_17
//
//  Created by Andy Feng on 5/22/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        callAPI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    func callAPI(){
        /// Call api!
        
        // specify the url that we will be sending the GET Request to
        let url = URL(string: "http://swapi.co/api/people/")
       
        Alamofire.request(url!, method: .get, parameters: nil, headers: nil)
            .responseJSON { response in
            
            
                // Perform action on response
                if let jsonResult = response.result.value as? NSDictionary {
              
                    
                    if let resultArr = jsonResult["results"] as? NSArray{
                        for result in resultArr {
                            let r = result as! NSDictionary
                            print(r["name"] ?? "nil")
                        }
                    }
                    
                    
                    
                }
            
            
        }
        
        
    }

    
    
    
    
    
    
    
    
}
















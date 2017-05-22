//
//  ViewController.swift
//  swapi_demo_may_17
//
//  Created by Andy Feng on 5/22/17.
//  Copyright © 2017 Andy Feng. All rights reserved.
//

import UIKit

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
        // create a URLSession to handle the request tasks
        let session = URLSession.shared
        
        
        // create a "data task" to make the request and run completion handler
        let task = session.dataTask(with: url!, completionHandler: {
            // see: Swift closure expression syntax
            data, response, error in
            // data -> JSON data, response -> headers and other meta-information, error-> if one occurred
            // "do-try-catch" blocks execute a try statement and then use the catch statement for errors
            do {
                // try converting the JSON object to "Foundation Types" (NSDictionary, NSArray, NSString, etc.)
                if let jsonResult = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {
                    
                    
                    /// Print JSON
                    
                    if let resultsArray = jsonResult["results"] as? NSArray {
                        
                        
                        for result in resultsArray {
                            
                            if let person = result as? NSDictionary {
                                
                                print(person["name"] ?? "nil")
                                
                            }
                            
                            
                        }

                    }
                    
                }
            } catch {
                print(error)
            }
        })
        
        
        
        task.resume()

    }

    
    
    
    
    
    
    
    
}
















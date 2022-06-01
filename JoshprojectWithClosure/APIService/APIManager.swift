//
//  APIManager.swift
//  JoshprojectWithClosure
//
//  Created by Amel Mallem on 5/15/22.
//

import Foundation
class APIManager{
    
 static let shared = APIManager()
    private init(){}
    
    var closure : (( Data? , URLResponse? , Error?) -> ())?
  
    func getDataFromAPIHandler(){
        
        guard  let url = URL.init(string:  "https://www.themealdb.com/api/json/v1/1/search.php?f=s") else{return}
        URLSession.shared.dataTask(with: url){ data , response , error in
            
            self.closure?(data, response, error)
            
        }.resume()
        
        
        
    }
    
    
}

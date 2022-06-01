//
//  ViewModel.swift
//  JoshprojectWithClosure
//
//  Created by Amel Mallem on 5/15/22.
//

import Foundation

class ViewModel{
    
    var error  : Error?
    var myModel : Main?
    
    //here
    var closure : (() ->())?
    
    func getDataFromViewModel(){
        
        APIManager.shared.closure = { data , response , error in
            
            self.error = error
            if  let data = data , error == nil {
                
                
                do {
                    self.myModel = try JSONDecoder.init().decode(Main.self, from: data)
                    
                    self.closure?()
                }catch{
                    
                    print(error)
                }
               
                //here
               
            }
        }
        //hr
        APIManager.shared.getDataFromAPIHandler()
    }
    
    
    func getCount() -> Int{
        var num = 0
        if let model = self.myModel{
           num = model.meals.count
        }
    
        return num
    }
    
    
}

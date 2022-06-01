//
//  myModel.swift
//  JoshprojectWithClosure
//
//  Created by Amel Mallem on 5/15/22.
//

import Foundation
struct Main : Decodable {
    var meals :  [Meal]
}

struct Meal : Decodable{
    
    var strMeal : String
    var strInstructions : String
    var strMealThumb: String
    
    
}

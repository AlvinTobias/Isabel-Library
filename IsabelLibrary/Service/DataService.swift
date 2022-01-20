//
//  DataService.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import Foundation

class DataService
{
    static func GetAllBooks()-> [Books]
    {
        var books : [Books] = [Books]()
        
        //GET THE BUNDLE PATH
        let bundlePath = Bundle.main.path(forResource: "Data", ofType: "json")
        
        guard bundlePath != nil else
        {
            return books
        }
        
        //GET THE URL PATH
        let urlPath = URL.init(fileURLWithPath: bundlePath!)
        
          do
          {
              //GET THE DATA OBJECT
              let databooks = try  Data(contentsOf: urlPath)
              
              //GET THE DECODABLE OBJECT
              let jsonDecodeObject = JSONDecoder()
              
              do
              {
                  //DECODE THE OBJECT
                  books = try jsonDecodeObject.decode([Books].self, from: databooks)
                  return books
              }
              
      
          }
        catch
        {
            print(error)
        }
      
        return books
        
    }
    
}

//
//  Books.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import Foundation

class Books : Decodable,Identifiable {
    var id : Int
    var title : String
    var author : String
    var isFavourite : Bool
    var currentPage : Int
    var rating : Int
    var content : [String]
}

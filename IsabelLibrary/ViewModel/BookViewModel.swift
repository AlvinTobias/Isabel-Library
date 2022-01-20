//
//  BookViewModel.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import Foundation

class BookViewModel : ObservableObject
{
    @Published var bookList : [Books]
    init()
    {
        bookList = DataService.GetAllBooks()
    }
    
}

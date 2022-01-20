//
//  BookDetails.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import SwiftUI


struct BookDetails: View {
    
    @EnvironmentObject var bookViewModel:BookViewModel
    @State var bookIndex : Int
    var body: some View {
        
        VStack
        {
            Text(bookViewModel.bookList[bookIndex].author)
            Text(bookViewModel.bookList[bookIndex].title)
            
            Button {
                bookViewModel.bookList[bookIndex].title = "Alvin Tobias"
                
                
            } label: {
                Text ("Change Title")
            }

        }
        
        
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(bookIndex: 1)
    }
}

//
//  BookView.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import SwiftUI

struct BookView: View {
    @State var myBook : Books
    @State var currentpage : Int
    var body: some View {
        VStack
        {
            TabView(selection: $currentpage){
                ForEach (0..<myBook.content.count)
                {
                     index in
                    VStack
                    {
                        Text(myBook.content[index])
                            .padding()
                            .tag(index + 1)
                        Spacer()
                        Text(String(index + 1))
                    }
                }
               
            }
            .onChange(of: currentpage, perform: { value in
                myBook.currentPage = value
                
            })
            .tabViewStyle(PageTabViewStyle())
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .never))
                      
           Spacer()
        }
        .navigationBarTitleDisplayMode(.inline)
        Spacer()
            
        }
       // .navigationBarTitleDisplayMode(.inline)
        //.navigationBarHidden(true)
        //navigationBarBackButtonHidden(true)
   
        
}

struct BookView_Previews: PreviewProvider {
    static var previews: some View {
        BookView(myBook: BookViewModel().bookList[0], currentpage: 1)
    }
}

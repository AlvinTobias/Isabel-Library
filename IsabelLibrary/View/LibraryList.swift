//
//  LibraryList.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import SwiftUI

struct LibraryList: View {
    @ObservedObject var bookListModel : BookViewModel = BookViewModel()
    var body: some View {
          NavigationView
            {   GeometryReader
                {   geo in
                    ScrollView
                    {
                        VStack
                        {
                            ForEach(bookListModel.bookList) {
                                books in
                                NavigationLink(destination: BookDetails(title: books.title, myBook: books)) {
                                    
                                    ZStack
                                        {   Rectangle().foregroundColor(.white).cornerRadius(10)
                                            VStack(alignment: .leading)
                                            {   HStack
                                                {   Text(books.title).font(.title).bold().padding(.top,5)
                                                    Spacer()
                                                    if(books.isFavourite)
                                                    {   Image(systemName: "star.fill").foregroundColor(.yellow)
                                                    }
                                                    else
                                                    {   Image(systemName: "star")
                                                    }
                                                }
                                                Text(books.author).font(.title3).italic().padding(.top,2)
                                                Image("cover" + String(books.id)).resizable().clipped().padding(.all, 15)
                                            }.frame(width: 325, height: 550, alignment: .center)
                                            
                                        }
                                        .padding(.all, 20).cornerRadius(10).shadow(color: .black, radius: 10, x: 5, y: 5)
                                }
                                .navigationBarTitle("Isabel Library.")
                            }
                        }
                      }.frame(width: geo.size.width, height: geo.size.height, alignment: .center)
                        .buttonStyle(PlainButtonStyle())
                }
               
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(bookListModel)
            }
    }

struct LibraryList_Previews: PreviewProvider {
    static var previews: some View {
        LibraryList()
    }
}

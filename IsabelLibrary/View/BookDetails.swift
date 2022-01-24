//
//  BookDetails.swift
//  IsabelLibrary
//
//  Created by Jainy Alvin on 1/19/22.
//

import SwiftUI


struct BookDetails: View {
    
    @EnvironmentObject var bookViewModel:BookViewModel
    //@ObservedObject var bookViewModel:BookViewModel
    @State var bookIndex : Int
    @State var ratingSelection = 1
    @State var favSelection = 0
    var body: some View {
        
        
        VStack(alignment: .leading)
        {
            GeometryReader
            {
                geo in
                
                ZStack
                {
                    Rectangle().foregroundColor(.white)
                    VStack
                    {
                        Text("Read Now !").font(.title).bold().padding(.top,10)
                        
                        Image("cover" + String(bookViewModel.bookList[bookIndex].id)).resizable().clipped()
                            .frame(width: geo.size.width-150, height: geo.size.height-300, alignment: .center)
                            .padding(.all,10)
                        Text("Mark for later!").font(.title3).bold()
                        
                        Button {
                            favSelection = (favSelection == 1 ? 0 : 1)
                        
                        } label: {
                            if(favSelection == 1)
                            {
                                Image(systemName: "star.fill").foregroundColor(.yellow).font(.system(size: 50))
                            }
                            else
                            {
                                Image(systemName: "star").font(.system(size: 50))
                            }
                            
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.all,5)
                            .onAppear {
                                GetIntialValues()
                            }
                            .onDisappear {
                                GetUpdatedValues()
                            }
                        
                        VStack
                        {
                            
                            Text("Rate Me !")
                        Picker("RatePicker", selection: $ratingSelection) {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("3").tag(3)
                                Text("4").tag(4)
                                Text("5").tag(5)
                        }.pickerStyle(.segmented)
                            .padding([.leading,.trailing],20)
                            
                           
                        }
                        Spacer()
                    }
                    Spacer()
                }
                
                
            }
            
            
        }
        //.navigationBarTitle(bookViewModel.bookList[bookIndex].author)
        
        
    }
    func GetIntialValues()
    {
        ratingSelection = bookViewModel.bookList[bookIndex].rating
        favSelection = (bookViewModel.bookList[bookIndex].isFavourite == true ? 1 : 0)
    }
    func GetUpdatedValues()
    {
        bookViewModel.bookList[bookIndex].rating = ratingSelection
        bookViewModel.bookList[bookIndex].isFavourite = (favSelection == 1 ? true : false)
        bookViewModel.objectWillChange.send()
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        BookDetails(bookIndex: 1).environmentObject(BookViewModel())
    }
}

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
    //@State var bookIndex : Int
    @State var ratingSelection = 1
    @State var favSelection = 0
    @State var title :String
    
    @State var myBook : Books
  
    var body: some View {
        VStack(alignment: .leading)
        {
            //Text(bookViewModel.bookList[bookIndex].title).font(.title).bold()
//            GeometryReader
//            {
//                geo in
                    
                ZStack
                {
                    Rectangle().foregroundColor(.white)
                    VStack
                    {
                        Text("Read Now !").font(.title).bold()
                        NavigationLink (destination : BookView())
                        {
                             Image("cover" + String(myBook.id)).resizable().resizable().scaledToFit()
                              //  .frame(width: geo.size.width-150, height: geo.size.height-350, alignment: .top)
                        }
                        Text("Mark for later!").font(.title3).bold()
                        Button {
                            favSelection = (favSelection == 1 ? 0 : 1)
                        
                        } label: {
                            if(favSelection == 1)
                            {
                                Image(systemName: "star.fill").foregroundColor(.yellow).font(.system(size: 25))
                            }
                            else
                            {
                                Image(systemName: "star").font(.system(size: 25))
                            }
                            
                        }.buttonStyle(PlainButtonStyle())
                            .padding(.all,1)
                            .onAppear {
                                GetIntialValues()
                            }
                            .onDisappear {
                                GetUpdatedValues()
                            }
                             Text("Rate Me !")
                            Picker("RatePicker", selection: $ratingSelection) {
                                Text("1").tag(1)
                                Text("2").tag(2)
                                Text("3").tag(3)
                                Text("4").tag(4)
                                Text("5").tag(5)
                        }.pickerStyle(.segmented)
                            .padding([.leading,.trailing],20)
                            
                           Spacer()
                    
                    }
                    Spacer()
                }
                //.frame(width: geo.size.width, height: geo.size.height, alignment: .top)
                    Spacer()
                .navigationTitle(title)
                Spacer()
        }
        .navigationTitle(myBook.title)
      }
    func GetIntialValues()
    {
        ratingSelection = myBook.rating
        favSelection = (myBook.isFavourite == true ? 1 : 0)
    }
    func GetUpdatedValues()
    {
        myBook.rating = ratingSelection
        myBook.isFavourite = (favSelection == 1 ? true : false)
        bookViewModel.objectWillChange.send()
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        BookDetails(title: "Hello", myBook: BookViewModel().bookList[0]).environmentObject(BookViewModel())
    }
}

//
//  ContentView.swift
//  SwiftUI-MovieApp
//
//  Created by Arpit Dixit on 28/08/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var store: MovieStore
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, content: {
                    ForEach(store.movies, id: \.imdbID) { movie in
                        NavigationLink(destination: Text(movie.title)) {
                            VStack {
                                URLImage(url: movie.poster)
                                    .frame(width: 100, height: 150, alignment: .center)
                                Text(movie.title)
                            }
                        }
                    }
                })
            }
            .navigationTitle("Movies")
        }
        .onAppear(perform: {
            store.getAll()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(store: MovieStore())
    }
}

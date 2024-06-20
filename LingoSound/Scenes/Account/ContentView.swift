//
//  ContentView.swift
//  LingoSound
//
//  Created by hieu nguyen on 20/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(
                    rows: [GridItem()],
                    pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/,
                    content: {
                        Button(action: {
                            
                        }, label: {
                            Image("plus-icon")
                                .foregroundStyle(.blue)
                                .padding(EdgeInsets(
                                    top: 20,
                                    leading: 20,
                                    bottom: 20,
                                    trailing: 20)
                                )
                        }).background(Circle().fill(Color.blue))
                        
                        Button(action: {

                        }, label: {
                            Image("plus-icon")
                                .foregroundStyle(.blue)
                                .padding(EdgeInsets(
                                    top: 20,
                                    leading: 20,
                                    bottom: 20,
                                    trailing: 20)
                                )
                        }).background(Circle().fill(Color.blue))
                    }).padding(EdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20))
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

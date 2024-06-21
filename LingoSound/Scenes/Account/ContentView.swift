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
    private var itemss: FetchedResults<Item>
    
    
    let items = (1...50)
    var accounts: [Account]?
    
    
    @State private var gridLayout = [GridItem]()
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    
    private var viewModel = AccountViewModel(authenticationService: LocalAuthenticationServices())
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                LazyVGrid(columns: gridLayout, spacing: LayoutDimention.padding.value) {
//                    ForEach(items, id: \.self) { item in
//                        Text(item)
//                            .frame(width: calculateNumberOfItemsInRow(size: geometry.size.width).itemWidth)
//                            .frame(height: calculateNumberOfItemsInRow(size: geometry.size.width).itemWidth)
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .aspectRatio(1, contentMode: .fit)
//                    }
                    
                    
                }
                .padding()
            }
            .onAppear {
                // updateGridLayout(size: geometry.size)
                gridLayout = calculateLayoutOfGridItems(width: geometry.size.width)
                viewModel.getAccounts()
            }
            .onChange(of: geometry.size) { oldValue, newValue in
                gridLayout = calculateLayoutOfGridItems(width: geometry.size.width)
                // updateGridLayout(size: newValue)
            }
        }
    }
    
    private func calculateNumberOfItemsInRow(size: CGFloat) -> (itemCount: Int, itemWidth: CGFloat) {
        let itemCount: Int
        switch (sizeClass, size) {
        case (.compact, _):
            itemCount = size < 500 ? 3 : 4
        case (.regular, 700...999):
            itemCount = 4
        case (.regular, 1000...): // ipad
            itemCount = 4
        default:
            itemCount = 2
        }
        return (itemCount: itemCount, itemWidth: size / CGFloat(itemCount) - LayoutDimention.padding.value)
    }
    
    private func calculateLayoutOfGridItems(width: CGFloat) -> [GridItem] {
        return Array(
            repeating: GridItem(
                .flexible(),
                spacing: LayoutDimention.padding.value),
            count: calculateNumberOfItemsInRow(size: width).itemCount)
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

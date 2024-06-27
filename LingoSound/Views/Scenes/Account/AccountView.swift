//
//  ContentView.swift
//  LingoSound
//
//  Created by hieu nguyen on 20/06/2024.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //    @Environment(\.managedObjectContext) private var viewContext
    
    //    @FetchRequest(
    //        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
    //        animation: .default)
    //
    //    private var itemss: FetchedResults<Item>
    
    @StateObject private var viewModel = AccountViewModel(
        authenticationService: LocalAuthenticationServices())
    @Environment(\.horizontalSizeClass) private var sizeClass
    
    @State private var gridLayout = [GridItem]()
    @State private var cellSize: CGFloat = 0
    @State private var cellCountEachRow: Int = 0
    
    var body: some View {
        ViewWrapper {
            GeometryReader { geometry in
                ScrollView {
                    LazyVGrid(
                        columns: gridLayout,
                        spacing: LayoutDimention.padding.value) {
                            
                            addNewAccountButton()
                            
                            ForEach(viewModel.accounts, id: \.id) { account in
                                accountButton(account: account)
                            }
                        }
                        .padding()
                }
                .onAppear {
                    layoutGridView(by: geometry.size.width)
                    viewModel.getAccounts()
                }
                .onChange(of: geometry.size) { oldValue, newValue in
                    layoutGridView(by: geometry.size.width)
                }
            }
        }
        
    }
    
    private func layoutGridView(by screenWidth: CGFloat) {
        cellCountEachRow = calculateNumberOfItemsInRow(size: screenWidth)
        cellSize = screenWidth / CGFloat(cellCountEachRow) - LayoutDimention.padding.value * 4
        gridLayout = Array(
            repeating: GridItem(
                .flexible(),
                spacing: LayoutDimention.padding.value),
            count: cellCountEachRow)
    }
    
    private func addNewAccountButton() -> some View {
        Button(action: {
            
        }, label: {
            ZStack {
                Circle()
                    .fill(Color.bgButton)
                    .shadow(radius: 4, x: 2, y: 2)
                Image("plus-icon")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(Color("border"))
                    .frame(width: 50, height: 50)
            }
        })
        .frame(width: cellSize, height: cellSize)
    }
    
    private func accountButton(account: Account) -> some View {
        Button {
            
        } label: {
            VStack {
                Image(account.avatar)
                    .resizable()
                    .frame(width: cellSize, height: cellSize)
                    .aspectRatio(1, contentMode: .fill)
                    .clipShape(Circle())
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 4)
                    )
                    .shadow(radius: 4, x: 2, y: 2)
                
                CaptionText(text: account.name)
            }
        }
    }
    
    private func calculateNumberOfItemsInRow(size: CGFloat) -> Int {
        let itemCount: Int
        switch (sizeClass, size) {
        case (.compact, _):
            itemCount = size < 500 ? 2 : 4
        case (.regular, 700...999):
            itemCount = 4
        case (.regular, 1000...): // ipad
            itemCount = 4
        default:
            itemCount = 2
        }
        return itemCount
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}

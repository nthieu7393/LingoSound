//
//  LingoSoundApp.swift
//  LingoSound
//
//  Created by hieu nguyen on 20/06/2024.
//

import SwiftUI

@main
struct LingoSoundApp: App {
    let persistenceController = PersistenceController.shared
    
    @StateObject private var coordinator = NavigationRouter()

    enum Route: Hashable {
        case 
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: <#T##Binding<NavigationPath>#>, root: <#T##() -> View#>)
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .environmentObject(coordinator)
        }
    }
}

enum

class NavigationRouter: ObservableObject {
    
    @Published var path = NavigationPath()
    
    func start() {
        
    }
    
    func push<T:Hashable>(_ route: T) {
        path.append(route)
    }
    
    func pop() {
        path.removeLast()
    }
    
    func popToLast() {
        path.removeLast(path.count)
    }
}

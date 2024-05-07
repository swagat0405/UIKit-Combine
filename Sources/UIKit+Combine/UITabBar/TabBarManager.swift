//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

public protocol TabBarManaged: TabBarDelegate {
    func manage(tabBar: UITabBar)
}

// MARK: - TabBarManager
final class TabBarManager: NSObject {
    // MARK: - Properties
    var selectedTabSubject = PassthroughSubject<UITabBarItem, Never>()
    var didBeginCustomizingTabSubject = PassthroughSubject<[UITabBarItem], Never>()
    var willBeginCustomizingTabSubject = PassthroughSubject<[UITabBarItem], Never>()
    var didEndCustomizingTabSubject = PassthroughSubject<([UITabBarItem], changed: Bool), Never>()
    var willEndCustomizingTabSubject = PassthroughSubject<([UITabBarItem], changed: Bool), Never>()
    
    // MARK: - Init
    func manage(tabBar: UITabBar) {
        tabBar.delegate = self
    }
    
    deinit {
        selectedTabSubject.send(completion: .finished)
        didBeginCustomizingTabSubject.send(completion: .finished)
        willBeginCustomizingTabSubject.send(completion: .finished)
        didEndCustomizingTabSubject.send(completion: .finished)
        willEndCustomizingTabSubject.send(completion: .finished)
    }
}

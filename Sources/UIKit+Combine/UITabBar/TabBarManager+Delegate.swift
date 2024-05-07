//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

// MARK: - TabBarManager+TabBarDelegate
extension TabBarManager: TabBarDelegate {
    var onDidSelectItem: AnyPublisher<UITabBarItem, Never> {
        selectedTabSubject.eraseToAnyPublisher()
    }
    var onDidBeginCustomizing: AnyPublisher<[UITabBarItem], Never> {
        didBeginCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onWillEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> {
        willEndCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onWillBeginCustomizing: AnyPublisher<[UITabBarItem], Never> {
        willBeginCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onDidEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> {
        didEndCustomizingTabSubject.eraseToAnyPublisher()
    }
    
}

// MARK: - TabBarManager+UITabBarDelegate
extension TabBarManager {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        selectedTabSubject.send(item)
    }
    func tabBar(_ tabBar: UITabBar, didBeginCustomizing items: [UITabBarItem]) {
        didBeginCustomizingTabSubject.send(items)
    }
    func tabBar(_ tabBar: UITabBar, willBeginCustomizing items: [UITabBarItem]) {
        willBeginCustomizingTabSubject.send(items)
    }
    func tabBar(_ tabBar: UITabBar, didEndCustomizing items: [UITabBarItem], changed: Bool) {
        didEndCustomizingTabSubject.send((items, changed))
    }
    func tabBar(_ tabBar: UITabBar, willEndCustomizing items: [UITabBarItem], changed: Bool) {
        willEndCustomizingTabSubject.send((items, changed))
    }
}

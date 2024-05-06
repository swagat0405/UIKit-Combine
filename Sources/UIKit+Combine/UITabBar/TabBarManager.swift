//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

final class TabBarManager: NSObject, UITabBarDelegate {
    var selectedTabSubject = PassthroughSubject<UITabBarItem, Never>()
    var didBeginCustomizingTabSubject = PassthroughSubject<[UITabBarItem], Never>()
    var willBeginCustomizingTabSubject = PassthroughSubject<[UITabBarItem], Never>()
    var didEndCustomizingTabSubject = PassthroughSubject<([UITabBarItem], changed: Bool), Never>()
    var willEndCustomizingTabSubject = PassthroughSubject<([UITabBarItem], changed: Bool), Never>()
    
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

//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

// MARK: - TabBarDelegate Protocol
public protocol TabBarDelegate: UITabBarDelegate {
    var onDidSelectItem: AnyPublisher<UITabBarItem, Never> { get }
    var onDidBeginCustomizing: AnyPublisher<[UITabBarItem], Never> { get }
    var onWillBeginCustomizing: AnyPublisher<[UITabBarItem], Never> { get }
    var onDidEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> { get }
    var onWillEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> { get }
}

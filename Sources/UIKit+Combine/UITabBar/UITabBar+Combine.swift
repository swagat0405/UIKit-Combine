//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

public final class UITabBar_Combine: UITabBar {
    // MARK: - Properties
    private lazy var manager = TabBarManager()
    
    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = manager
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Publishers
    var onDidSelectItem: AnyPublisher<UITabBarItem, Never> {
        manager.selectedTabSubject.eraseToAnyPublisher()
    }
    var onDidBeginCustomizing: AnyPublisher<[UITabBarItem], Never> {
        manager.didBeginCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onWillBeginCustomizing: AnyPublisher<[UITabBarItem], Never> {
        manager.willBeginCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onDidEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> {
        manager.didEndCustomizingTabSubject.eraseToAnyPublisher()
    }
    var onWillEndCustomizing: AnyPublisher<([UITabBarItem], changed: Bool), Never> {
        manager.willEndCustomizingTabSubject.eraseToAnyPublisher()
    }
}


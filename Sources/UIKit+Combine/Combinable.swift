//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/2/24.
//

import UIKit
import Combine

public protocol Combinable {}

// MARK: - UIControl
extension UIControl: Combinable {}

public extension Combinable where Self: UIControl {
    func publisher(for event: UIControl.Event) -> UIControl.Publisher<Self> {
        UIControl.Publisher(control: self, event: event)
    }
}

// MARK: - UIButton
public extension Combinable where Self: UIButton {
    var onTouchUpInside: UIControl.Publisher<Self> {
        .init(control: self, event: .touchUpInside)
    }
}

// MARK: - UISlider
public extension Combinable where Self: UISlider {
    var onValueChanged: UIControl.Publisher<Self> {
        .init(control: self, event: .valueChanged)
    }
}

// MARK: - UITextField
public extension Combinable where Self: UITextField {
    var onEditingChanged: UIControl.Publisher<Self> {
        .init(control: self, event: .editingChanged)
    }
    var onEditingDidEnd: UIControl.Publisher<Self> {
        .init(control: self, event: .editingDidEnd)
    }
    var onEditingDidBegin: UIControl.Publisher<Self> {
        .init(control: self, event: .editingDidBegin)
    }
}

// MARK: - UIBarButtonItem
extension UIBarButtonItem: Combinable {}

public extension Combinable where Self: UIBarButtonItem {
    var onTap: UIBarButtonItem.BarButtonItemPublisher {
        UIBarButtonItem.BarButtonItemPublisher(barButtonItem: self)
    }
}

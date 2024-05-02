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
    func publisher(for event: UIControl.Event) -> UIControl.ControlPublisher<Self> {
        UIControl.ControlPublisher(control: self, event: event)
    }
}

// MARK: - UIBarButtonItem
extension UIBarButtonItem: Combinable {}

public extension Combinable where Self: UIBarButtonItem {
    func publisher() -> UIBarButtonItem.BarButtonItemPublisher {
        UIBarButtonItem.BarButtonItemPublisher(barButtonItem: self)
    }
}

// MARK: - UITableView
extension UITableView: Combinable {}
public extension Combinable where Self: UITableView {
    func onSelectRow() -> UITableView.TableViewPublisher {
        UITableView.TableViewPublisher(tableView: self)
    }
}

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
    func onDidSelectRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onDidDeSelectRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onWillDisplayCell() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onDidEndDisplaying() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onWillBeginEditingRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onDidEndEditingRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onDidHighlightRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onAccessoryButtonTappedForRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onPerformPrimaryActionForRow() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    func onDidBeginMultipleSelectionInteraction() -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self)
    }
    
    
    
    func rowHeight(_ height: CGFloat) -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self, rowHeight: height)
    }
    func estimatedRowHeight(_ height: CGFloat) -> UITableView.TableViewDelegatePublisher {
        UITableView.TableViewDelegatePublisher(tableView: self, rowHeight: height)
    }
}

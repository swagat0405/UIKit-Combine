//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/2/24.
//

import UIKit
import Combine

public extension UITableView {
    
    struct TableViewDelegatePublisher: Publisher {
        public typealias Output = IndexPath
        public typealias Failure = Never
        
        let tableView: UITableView
        var rowHeight: CGFloat? = nil
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, IndexPath == S.Input {
            let subscription = TableViewSubscription(tableView: self.tableView, subscriber: subscriber, rowHeight: rowHeight ?? UITableView.automaticDimension)
            subscriber.receive(subscription: subscription)
        }
    }
    
    class TableViewSubscription<DelegateEventSubscriber: Subscriber>: NSObject, Subscription, UITableViewDelegate where DelegateEventSubscriber.Input == IndexPath, DelegateEventSubscriber.Failure == Never {
        
        weak private var tableView: UITableView?
        private var subscriber: DelegateEventSubscriber?
        private var rowHeight: CGFloat
        
        init(
            tableView: UITableView,
            subscriber: DelegateEventSubscriber? = nil,
            rowHeight: CGFloat = UITableView.automaticDimension
        ) {
            self.tableView = tableView
            self.subscriber = subscriber
            self.rowHeight = rowHeight
            super.init()
            
            tableView.delegate = self
        }
        
        public func request(_ demand: Subscribers.Demand) {}
        public func cancel() {
            subscriber = nil
            tableView?.delegate = nil
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            _ = subscriber?.receive(indexPath)
            return rowHeight
        }
    }
}

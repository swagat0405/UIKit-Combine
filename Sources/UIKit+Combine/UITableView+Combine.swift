//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/2/24.
//

import UIKit
import Combine

public extension UITableView {
    
    struct TableViewPublisher: Publisher {
        public typealias Output = Void
        public typealias Failure = Never
        
        let tableView: UITableView
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = TableViewSubscription(tableView: self.tableView, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }
    
    class TableViewSubscription<DelegateEventSubscriber: Subscriber>: NSObject, Subscription, UITableViewDelegate where DelegateEventSubscriber.Input == Void, DelegateEventSubscriber.Failure == Never {
        
        weak private var tableView: UITableView?
        private var subscriber: DelegateEventSubscriber?
        
        init(tableView: UITableView, subscriber: DelegateEventSubscriber? = nil) {
            self.tableView = tableView
            self.subscriber = subscriber
            super.init()
            
            tableView.delegate = self
        }
        
        public func request(_ demand: Subscribers.Demand) {}
        public func cancel() {
            subscriber = nil
            tableView?.delegate = nil
        }
        
        public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            _ = subscriber?.receive()
        }
    }
}

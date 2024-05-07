//
//  UIBarButtonItem+Combine.swift
//  Contraintify
//
//  Created by Swagat Mishra on 5/1/24.
//

import UIKit
import Combine

public extension UIBarButtonItem {

    // MARK: - Publisher
    struct BarButtonItemPublisher: Publisher {
        public typealias Output = Void
        public typealias Failure = Never
        
        let barButtonItem: UIBarButtonItem
        
        init(barButtonItem: UIBarButtonItem) {
            self.barButtonItem = barButtonItem
        }
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Void == S.Input {
            let subscription = BarButtonSubscription(barButtonItem: self.barButtonItem, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }
    
    // MARK: - Subscription
    class BarButtonSubscription<BarButtonSubscriber: Subscriber, BarButtonItem: UIBarButtonItem>: Subscription where BarButtonSubscriber.Input == Void, BarButtonSubscriber.Failure == Never {
        weak private var barButtonItem: BarButtonItem?
        private var subscriber: BarButtonSubscriber?

        init(barButtonItem: BarButtonItem, subscriber: BarButtonSubscriber? = nil) {
            self.barButtonItem = barButtonItem
            self.subscriber = subscriber
            
            barButtonItem.target = self
            barButtonItem.action = #selector(barButtonItemTapped)
        }
        
        @objc func barButtonItemTapped() {
            _ = subscriber?.receive()
        }
        
        public func request(_ demand: Subscribers.Demand) {}
        
        public func cancel() {
            subscriber = nil
            barButtonItem?.target = nil
            barButtonItem?.action = nil
        }
    }
}

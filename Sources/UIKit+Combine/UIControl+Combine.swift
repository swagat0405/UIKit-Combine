//
//  UIControl+Combine.swift
//  Contraintify
//
//  Created by Swagat Mishra on 5/1/24.
//

import Combine
import UIKit

public extension UIControl {
    
    struct Publisher<Control: UIControl>: Combine.Publisher {
        public typealias Output = Control
        public typealias Failure = Never
        
        let control: Control
        let event: UIControl.Event
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Control == S.Input {
            let subscription = ControlSubscription(control: control, event: event, subscriber: subscriber)
            subscriber.receive(subscription: subscription)
        }
    }

    class ControlSubscription<ControlEventSubscriber: Subscriber, Control: UIControl>: Subscription where ControlEventSubscriber.Input == Control, ControlEventSubscriber.Failure == Never {
        let control: Control
        var subscriber: ControlEventSubscriber?
        let event: Control.Event
        
        init(control: Control, event: UIControl.Event, subscriber: ControlEventSubscriber? = nil) {
            self.control = control
            self.subscriber = subscriber
            self.event = event
            
            control.addTarget(self, action: #selector(controlEventTriggered), for: event)
        }
        
        @objc func controlEventTriggered() {
            _ = subscriber?.receive(control)
        }
        
        public func request(_ demand: Subscribers.Demand) { }
        
        public func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(controlEventTriggered), for: event)
        }
    }
}

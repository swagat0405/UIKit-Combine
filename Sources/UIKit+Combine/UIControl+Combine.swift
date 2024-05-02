//
//  UIControl+Combine.swift
//  Contraintify
//
//  Created by Swagat Mishra on 5/1/24.
//

import Combine
import UIKit

extension UIControl {
    
    struct ControlPublisher<Control: UIControl>: Publisher {
        typealias Output = Control
        typealias Failure = Never
        
        let control: Control
        let event: UIControl.Event
        
        func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Control == S.Input {
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
        
        func request(_ demand: Subscribers.Demand) { }
        
        func cancel() {
            subscriber = nil
            control.removeTarget(self, action: #selector(controlEventTriggered), for: event)
        }
    }
}

protocol Combinable {}
extension UIControl: Combinable {}

extension Combinable where Self: UIControl {
    func publisher(for event: UIControl.Event) -> UIControl.ControlPublisher<Self> {
        UIControl.ControlPublisher(control: self, event: event)
    }
}

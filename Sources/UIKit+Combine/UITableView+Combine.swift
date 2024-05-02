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
        public typealias Output = IndexPath?
        public typealias Failure = Never
        
        let tableView: UITableView
        var rowHeight: CGFloat? = nil
        let height: ((UITableView, IndexPath) -> CGFloat)? = nil
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, IndexPath? == S.Input {
            let subscription = TableViewSubscription(tableView: self.tableView, subscriber: subscriber, height: rowHeight ?? UITableView.automaticDimension, rowHeight: height)
            subscriber.receive(subscription: subscription)
        }
    }
    
    class TableViewSubscription<DelegateEventSubscriber: Subscriber>: NSObject, Subscription, UITableViewDelegate where DelegateEventSubscriber.Input == IndexPath?, DelegateEventSubscriber.Failure == Never {
        
        weak private var tableView: UITableView?
        private var subscriber: DelegateEventSubscriber?
        private var height: CGFloat
        let rowHeight: ((UITableView, IndexPath) -> CGFloat)?
        
        init(
            tableView: UITableView,
            subscriber: DelegateEventSubscriber? = nil,
            height: CGFloat = UITableView.automaticDimension,
            rowHeight: ((UITableView, IndexPath) -> CGFloat)?
        ) {
            self.tableView = tableView
            self.subscriber = subscriber
            self.height = height
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
        public func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        public func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, willBeginEditingRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        public func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        public func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, performPrimaryActionForRowAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        public func tableView(_ tableView: UITableView, didBeginMultipleSelectionInteractionAt indexPath: IndexPath) {
            _ = subscriber?.receive(indexPath)
        }
        
        
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//            _ = subscriber?.receive(indexPath)
//            return height
            rowHeight!(tableView, indexPath)
        }
        public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            _ = subscriber?.receive(indexPath)
            return height
        }
        
    }
}

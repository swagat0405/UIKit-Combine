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
        public typealias Output = Any?
        public typealias Failure = Never
        
        let tableView: UITableView
        var action: ((Int) -> Any)? = nil
        
        public func receive<S>(subscriber: S) where S : Subscriber, Never == S.Failure, Any? == S.Input {
            let subscription =
            TableViewSubscription(
                tableView: self.tableView,
                subscriber: subscriber,
                action: action
            )
            subscriber.receive(subscription: subscription)
        }
    }
    
    class TableViewSubscription<DelegateEventSubscriber: Subscriber>: NSObject, Subscription, UITableViewDelegate where DelegateEventSubscriber.Input == Any?, DelegateEventSubscriber.Failure == Never {
        
        weak private var tableView: UITableView?
        private var subscriber: DelegateEventSubscriber?
        private var action: ((Int) -> Any)?
        
        init(
            tableView: UITableView,
            subscriber: DelegateEventSubscriber? = nil,
            action: ((Int) -> Any)?
        ) {
            self.tableView = tableView
            self.subscriber = subscriber
            self.action = action
            super.init()
            
            tableView.delegate = self
        }
        
        public func request(_ demand: Subscribers.Demand) {}
        public func cancel() {
            subscriber = nil
            tableView?.delegate = nil
        }
        
        // MARK: - IndexPath -> Void
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
        
        // MARK: - IndexPath -> CGFloat
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            guard 
                let action = action,
                let height = action(indexPath.row) as? CGFloat
            else { return tableView.estimatedRowHeight }
            return height
        }
        public func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
            guard 
                let action = action,
                let height = action(indexPath.row) as? CGFloat
            else { return tableView.estimatedRowHeight }
            return height
        }
        
        // MARK: - IndexPath -> Bool
        public func tableView(_ tableView: UITableView, canFocusRowAt indexPath: IndexPath) -> Bool {
            guard 
                let action = action,
                let focus = action(indexPath.row) as? Bool
            else { return false }
            return focus
        }
        public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
            guard
                let action = action,
                let highlight = action(indexPath.row) as? Bool
            else { return false }
            return highlight
        }
        public func tableView(_ tableView: UITableView, selectionFollowsFocusForRowAt indexPath: IndexPath) -> Bool {
            guard
                let action = action,
                let focus = action(indexPath.row) as? Bool
            else { return false }
            return focus
        }
        public func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
            guard
                let action = action,
                let shouldIndent = action(indexPath.row) as? Bool
            else { return false }
            return shouldIndent
        }
        public func tableView(_ tableView: UITableView, canPerformPrimaryActionForRowAt indexPath: IndexPath) -> Bool {
            guard
                let action = action,
                let canPerform = action(indexPath.row) as? Bool
            else { return false }
            return canPerform
        }
        public func tableView(_ tableView: UITableView, shouldBeginMultipleSelectionInteractionAt indexPath: IndexPath) -> Bool {
            guard
                let action = action,
                let multipleSelection = action(indexPath.row) as? Bool
            else { return false }
            return multipleSelection
        }
        
        // MARK: - IndexPath -> IndexPath
        public func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            guard let action = action else { return nil }
            return (action(indexPath.row) as? IndexPath?) ?? nil
        }
        
        public func tableView(_ tableView: UITableView, willDeselectRowAt indexPath: IndexPath) -> IndexPath? {
            guard let action = action else { return nil }
            return (action(indexPath.row) as? IndexPath?) ?? nil
        }
        
        // MARK: - UITableViewFocusUpdateContext -> Bool
//        public func tableView(_ tableView: UITableView, shouldUpdateFocusIn context: UITableViewFocusUpdateContext) -> Bool {
//            guard let action = action else { return false }
//            return (action(context) as? Bool) ?? false
//        }
        
        // MARK: - IndexPath -> UITableViewCell.EditingStyle
        public func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            guard let action = action else { return .none }
            return (action(indexPath.row) as? UITableViewCell.EditingStyle) ?? .none
        }
        
        // MARK: - IndexPath -> Int
        public func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
            guard let action = action else { return 0 }
            return (action(indexPath.row) as? Int) ?? 0
        }
        
        // MARK: - Section Delegate methods
        public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
            guard
                let action = action,
                let height = action(section) as? CGFloat
            else { return UITableView.automaticDimension }
            return height
        }
        
        public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            guard
                let action = action,
                let height = action(section) as? CGFloat
            else { return UITableView.automaticDimension }
            return height
        }
        
        public func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
            guard
                let action = action,
                let height = action(section) as? CGFloat
            else { return UITableView.automaticDimension }
            return height
        }
        
        public func tableView(_ tableView: UITableView, estimatedHeightForFooterInSection section: Int) -> CGFloat {
            guard
                let action = action,
                let height = action(section) as? CGFloat
            else { return UITableView.automaticDimension }
            return height
        }
        
        public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            guard
                let action = action,
                let height = action(section) as? UIView
            else { return nil }
            return height
        }
        
        public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
            guard
                let action = action,
                let height = action(section) as? UIView
            else { return nil }
            return height
        }
        
        public func tableView(_ tableView: UITableView, didUpdateFocusIn context: UITableViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
            _ = subscriber?.receive((context, coordinator))
        }
        
        public func tableViewDidEndMultipleSelectionInteraction(_ tableView: UITableView) {
            _ = subscriber?.receive(nil)
        }
        
        public func tableView(_ tableView: UITableView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
            _ = subscriber?.receive((configuration, animator))
        }
        
        public func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {
            _ = subscriber?.receive((view, section))
        }
        
        public func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
            _ = subscriber?.receive((view, section))
        }
        
        public func tableView(_ tableView: UITableView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
            _ = subscriber?.receive((configuration, animator))
        }
        
        public func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            guard
                let action = action,
                let swipeActions = action(indexPath.row) as? UISwipeActionsConfiguration
            else { return nil }
            return swipeActions
        }
        
        public func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            guard
                let action = action,
                let swipeActions = action(indexPath.row) as? UISwipeActionsConfiguration
            else { return nil }
            return swipeActions
        }
        
        public func tableView(_ tableView: UITableView, didEndDisplayingFooterView view: UIView, forSection section: Int) {
            _ = subscriber?.receive((view, section))
        }
        
        public func tableView(_ tableView: UITableView, didEndDisplayingHeaderView view: UIView, forSection section: Int) {
            _ = subscriber?.receive((view, section))
        }
        
//        public func tableView(_ tableView: UITableView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
//            guard
//                let action = action,
//                let preview = action(configuration) as? UITargetedPreview
//            else { return nil }
//            return preview
//        }
        
        public func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
            guard
                let action = action,
                let menu = action(indexPath.row) as? UIContextMenuConfiguration
            else { return nil }
            return menu
        }
        
        public func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
            guard
                let action = action,
                let title = action(indexPath.row) as? String
            else { return nil }
            return title
        }
        
//        public func tableView(_ tableView: UITableView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
//            guard
//                let action = action,
//                let preview = action(configuration) as? UITargetedPreview
//            else { return nil }
//            return preview
//        }
        
        public func tableView(_ tableView: UITableView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating) {
            _ = subscriber?.receive((configuration, animator))
        }
        
//        public func tableView(_ tableView: UITableView, targetIndexPathForMoveFromRowAt sourceIndexPath: IndexPath, toProposedIndexPath proposedDestinationIndexPath: IndexPath) -> IndexPath {
//            guard
//                let action = action,
//                let indexPath = action((sourceIndexPath, proposedDestinationIndexPath)) as? IndexPath
//            else { return IndexPath(item: 0, section: 0) }
//            return indexPath
//        }
        
        //        public func tableView(_ tableView: UITableView, shouldSpringLoadRowAt indexPath: IndexPath, with context: any UISpringLoadedInteractionContext) -> Bool {
        //            guard
        //                let action = action,
        //                let load = action((indexPath, context)) as? Bool
        //            else { return false }
        //            return load
        //        }
    }
}

public extension UITableView {
    enum TableViewDelegateActions {
        case didSelectRow
        case didDeselectRow
        case willDisplayCell
        case didEndDisplayingCell
        case willBeginEditingRow
        case didEndEditingRow
        case didHighlightRow
        case didUnHighlightRow
        case accessoryButtonTappedForRow
        case performPrimaryActionForRow
        case didBeginMultipleSelectionInteraction
        case didEndMultipleSelectionInteraction
        case heightForRow(((Int) -> CGFloat)?)
        case estimatedHeightForRow
        case canFocusRow
        case shouldHighlightRow
        case selectionFollowsFocusForRow
        case shouldIndentWhileEditingRow
        case canPerformPrimaryActionForRow
        case shouldBeginMultipleSelectionInteraction
        case willSelectRow
        case willDeselectRow
        case editingStyleForRow
        case indentationLevelForRow
        case heightForFooterInSection
        case heightForHeaderInSection
        case estimatedHeightForHeaderInSection
        case estimatedHeightForFooterInSection
        case viewForHeaderInSection
        case viewForFooterInSection
        case disUpdateFocusIn
        case willDisplayContextMenu
        case willDisplayFooterView
        case willDisplayHeaderView
        case willEndContextMenuInteraction
        case leadingSwipeActionsConfigurationForRow
        case trailingSwipeActionsConfigurationForRow
        case didEndDisplayingFooterView
        case didEndDisplayingHeaderView
        case contextMenuConfigurationForRow
        case titleForDeleteConfirmationButtonForRow
        case willPerformPreviewActionForMenu
    }
}

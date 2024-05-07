//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

// MARK: - CollectionViewManager+CollectionViewDelegate
extension CollectionViewManager: CollectionViewDelegate {
    func actions(
        shouldHighlightItem: ((IndexPath) -> Bool)?,
        shouldSelectItem: ((IndexPath) -> Bool)?,
        shouldDeSelectItem: ((IndexPath) -> Bool)?,
        canPeformPrimaryAction: ((IndexPath) -> Bool)?,
        shouldShowMenuItem: ((IndexPath) -> Bool)?,
        canPeformAction: ((Selector, IndexPath, Any?) -> Bool)?,
        transitionLayoutForOldLayout: ((UICollectionViewLayout, UICollectionViewLayout) -> UICollectionViewTransitionLayout)?,
        canFocusItem: ((IndexPath) -> Bool)?,
        shouldUpdateFocus: ((UICollectionViewFocusUpdateContext) -> Bool)?,
        indexPathForPreferredFocusedView: (() -> IndexPath?)?,
        selectionFollowsFocusForItemAt: ((IndexPath) -> Bool)?,
        targetIndexPathForMoveOfItemFromOriginalIndexPath: ((IndexPath, IndexPath, IndexPath) -> IndexPath)?,
        targetIndexPathForMoveFromItemAt: ((IndexPath, IndexPath) -> IndexPath)?,
        canEditItemAt: ((IndexPath) -> Bool)?,
        contextMenuConfigurationForItemsAt: (([IndexPath], CGPoint) -> UIContextMenuConfiguration?)?,
        highlightPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)?,
        dismissalPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)?,
        contextMenuConfigurationForItem: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)?,
        previewForHighlightingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)?,
        previewForDismissingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)?
    ) {
        self.shouldHighlightItem = shouldHighlightItem
        self.shouldSelectItem = shouldSelectItem
        self.shouldDeSelectItem = shouldDeSelectItem
        self.canPeformPrimaryAction = canPeformPrimaryAction
        self.shouldShowMenuItem = shouldShowMenuItem
        self.canPeformAction = canPeformAction
        self.transitionLayoutForOldLayout = transitionLayoutForOldLayout
        self.canFocusItem = canFocusItem
        self.shouldUpdateFocus = shouldUpdateFocus
        self.indexPathForPreferredFocusedView = indexPathForPreferredFocusedView
        self.selectionFollowsFocusForItemAt = selectionFollowsFocusForItemAt
        self.targetIndexPathForMoveOfItemFromOriginalIndexPath = targetIndexPathForMoveOfItemFromOriginalIndexPath
        self.targetIndexPathForMoveFromItemAt = targetIndexPathForMoveFromItemAt
        self.canEditItemAt = canEditItemAt
        self.contextMenuConfigurationForItemsAt = contextMenuConfigurationForItemsAt
        self.highlightPreviewForItem = highlightPreviewForItem
        self.dismissalPreviewForItem = dismissalPreviewForItem
        self.contextMenuConfigurationForItem = contextMenuConfigurationForItem
        self.previewForHighlightingContextMenu = previewForDismissingContextMenu
        self.previewForDismissingContextMenu = previewForDismissingContextMenu
    }
    
    var onDidHighlightItemSubject: AnyPublisher<IndexPath, Never> {
        didHighlightItemSubject.eraseToAnyPublisher()
    }
    var onDidUnHighlightItemSubject: AnyPublisher<IndexPath, Never> {
        didUnHighlightItemSubject.eraseToAnyPublisher()
    }
    var onDidSelectItemSubject: AnyPublisher<IndexPath, Never> {
        didSelectItemSubject.eraseToAnyPublisher()
    }
    var onDidDeSelectItemSubject: AnyPublisher<IndexPath, Never> {
        didDeSelectItemSubject.eraseToAnyPublisher()
    }
    var onPerformPrimaryActionSubject: AnyPublisher<IndexPath, Never> {
        performPrimaryActionSubject.eraseToAnyPublisher()
    }
    var onWillDisplayCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> {
        willDisplayCellSubject.eraseToAnyPublisher()
    }
    var onDidEndDisplayingCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> {
        didEndDisplayingCellSubject.eraseToAnyPublisher()
    }
    var onWillDisplaySupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> {
        willDisplaySupplementaryViewSubject.eraseToAnyPublisher()
    }
    var onDidEndDisplayingSupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> {
        didEndDisplayingSupplementaryViewSubject.eraseToAnyPublisher()
    }
    var onPerformActionSubject: AnyPublisher<(Selector, IndexPath, Any?), Never> {
        performActionSubject.eraseToAnyPublisher()
    }
    var onDidUpdateFocusSubject: AnyPublisher<(UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator), Never> {
        didUpdateFocusSubject.eraseToAnyPublisher()
    }
    var onWillPerformPreviewActionForMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionCommitAnimating)), Never> {
        willPerformPreviewActionForMenuSubject.eraseToAnyPublisher()
    }
    var onWillDisplayContextMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> {
        willDisplayContextMenuSubject.eraseToAnyPublisher()
    }
    var onWillEndContextMenuInteractionSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> {
        willEndContextMenuInteractionSubject.eraseToAnyPublisher()
    }
}

// MARK: - CollectionViewManager+UICollectionViewDelegate
extension CollectionViewManager {
    func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        shouldHighlightItem?(indexPath) ?? true
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        didHighlightItemSubject.send(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        didUnHighlightItemSubject.send(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        shouldSelectItem?(indexPath) ?? true
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldDeselectItemAt indexPath: IndexPath) -> Bool {
        shouldDeSelectItem?(indexPath) ?? true
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        didSelectItemSubject.send(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        didDeSelectItemSubject.send(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, canPerformPrimaryActionForItemAt indexPath: IndexPath) -> Bool {
        canPeformPrimaryAction?(indexPath) ?? true
    }
    
    func collectionView(_ collectionView: UICollectionView, performPrimaryActionForItemAt indexPath: IndexPath) {
        performPrimaryActionSubject.send(indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        willDisplayCellSubject.send((cell, indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplaySupplementaryView view: UICollectionReusableView, forElementKind elementKind: String, at indexPath: IndexPath) {
        willDisplaySupplementaryViewSubject.send((view, elementKind, indexPath))
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        didEndDisplayingCellSubject.send((cell, indexPath))
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplayingSupplementaryView view: UICollectionReusableView, forElementOfKind elementKind: String, at indexPath: IndexPath) {
        didEndDisplayingSupplementaryViewSubject.send((view, elementKind, indexPath))
    }

    func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        shouldShowMenuItem?(indexPath) ?? false
    }

    func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        canPeformAction?(action, indexPath, sender) ?? false
    }

    func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
        performActionSubject.send((action, indexPath, sender))
    }

    func collectionView(_ collectionView: UICollectionView, transitionLayoutForOldLayout fromLayout: UICollectionViewLayout, newLayout toLayout: UICollectionViewLayout) -> UICollectionViewTransitionLayout {
        transitionLayoutForOldLayout?(fromLayout, toLayout) ?? UICollectionViewTransitionLayout(currentLayout: collectionView.collectionViewLayout, nextLayout: collectionView.collectionViewLayout)
    }

    func collectionView(_ collectionView: UICollectionView, canFocusItemAt indexPath: IndexPath) -> Bool {
        canFocusItem?(indexPath) ?? true
    }

    func collectionView(_ collectionView: UICollectionView, shouldUpdateFocusIn context: UICollectionViewFocusUpdateContext) -> Bool {
        shouldUpdateFocus?(context) ?? true
    }

    func collectionView(_ collectionView: UICollectionView, didUpdateFocusIn context: UICollectionViewFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
        didUpdateFocusSubject.send((context, coordinator))
    }

    func indexPathForPreferredFocusedView(in collectionView: UICollectionView) -> IndexPath? {
        indexPathForPreferredFocusedView?()
    }

    func collectionView(_ collectionView: UICollectionView, selectionFollowsFocusForItemAt indexPath: IndexPath) -> Bool {
        selectionFollowsFocusForItemAt?(indexPath) ?? true
    }

    
    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveOfItemFromOriginalIndexPath originalIndexPath: IndexPath, atCurrentIndexPath currentIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        targetIndexPathForMoveOfItemFromOriginalIndexPath?(originalIndexPath, currentIndexPath, proposedIndexPath) ?? .init()
    }

    func collectionView(_ collectionView: UICollectionView, targetIndexPathForMoveFromItemAt currentIndexPath: IndexPath, toProposedIndexPath proposedIndexPath: IndexPath) -> IndexPath {
        targetIndexPathForMoveFromItemAt?(currentIndexPath, proposedIndexPath) ?? .init()
    }

    
    func collectionView(_ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath) -> Bool {
        canEditItemAt?(indexPath) ?? false
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        contextMenuConfigurationForItemsAt?(indexPaths, point)
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfiguration configuration: UIContextMenuConfiguration, highlightPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview? {
        highlightPreviewForItem?(configuration, indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfiguration configuration: UIContextMenuConfiguration, dismissalPreviewForItemAt indexPath: IndexPath) -> UITargetedPreview? {
        dismissalPreviewForItem?(configuration, indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, willPerformPreviewActionForMenuWith configuration: UIContextMenuConfiguration, animator: any UIContextMenuInteractionCommitAnimating) {
        willPerformPreviewActionForMenuSubject.send((configuration, animator))
    }

    func collectionView(_ collectionView: UICollectionView, willDisplayContextMenu configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        willDisplayContextMenuSubject.send((configuration, animator))
    }

    func collectionView(_ collectionView: UICollectionView, willEndContextMenuInteraction configuration: UIContextMenuConfiguration, animator: (any UIContextMenuInteractionAnimating)?) {
        willEndContextMenuInteractionSubject.send((configuration, animator))
    }

    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        contextMenuConfigurationForItem?(indexPath, point)
    }

    func collectionView(_ collectionView: UICollectionView, previewForHighlightingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        previewForHighlightingContextMenu?(configuration)
    }

    func collectionView(_ collectionView: UICollectionView, previewForDismissingContextMenuWithConfiguration configuration: UIContextMenuConfiguration) -> UITargetedPreview? {
        previewForDismissingContextMenu?(configuration)
    }

}

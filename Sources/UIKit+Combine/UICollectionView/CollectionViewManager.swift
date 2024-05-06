//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

final class CollectionViewManager: NSObject {
    
    // MARK: - Data Source Properties
    var sections: (() -> Int)?
    var itemsInSection: ((Int) -> Int)!
    var cellBuilder: ((IndexPath) -> UICollectionViewCell)!
    var viewForSupplementaryElement: ((String, IndexPath) -> UICollectionReusableView)?
    var canMoveItem: ((IndexPath) -> Bool)?
    var moveItem: ((IndexPath, IndexPath) -> Void)?
    var indexTitles: ((UICollectionView) -> [String]?)?
    var indexPathForIndexTitle: ((String, Int) -> IndexPath)?
    
    // MARK: - Delegate Properties
    var shouldHighlightItem: ((IndexPath) -> Bool)?
    var shouldSelectItem: ((IndexPath) -> Bool)?
    var shouldDeSelectItem: ((IndexPath) -> Bool)?
    var canPeformPrimaryAction: ((IndexPath) -> Bool)?
    var shouldShowMenuItem: ((IndexPath) -> Bool)?
    var canPeformAction: ((Selector, IndexPath, Any?) -> Bool)?
    var transitionLayoutForOldLayout: ((UICollectionViewLayout, UICollectionViewLayout) -> UICollectionViewTransitionLayout)?
    var canFocusItem: ((IndexPath) -> Bool)?
    var shouldUpdateFocus: ((UICollectionViewFocusUpdateContext) -> Bool)?
    var indexPathForPreferredFocusedView: (() -> IndexPath?)?
    var selectionFollowsFocusForItemAt: ((IndexPath) -> Bool)?
    var targetIndexPathForMoveOfItemFromOriginalIndexPath: ((IndexPath, IndexPath, IndexPath) -> IndexPath)?
    var targetIndexPathForMoveFromItemAt: ((IndexPath, IndexPath) -> IndexPath)?
    var canEditItemAt: ((IndexPath) -> Bool)?
    var contextMenuConfigurationForItemsAt: (([IndexPath], CGPoint) -> UIContextMenuConfiguration?)?
    var highlightPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)?
    var dismissalPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)?
    var contextMenuConfigurationForItem: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)?
    var previewForHighlightingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)?
    var previewForDismissingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)?
    
     
    var didHighlightItemSubject = PassthroughSubject<IndexPath, Never>()
    var didUnHighlightItemSubject = PassthroughSubject<IndexPath, Never>()
    var didSelectItemSubject = PassthroughSubject<IndexPath, Never>()
    var didDeSelectItemSubject = PassthroughSubject<IndexPath, Never>()
    var performPrimaryActionSubject = PassthroughSubject<IndexPath, Never>()
    var willDisplayCellSubject = PassthroughSubject<(UICollectionViewCell, IndexPath), Never>()
    var didEndDisplayingCellSubject = PassthroughSubject<(UICollectionViewCell, IndexPath), Never>()
    var willDisplaySupplementaryViewSubject = PassthroughSubject<(UICollectionReusableView, String, IndexPath), Never>()
    var didEndDisplayingSupplementaryViewSubject = PassthroughSubject<(UICollectionReusableView, String, IndexPath), Never>()
    var performActionSubject = PassthroughSubject<(Selector, IndexPath, Any?), Never>()
    var didUpdateFocusSubject = PassthroughSubject<(UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator), Never>()
    var willPerformPreviewActionForMenuSubject = PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionCommitAnimating)), Never>()
    var willDisplayContextMenuSubject = PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never>()
    var willEndContextMenuInteractionSubject = PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never>()

}


extension CollectionViewManager: UICollectionViewDelegate {
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

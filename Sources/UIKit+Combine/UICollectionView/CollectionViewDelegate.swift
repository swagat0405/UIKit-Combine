//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

// MARK: - CollectionViewDelegate
protocol CollectionViewDelegate {
    // MARK: - Actions
    var shouldHighlightItem: ((IndexPath) -> Bool)? { get }
    var shouldSelectItem: ((IndexPath) -> Bool)? { get }
    var shouldDeSelectItem: ((IndexPath) -> Bool)? { get }
    var canPeformPrimaryAction: ((IndexPath) -> Bool)? { get }
    var shouldShowMenuItem: ((IndexPath) -> Bool)? { get }
    var canPeformAction: ((Selector, IndexPath, Any?) -> Bool)? { get }
    var transitionLayoutForOldLayout: ((UICollectionViewLayout, UICollectionViewLayout) -> UICollectionViewTransitionLayout)? { get }
    var canFocusItem: ((IndexPath) -> Bool)? { get }
    var shouldUpdateFocus: ((UICollectionViewFocusUpdateContext) -> Bool)? { get }
    var indexPathForPreferredFocusedView: (() -> IndexPath?)? { get }
    var selectionFollowsFocusForItemAt: ((IndexPath) -> Bool)? { get }
    var targetIndexPathForMoveOfItemFromOriginalIndexPath: ((IndexPath, IndexPath, IndexPath) -> IndexPath)? { get }
    var targetIndexPathForMoveFromItemAt: ((IndexPath, IndexPath) -> IndexPath)? { get }
    var canEditItemAt: ((IndexPath) -> Bool)? { get }
    var contextMenuConfigurationForItemsAt: (([IndexPath], CGPoint) -> UIContextMenuConfiguration?)? { get }
    var highlightPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)? { get }
    var dismissalPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)? { get }
    var contextMenuConfigurationForItem: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? { get }
    var previewForHighlightingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)? { get }
    var previewForDismissingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)? { get }
    
    // MARK: - Publishers
    var didHighlightItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didUnHighlightItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didSelectItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didDeSelectItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var performPrimaryActionSubject: PassthroughSubject<IndexPath, Never> { get }
    var willDisplayCellSubject: PassthroughSubject<(UICollectionViewCell, IndexPath), Never> { get }
    var didEndDisplayingCellSubject: PassthroughSubject<(UICollectionViewCell, IndexPath), Never> { get }
    var willDisplaySupplementaryViewSubject: PassthroughSubject<(UICollectionReusableView, String, IndexPath), Never> { get }
    var didEndDisplayingSupplementaryViewSubject: PassthroughSubject<(UICollectionReusableView, String, IndexPath), Never> { get }
    var performActionSubject: PassthroughSubject<(Selector, IndexPath, Any?), Never> { get }
    var didUpdateFocusSubject: PassthroughSubject<(UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator), Never> { get }
    var willPerformPreviewActionForMenuSubject: PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionCommitAnimating)), Never> { get }
    var willDisplayContextMenuSubject: PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> { get }
    var willEndContextMenuInteractionSubject: PassthroughSubject<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> { get }
}

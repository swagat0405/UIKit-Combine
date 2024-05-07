//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

// MARK: - CollectionViewDelegate
protocol CollectionViewDelegate: UICollectionViewDelegate {
    // MARK: - Actions
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
    )
    
    // MARK: - Publishers
    var onDidHighlightItemSubject: AnyPublisher<IndexPath, Never> { get }
    var onDidUnHighlightItemSubject: AnyPublisher<IndexPath, Never> { get }
    var onDidSelectItemSubject: AnyPublisher<IndexPath, Never> { get }
    var onDidDeSelectItemSubject: AnyPublisher<IndexPath, Never> { get }
    var onPerformPrimaryActionSubject: AnyPublisher<IndexPath, Never> { get }
    var onWillDisplayCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> { get }
    var onDidEndDisplayingCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> { get }
    var onWillDisplaySupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> { get }
    var onDidEndDisplayingSupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> { get }
    var onPerformActionSubject: AnyPublisher<(Selector, IndexPath, Any?), Never> { get }
    var onDidUpdateFocusSubject: AnyPublisher<(UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator), Never> { get }
    var onWillPerformPreviewActionForMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionCommitAnimating)), Never> { get }
    var onWillDisplayContextMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> { get }
    var onWillEndContextMenuInteractionSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> { get }
}

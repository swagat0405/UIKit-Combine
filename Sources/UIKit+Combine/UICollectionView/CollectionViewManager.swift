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

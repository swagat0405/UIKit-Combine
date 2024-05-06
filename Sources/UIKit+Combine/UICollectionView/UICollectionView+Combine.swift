//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

public final class UICollectionView_Combine: UICollectionView {
    private lazy var manager = CollectionViewManager()
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = manager
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func build(
        sections: (() -> Int)? = nil,
        itemsInSection: @escaping ((Int) -> Int),
        cellBuilder: @escaping ((IndexPath) -> UICollectionViewCell),
        viewForSupplementaryElement: ((String, IndexPath) -> UICollectionReusableView)? = nil,
        canMoveItem: ((IndexPath) -> Bool)? = nil,
        moveItem: ((IndexPath, IndexPath) -> Void)? = nil,
        indexTitles: ((UICollectionView) -> [String]?)? = nil,
        indexPathForIndexTitle: ((String, Int) -> IndexPath)? = nil
    ) {
        manager.build(
            sections: sections,
            itemsInSection: itemsInSection,
            cellBuilder: cellBuilder,
            viewForSupplementaryElement: viewForSupplementaryElement,
            canMoveItem: canMoveItem,
            moveItem: moveItem,
            indexTitles: indexTitles,
            indexPathForIndexTitle: indexPathForIndexTitle
        )
    }
    
    public func delegateActions(
        shouldHighlightItem: ((IndexPath) -> Bool)? = nil,
        shouldSelectItem: ((IndexPath) -> Bool)? = nil,
        shouldDeSelectItem: ((IndexPath) -> Bool)? = nil,
        canPeformPrimaryAction: ((IndexPath) -> Bool)? = nil,
        shouldShowMenuItem: ((IndexPath) -> Bool)? = nil,
        canPeformAction: ((Selector, IndexPath, Any?) -> Bool)? = nil,
        transitionLayoutForOldLayout: ((UICollectionViewLayout, UICollectionViewLayout) -> UICollectionViewTransitionLayout)? = nil,
        canFocusItem: ((IndexPath) -> Bool)? = nil,
        shouldUpdateFocus: ((UICollectionViewFocusUpdateContext) -> Bool)? = nil,
        indexPathForPreferredFocusedView: (() -> IndexPath?)? = nil,
        selectionFollowsFocusForItemAt: ((IndexPath) -> Bool)? = nil,
        targetIndexPathForMoveOfItemFromOriginalIndexPath: ((IndexPath, IndexPath, IndexPath) -> IndexPath)? = nil,
        targetIndexPathForMoveFromItemAt: ((IndexPath, IndexPath) -> IndexPath)? = nil,
        canEditItemAt: ((IndexPath) -> Bool)? = nil,
        contextMenuConfigurationForItemsAt: (([IndexPath], CGPoint) -> UIContextMenuConfiguration?)? = nil,
        highlightPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)? = nil,
        dismissalPreviewForItem: ((UIContextMenuConfiguration, IndexPath) -> UITargetedPreview?)? = nil,
        contextMenuConfigurationForItem: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
        previewForHighlightingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)? = nil,
        previewForDismissingContextMenu: ((UIContextMenuConfiguration) -> UITargetedPreview?)? = nil
    ) {
        manager.actions(
            shouldHighlightItem: shouldHighlightItem,
            shouldSelectItem: shouldSelectItem,
            shouldDeSelectItem: shouldDeSelectItem,
            canPeformPrimaryAction: canPeformPrimaryAction,
            shouldShowMenuItem: shouldShowMenuItem,
            canPeformAction: canPeformAction,
            transitionLayoutForOldLayout: transitionLayoutForOldLayout,
            canFocusItem: canFocusItem,
            shouldUpdateFocus: shouldUpdateFocus,
            indexPathForPreferredFocusedView: indexPathForPreferredFocusedView,
            selectionFollowsFocusForItemAt: selectionFollowsFocusForItemAt,
            targetIndexPathForMoveOfItemFromOriginalIndexPath: targetIndexPathForMoveOfItemFromOriginalIndexPath,
            targetIndexPathForMoveFromItemAt: targetIndexPathForMoveFromItemAt,
            canEditItemAt: canEditItemAt,
            contextMenuConfigurationForItemsAt: contextMenuConfigurationForItemsAt,
            highlightPreviewForItem: highlightPreviewForItem,
            dismissalPreviewForItem: dismissalPreviewForItem,
            contextMenuConfigurationForItem: contextMenuConfigurationForItem,
            previewForHighlightingContextMenu: previewForHighlightingContextMenu,
            previewForDismissingContextMenu: previewForDismissingContextMenu
        )
    }
    
    var onDidHighlightItemSubject: AnyPublisher<IndexPath, Never> {
        manager.didHighlightItemSubject.eraseToAnyPublisher()
    }
    var onDidUnHighlightItemSubject: AnyPublisher<IndexPath, Never> {
        manager.didUnHighlightItemSubject.eraseToAnyPublisher()
    }
    var onDidSelectItemSubject: AnyPublisher<IndexPath, Never> {
        manager.didSelectItemSubject.eraseToAnyPublisher()
    }
    var didDeSelectItemSubject: AnyPublisher<IndexPath, Never> {
        manager.didDeSelectItemSubject.eraseToAnyPublisher()
    }
    var performPrimaryActionSubject: AnyPublisher<IndexPath, Never> {
        manager.performPrimaryActionSubject.eraseToAnyPublisher()
    }
    var willDisplayCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> {
        manager.willDisplayCellSubject.eraseToAnyPublisher()
    }
    var didEndDisplayingCellSubject: AnyPublisher<(UICollectionViewCell, IndexPath), Never> {
        manager.didEndDisplayingCellSubject.eraseToAnyPublisher()
    }
    var willDisplaySupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> {
        manager.willDisplaySupplementaryViewSubject.eraseToAnyPublisher()
    }
    var didEndDisplayingSupplementaryViewSubject: AnyPublisher<(UICollectionReusableView, String, IndexPath), Never> {
        manager.didEndDisplayingSupplementaryViewSubject.eraseToAnyPublisher()
    }
    var performActionSubject: AnyPublisher<(Selector, IndexPath, Any?), Never> {
        manager.performActionSubject.eraseToAnyPublisher()
    }
    var didUpdateFocusSubject: AnyPublisher<(UICollectionViewFocusUpdateContext, UIFocusAnimationCoordinator), Never> {
        manager.didUpdateFocusSubject.eraseToAnyPublisher()
    }
    var willPerformPreviewActionForMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionCommitAnimating)), Never> {
        manager.willPerformPreviewActionForMenuSubject.eraseToAnyPublisher()
    }
    var willDisplayContextMenuSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> {
        manager.willDisplayContextMenuSubject.eraseToAnyPublisher()
    }
    var willEndContextMenuInteractionSubject: AnyPublisher<(UIContextMenuConfiguration, (any UIContextMenuInteractionAnimating)?), Never> {
        manager.willEndContextMenuInteractionSubject.eraseToAnyPublisher()
    }
}

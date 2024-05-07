//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/2/24.
//

//import UIKit
//import Combine

//public final class UITableView_Combine: UITableView {
//    public func build(
//        sections: (() -> Int)? = nil,
//        rowsInSection: (@escaping (Section) -> Int),
//        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
//        canEditRow: ((IndexPath) -> Bool)? = nil,
//        canMoveRow: ((IndexPath) -> Bool)? = nil,
//        moveRow: ((IndexPath, IndexPath) -> Void)? = nil,
//        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)? = nil,
//        footerTitle: ((Section) -> String?)? = nil,
//        headerTitle: ((Section) -> String?)? = nil,
//        heightForRow: ((IndexPath) -> CGFloat)? = nil,
//        heightForHeader: ((Section) -> CGFloat)? = nil,
//        heightForFooter: ((Section) -> CGFloat)? = nil,
//        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
//        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? = nil,
//        viewForFooterInSection: ((Section) -> UIView?)? = nil,
//        viewForHeaderInSection: ((Section) -> UIView?)? = nil,
//        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
//        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
//    ) {
//        manager.build(
//            sections: sections,
//            rowsInSection: rowsInSection,
//            cellBuilder: cellBuilder,
//            canEditRow: canEditRow,
//            canMoveRow: canMoveRow,
//            moveRow: moveRow,
//            commitEditingStyle: commitEditingStyle,
//            footerTitle: footerTitle,
//            headerTitle: headerTitle,
//            heightForRow: heightForRow,
//            heightForHeader: heightForHeader,
//            heightForFooter: heightForFooter,
//            estimatedHeightForRow: estimatedHeightForRow,
//            editingStyleForRow: editingStyleForRow,
//            viewForFooterInSection: viewForFooterInSection,
//            viewForHeaderInSection: viewForHeaderInSection,
//            leadingSwipeActionsConfigurationForRowAt: leadingSwipeActionsConfigurationForRowAt,
//            trailingSwipeActionsConfigurationForRowAt: trailingSwipeActionsConfigurationForRowAt,
//            contextMenuConfigurationForRowAt: contextMenuConfigurationForRowAt,
//            titleForDeleteConfirmationButtonForRowAt: titleForDeleteConfirmationButtonForRowAt
//        )
//    }
//    
//    // MARK: - Publishers
//    
//    public func delegateActions(
//        heightForRow: ((IndexPath) -> CGFloat)? = nil,
//        heightForHeader: ((Int) -> CGFloat)? = nil,
//        heightForFooter: ((Int) -> CGFloat)? = nil,
//        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
//        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)?,
//        viewForFooterInSection: ((Int) -> UIView?)? = nil,
//        viewForHeaderInSection: ((Int) -> UIView?)? = nil,
//        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
//        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
//    ) {
//        manager.heightForRow = heightForRow
//        manager.heightForHeader = heightForHeader
//        manager.heightForFooter = heightForFooter
//        manager.estimatedHeightForRow = estimatedHeightForRow
//        manager.editingStyleForRow = editingStyleForRow
//        manager.viewForFooterInSection = viewForFooterInSection
//        manager.viewForHeaderInSection = viewForHeaderInSection
//        manager.leadingSwipeActionsConfigurationForRowAt = leadingSwipeActionsConfigurationForRowAt
//        manager.trailingSwipeActionsConfigurationForRowAt = trailingSwipeActionsConfigurationForRowAt
//        manager.contextMenuConfigurationForRowAt = contextMenuConfigurationForRowAt
//        manager.titleForDeleteConfirmationButtonForRowAt = titleForDeleteConfirmationButtonForRowAt
//    }
//
//    var onDidSelectItem: AnyPublisher<IndexPath, Never> {
//        manager.selectedItemSubject.eraseToAnyPublisher()
//    }
//    var onDidUnselectItem: AnyPublisher<IndexPath, Never> {
//        manager.deSelectedItemSubject.eraseToAnyPublisher()
//    }
//    var onPerformPrimaryAction: AnyPublisher<IndexPath, Never> {
//        manager.performPrimaryActionAt.eraseToAnyPublisher()
//    }
//    var onDidEndEditing: AnyPublisher<IndexPath?, Never> {
//        manager.didEndEditingSubject.eraseToAnyPublisher()
//    }
//    var onAccessoryButtonTapped: AnyPublisher<IndexPath, Never> {
//        manager.accessoryButtonTappedForRowWith.eraseToAnyPublisher()
//    }
//}

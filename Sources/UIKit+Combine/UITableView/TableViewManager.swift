//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

final class TableViewManager: NSObject, TableViewDelegate, TableViewDataSource {
    // MARK: - DataSource
    var sections: (() -> Int)?
    var rowsInSection: ((Section) -> Int)?
    var cellBuilder: ((IndexPath) -> UITableViewCell)?
    var canEditRow: ((IndexPath) -> Bool)?
    var canMoveRow: ((IndexPath) -> Bool)?
    var moveRow:((IndexPath, IndexPath) -> Void)?
    var commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?
    var footerTitle: ((Int) -> String?)?
    var headerTitle: ((Int) -> String?)?
    
    func build(
        sections: (() -> Int)?,
        rowsInSection: (@escaping (Section) -> Int),
        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
        canEditRow: ((IndexPath) -> Bool)?,
        canMoveRow: ((IndexPath) -> Bool)?,
        moveRow: ((IndexPath, IndexPath) -> Void)?,
        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?,
        footerTitle: ((Int) -> String?)?,
        headerTitle: ((Int) -> String?)?,
        heightForRow: ((IndexPath) -> CGFloat)?,
        heightForHeader: ((Int) -> CGFloat)?,
        heightForFooter: ((Int) -> CGFloat)?,
        estimatedHeightForRow: ((IndexPath) -> CGFloat)?,
        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)?,
        viewForFooterInSection: ((Int) -> UIView?)?,
        viewForHeaderInSection: ((Int) -> UIView?)?,
        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?,
        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?,
        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)?,
        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)?
    ) {
        self.rowsInSection = rowsInSection
        self.sections = sections
        self.cellBuilder = cellBuilder
        self.canEditRow = canEditRow
        self.canMoveRow = canMoveRow
        self.moveRow = moveRow
        self.commitEditingStyle = commitEditingStyle
        self.footerTitle = footerTitle
        self.headerTitle = headerTitle
        self.heightForRow = heightForRow
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
        self.estimatedHeightForRow = estimatedHeightForRow
        self.editingStyleForRow = editingStyleForRow
        self.viewForFooterInSection = viewForFooterInSection
        self.viewForHeaderInSection = viewForHeaderInSection
        self.leadingSwipeActionsConfigurationForRowAt = leadingSwipeActionsConfigurationForRowAt
        self.trailingSwipeActionsConfigurationForRowAt = trailingSwipeActionsConfigurationForRowAt
        self.contextMenuConfigurationForRowAt = contextMenuConfigurationForRowAt
        self.titleForDeleteConfirmationButtonForRowAt = titleForDeleteConfirmationButtonForRowAt
    }
    
    // MARK: - Delegate
    
    func actions(
        heightForRow: ((IndexPath) -> CGFloat)? = nil,
        heightForHeader: ((Int) -> CGFloat)? = nil,
        heightForFooter: ((Int) -> CGFloat)? = nil,
        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)?,
        viewForFooterInSection: ((Int) -> UIView?)? = nil,
        viewForHeaderInSection: ((Int) -> UIView?)? = nil,
        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
    ) {
        self.heightForRow = heightForRow
        self.heightForHeader = heightForHeader
        self.heightForFooter = heightForFooter
        self.estimatedHeightForRow = estimatedHeightForRow
        self.editingStyleForRow = editingStyleForRow
        self.viewForFooterInSection = viewForFooterInSection
        self.viewForHeaderInSection = viewForHeaderInSection
        self.leadingSwipeActionsConfigurationForRowAt = leadingSwipeActionsConfigurationForRowAt
        self.trailingSwipeActionsConfigurationForRowAt = trailingSwipeActionsConfigurationForRowAt
        self.contextMenuConfigurationForRowAt = contextMenuConfigurationForRowAt
        self.titleForDeleteConfirmationButtonForRowAt = titleForDeleteConfirmationButtonForRowAt
    }
    
    func publishers(
        onItemSelected: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onItemUnselected: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onPerformPrimaryAction: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onDidEndEditing: ((AnyPublisher<IndexPath?, Never>) -> Void)?,
        onAccessoryButtonTapped: ((AnyPublisher<IndexPath, Never>) -> Void)?
    ) {
        onItemSelected?(selectedItemSubject.eraseToAnyPublisher())
        onItemUnselected?(deSelectedItemSubject.eraseToAnyPublisher())
        onPerformPrimaryAction?(performPrimaryActionAt.eraseToAnyPublisher())
        onDidEndEditing?(didEndEditingSubject.eraseToAnyPublisher())
        onAccessoryButtonTapped?(accessoryButtonTappedForRowWith.eraseToAnyPublisher())
    }
    
    let selectedItemSubject = PassthroughSubject<IndexPath, Never>()
    let deSelectedItemSubject = PassthroughSubject<IndexPath, Never>()
    let didEndEditingSubject = PassthroughSubject<IndexPath?, Never>()
    let performPrimaryActionAt = PassthroughSubject<IndexPath, Never>()
    let accessoryButtonTappedForRowWith = PassthroughSubject<IndexPath, Never>()
    
    var heightForRow: ((IndexPath) -> CGFloat)?
    var heightForHeader: ((Int) -> CGFloat)?
    var heightForFooter: ((Int) -> CGFloat)?
    var estimatedHeightForRow: ((IndexPath) -> CGFloat)?
    var editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)?
    var viewForFooterInSection: ((Int) -> UIView?)?
    var viewForHeaderInSection: ((Int) -> UIView?)?
    var leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?
    var trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?
    var contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)?
    var titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)?
    
    // MARK: - De-init
    deinit {
        selectedItemSubject.send(completion: .finished)
        deSelectedItemSubject.send(completion: .finished)
        didEndEditingSubject.send(completion: .finished)
        performPrimaryActionAt.send(completion: .finished)
        accessoryButtonTappedForRowWith.send(completion: .finished)
    }
}

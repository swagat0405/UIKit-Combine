//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

protocol TableViewDataSource {    
    func build(
        rowsInSection: (@escaping (Int) -> Int),
        sections: (() -> Int)?,
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
    )
}

protocol TableViewDelegate {
    var heightForRow: ((IndexPath) -> CGFloat)? { get }
    var heightForHeader: ((Int) -> CGFloat)? { get }
    var heightForFooter: ((Int) -> CGFloat)? { get }
    var estimatedHeightForRow: ((IndexPath) -> CGFloat)? { get }
    var editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? { get }
    var viewForFooterInSection: ((Int) -> UIView?)? { get }
    var viewForHeaderInSection: ((Int) -> UIView?)? { get }
    var leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
    var trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
    var contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? { get }
    var titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? { get }
    
    var selectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var deSelectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didEndEditingSubject: PassthroughSubject<IndexPath?, Never> { get }
    var performPrimaryActionAt: PassthroughSubject<IndexPath, Never> { get }
    var accessoryButtonTappedForRowWith: PassthroughSubject<IndexPath, Never> { get }
}

final class TableViewManager: NSObject, TableViewDelegate, TableViewDataSource {
    
    // MARK: - DataSource
    var rowsInSection: ((Int) -> Int)?
    var sections: (() -> Int)?
    var cellBuilder: ((IndexPath) -> UITableViewCell)?
    var canEditRow: ((IndexPath) -> Bool)?
    var canMoveRow: ((IndexPath) -> Bool)?
    var moveRow:((IndexPath, IndexPath) -> Void)?
    var commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?
    var footerTitle: ((Int) -> String?)?
    var headerTitle: ((Int) -> String?)?
    
    // MARK: - Delegate
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
    
    func build(
        rowsInSection: (@escaping (Int) -> Int),
        sections: (() -> Int)?,
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
    
    deinit {
        selectedItemSubject.send(completion: .finished)
        deSelectedItemSubject.send(completion: .finished)
        didEndEditingSubject.send(completion: .finished)
        performPrimaryActionAt.send(completion: .finished)
        accessoryButtonTappedForRowWith.send(completion: .finished)
    }
}

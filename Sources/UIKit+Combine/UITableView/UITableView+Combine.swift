//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/2/24.
//

import UIKit
import Combine

public final class UITableView_Combine: UITableView {
    
    // MARK: - Properties
    private lazy var manager = TableViewManager()
    
    // MARK: - Initialize
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        self.dataSource = manager
        self.delegate = manager
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func build(
        rowsInSection: (@escaping (Int) -> Int),
        sections: (() -> Int)?,
        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
        canEditRow: ((IndexPath) -> Bool)? = nil,
        canMoveRow: ((IndexPath) -> Bool)? = nil,
        moveRow: ((IndexPath, IndexPath) -> Void)? = nil,
        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)? = nil,
        footerTitle: ((Int) -> String?)? = nil,
        headerTitle: ((Int) -> String?)? = nil,
        heightForRow: ((IndexPath) -> CGFloat)? = nil,
        heightForHeader: ((Int) -> CGFloat)? = nil,
        heightForFooter: ((Int) -> CGFloat)? = nil,
        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? = nil,
        viewForFooterInSection: ((Int) -> UIView?)? = nil,
        viewForHeaderInSection: ((Int) -> UIView?)? = nil,
        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
    ) {
        manager.build(
            rowsInSection: rowsInSection,
            sections: sections,
            cellBuilder: cellBuilder,
            canEditRow: canEditRow,
            canMoveRow: canMoveRow,
            moveRow: moveRow,
            commitEditingStyle: commitEditingStyle,
            footerTitle: footerTitle,
            headerTitle: headerTitle,
            heightForRow: heightForRow,
            heightForHeader: heightForHeader,
            heightForFooter: heightForFooter,
            estimatedHeightForRow: estimatedHeightForRow,
            editingStyleForRow: editingStyleForRow,
            viewForFooterInSection: viewForFooterInSection,
            viewForHeaderInSection: viewForHeaderInSection,
            leadingSwipeActionsConfigurationForRowAt: leadingSwipeActionsConfigurationForRowAt,
            trailingSwipeActionsConfigurationForRowAt: trailingSwipeActionsConfigurationForRowAt,
            contextMenuConfigurationForRowAt: contextMenuConfigurationForRowAt,
            titleForDeleteConfirmationButtonForRowAt: titleForDeleteConfirmationButtonForRowAt
        )
    }
    
    // MARK: - Publishers
    var onItemSelected: AnyPublisher<IndexPath, Never> {
        manager.selectedItemSubject.eraseToAnyPublisher()
    }
    var onItemUnselected: AnyPublisher<IndexPath, Never> {
        manager.deSelectedItemSubject.eraseToAnyPublisher()
    }
    
    var onPerformPrimaryAction: AnyPublisher<IndexPath, Never> {
        manager.performPrimaryActionAt.eraseToAnyPublisher()
    }
    var onDidEndEditing: AnyPublisher<IndexPath?, Never> {
        manager.didEndEditingSubject.eraseToAnyPublisher()
    }
    var onAccessoryButtonTapped: AnyPublisher<IndexPath, Never> {
        manager.accessoryButtonTappedForRowWith.eraseToAnyPublisher()
    }
    
    // MARK: - Actions
    var heightForRow: ((IndexPath) -> CGFloat)? {
        didSet {
            manager.heightForRow = heightForRow
        }
    }
    var heightForFooter: ((Int) -> CGFloat)? {
        didSet {
            manager.heightForFooter = heightForFooter
        }
    }
    var heightForHeader: ((Int) -> CGFloat)? {
        didSet {
            manager.heightForHeader = heightForHeader
        }
    }
    var estimatedHeightForRow: ((IndexPath) -> CGFloat)? {
        didSet {
            manager.estimatedHeightForRow = estimatedHeightForRow
        }
    }
    var editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? {
        didSet {
            manager.editingStyleForRow = editingStyleForRow
        }
    }
    var viewForFooterInSection: ((Int) -> UIView?)? {
        didSet {
            manager.viewForFooterInSection = viewForFooterInSection
        }
    }
    var viewForHeaderInSection: ((Int) -> UIView?)? {
        didSet {
            manager.viewForHeaderInSection = viewForHeaderInSection
        }
    }
    var leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? {
        didSet {
            manager.leadingSwipeActionsConfigurationForRowAt = leadingSwipeActionsConfigurationForRowAt
        }
    }
    var trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? {
        didSet {
            manager.trailingSwipeActionsConfigurationForRowAt = trailingSwipeActionsConfigurationForRowAt
        }
    }
    var contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? {
        didSet {
            manager.contextMenuConfigurationForRowAt = contextMenuConfigurationForRowAt
        }
    }
    var titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? {
        didSet {
            manager.titleForDeleteConfirmationButtonForRowAt = titleForDeleteConfirmationButtonForRowAt
        }
    }
}

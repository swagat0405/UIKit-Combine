//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - DataSource
public extension TableViewManager {
    func build(
        sections: (() -> Int)? = nil,
        rowsInSection: (@escaping (Section) -> Int),
        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
        canEditRow: ((IndexPath) -> Bool)? = nil,
        canMoveRow: ((IndexPath) -> Bool)? = nil,
        moveRow: ((IndexPath, IndexPath) -> Void)? = nil,
        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)? = nil,
        footerTitle: ((Section) -> String?)? = nil,
        headerTitle: ((Section) -> String?)? = nil ,
        heightForRow: ((IndexPath) -> CGFloat)? = nil,
        heightForHeader: ((Section) -> CGFloat)? = nil,
        heightForFooter: ((Section) -> CGFloat)? = nil,
        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? = nil,
        viewForFooterInSection: ((Section) -> UIView?)? = nil,
        viewForHeaderInSection: ((Section) -> UIView?)? = nil,
        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
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
}

// MARK: - UITableViewDelegate
public extension TableViewManager {
    func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = sections else { return tableView.style == .plain ? 1 : 0 }
        return sections()
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = rowsInSection else { return 0 }
        return rows(section)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellBuilder = cellBuilder else {
            return UITableViewCell()
        }
        return cellBuilder(indexPath)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let canEditRow = canEditRow else { return true }
        return canEditRow(indexPath)
    }

    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        guard let canMoveRow = canMoveRow else { return true }
        return canMoveRow(indexPath)
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let moveRow = moveRow else { return }
        moveRow(sourceIndexPath, destinationIndexPath)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        commitEditingStyle?(editingStyle, indexPath)
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let footer = footerTitle else { return nil }
        return footer(section)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let header = headerTitle else { return nil }
        return header(section)
    }
}

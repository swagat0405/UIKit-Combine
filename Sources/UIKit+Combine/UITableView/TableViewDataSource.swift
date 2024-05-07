//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - typealias
public typealias Section = Int

protocol TableViewDataSource: UITableViewDataSource {
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
    )
}

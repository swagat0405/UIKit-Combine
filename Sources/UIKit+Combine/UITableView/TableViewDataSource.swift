//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - typealias
public typealias Section = Int

public protocol TableViewDataSource: UITableViewDataSource {
    func build(
        sections: (() -> Int)?,
        rowsInSection: (@escaping (Section) -> Int),
        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
        canEditRow: ((IndexPath) -> Bool)?,
        canMoveRow: ((IndexPath) -> Bool)?,
        moveRow: ((IndexPath, IndexPath) -> Void)?,
        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?,
        footerTitle: ((Section) -> String?)?,
        headerTitle: ((Section) -> String?)?,
        heightForRow: ((IndexPath) -> CGFloat)?,
        heightForHeader: ((Section) -> CGFloat)?,
        heightForFooter: ((Section) -> CGFloat)?,
        estimatedHeightForRow: ((IndexPath) -> CGFloat)?,
        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)?,
        viewForFooterInSection: ((Section) -> UIView?)?,
        viewForHeaderInSection: ((Section) -> UIView?)?,
        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?,
        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)?,
        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)?,
        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)?
    )
}

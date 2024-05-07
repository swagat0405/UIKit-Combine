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
//    var sections: (() -> Int)? { get }
//    var rowsInSection: ((Section) -> Int)? { get }
//    var cellBuilder: ((IndexPath) -> UITableViewCell)? { get }
//    var canEditRow: ((IndexPath) -> Bool)? { get }
//    var canMoveRow: ((IndexPath) -> Bool)? { get }
//    var moveRow: ((IndexPath, IndexPath) -> Void)? { get }
//    var commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)? { get }
//    var footerTitle: ((Int) -> String?)? { get }
//    var headerTitle: ((Int) -> String?)? { get }
//    var heightForRow: ((IndexPath) -> CGFloat)? { get }
//    var heightForHeader: ((Int) -> CGFloat)? { get }
//    var heightForFooter: ((Int) -> CGFloat)? { get }
//    var estimatedHeightForRow: ((IndexPath) -> CGFloat)? { get }
//    var editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? { get }
//    var viewForFooterInSection: ((Int) -> UIView?)? { get }
//    var viewForHeaderInSection: ((Int) -> UIView?)? { get }
//    var leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
//    var trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
//    var contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? { get }
//    var titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? { get }
    
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

//extension TableViewDataSource {
//    func build(
//        sections: (() -> Int)? = nil,
//        rowsInSection: (@escaping (Section) -> Int),
//        cellBuilder: (@escaping (IndexPath) -> UITableViewCell),
//        canEditRow: ((IndexPath) -> Bool)? = nil,
//        canMoveRow: ((IndexPath) -> Bool)? = nil,
//        moveRow: ((IndexPath, IndexPath) -> Void)? = nil,
//        commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)? = nil,
//        footerTitle: ((Int) -> String?)? = nil,
//        headerTitle: ((Int) -> String?)? = nil,
//        heightForRow: ((IndexPath) -> CGFloat)? = nil,
//        heightForHeader: ((Int) -> CGFloat)? = nil,
//        heightForFooter: ((Int) -> CGFloat)? = nil,
//        estimatedHeightForRow: ((IndexPath) -> CGFloat)? = nil,
//        editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? = nil,
//        viewForFooterInSection: ((Int) -> UIView?)? = nil,
//        viewForHeaderInSection: ((Int) -> UIView?)? = nil,
//        leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? = nil,
//        contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? = nil,
//        titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? = nil
//    ) {}
//}

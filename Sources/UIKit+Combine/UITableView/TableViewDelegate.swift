//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

protocol TableViewDelegate: UITableViewDelegate {
    var selectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var deSelectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didEndEditingSubject: PassthroughSubject<IndexPath?, Never> { get }
    var performPrimaryActionAt: PassthroughSubject<IndexPath, Never> { get }
    var accessoryButtonTappedForRowWith: PassthroughSubject<IndexPath, Never> { get }
    
    func actions(
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

extension TableViewDelegate {
    func actions(
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
    ) {}
}

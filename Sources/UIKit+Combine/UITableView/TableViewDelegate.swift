//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

protocol TableViewDelegate: UITableViewDelegate {
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
//    
//    var selectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
//    var deSelectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
//    var didEndEditingSubject: PassthroughSubject<IndexPath?, Never> { get }
//    var performPrimaryActionAt: PassthroughSubject<IndexPath, Never> { get }
//    var accessoryButtonTappedForRowWith: PassthroughSubject<IndexPath, Never> { get }
    
    
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
//    {
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
    
    func publishers(
        onItemSelected: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onItemUnselected: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onPerformPrimaryAction: ((AnyPublisher<IndexPath, Never>) -> Void)?,
        onDidEndEditing: ((AnyPublisher<IndexPath?, Never>) -> Void)?,
        onAccessoryButtonTapped: ((AnyPublisher<IndexPath, Never>) -> Void)?
    ) 
//    {
//        onItemSelected?(manager.selectedItemSubject.eraseToAnyPublisher())
//        onItemUnselected?(manager.deSelectedItemSubject.eraseToAnyPublisher())
//        onPerformPrimaryAction?(manager.performPrimaryActionAt.eraseToAnyPublisher())
//        onDidEndEditing?(manager.didEndEditingSubject.eraseToAnyPublisher())
//        onAccessoryButtonTapped?(manager.accessoryButtonTappedForRowWith.eraseToAnyPublisher())
//    }
}

extension TableViewDelegate {
    func publishers(
        onItemSelected: ((AnyPublisher<IndexPath, Never>) -> Void)? = nil,
        onItemUnselected: ((AnyPublisher<IndexPath, Never>) -> Void)? = nil,
        onPerformPrimaryAction: ((AnyPublisher<IndexPath, Never>) -> Void)? = nil,
        onDidEndEditing: ((AnyPublisher<IndexPath?, Never>) -> Void)? = nil,
        onAccessoryButtonTapped: ((AnyPublisher<IndexPath, Never>) -> Void)? = nil
    ) {}
    
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

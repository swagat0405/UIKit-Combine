//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

// MARK: - Delegate
public extension TableViewManager {
    func actions(
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
    
    var onDidSelectItem: AnyPublisher<IndexPath, Never> {
        selectedItemSubject.eraseToAnyPublisher()
    }
    var onDidDeSelectItem: AnyPublisher<IndexPath, Never> {
        deSelectedItemSubject.eraseToAnyPublisher()
    }
    var onDidEndEditing: AnyPublisher<IndexPath?, Never> {
        didEndEditingSubject.eraseToAnyPublisher()
    }
    var onPerformPrimaryAction: AnyPublisher<IndexPath, Never> {
        performPrimaryActionAt.eraseToAnyPublisher()
    }
    var onAccessoryButtonTappedForRowWith: AnyPublisher<IndexPath, Never> {
        accessoryButtonTappedForRowWith.eraseToAnyPublisher()
    }
}

// MARK: - UITableViewDelegate
public extension TableViewManager {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedItemSubject.send(indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        deSelectedItemSubject.send(indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        heightForRow?(indexPath) ?? tableView.rowHeight
    }
    func tableView(_ tableView: UITableView, didEndEditingRowAt indexPath: IndexPath?) {
        didEndEditingSubject.send(indexPath)
    }
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        editingStyleForRow?(indexPath) ?? .none
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        viewForFooterInSection?(section) ?? nil
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        viewForHeaderInSection?(section) ?? nil
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        estimatedHeightForRow?(indexPath) ?? UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        heightForFooter?(section) ?? 0.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        heightForFooter?(section) ?? 0.0
    }
    func tableView(_ tableView: UITableView, performPrimaryActionForRowAt indexPath: IndexPath) {
        performPrimaryActionAt.send(indexPath)
    }
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        accessoryButtonTappedForRowWith.send(indexPath)
    }
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        leadingSwipeActionsConfigurationForRowAt?(indexPath)
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        trailingSwipeActionsConfigurationForRowAt?(indexPath)
    }
    func tableView(_ tableView: UITableView, contextMenuConfigurationForRowAt indexPath: IndexPath, point: CGPoint) -> UIContextMenuConfiguration? {
        contextMenuConfigurationForRowAt?(indexPath, point)
    }
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        titleForDeleteConfirmationButtonForRowAt?(indexPath)
    }
}

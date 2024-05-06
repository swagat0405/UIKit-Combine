//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

// MARK: - Internal
final class TableViewManager: NSObject {
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
    
    deinit {
        selectedItemSubject.send(completion: .finished)
        deSelectedItemSubject.send(completion: .finished)
        didEndEditingSubject.send(completion: .finished)
        performPrimaryActionAt.send(completion: .finished)
        accessoryButtonTappedForRowWith.send(completion: .finished)
    }
}

extension TableViewManager: UITableViewDelegate {
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

public extension UITableView {
    enum Event {
        case didSelectRow
        case didDeselectRow
        case willDisplayCell
        case didEndDisplayingCell
        case willBeginEditingRow
        case didEndEditingRow
        case didHighlightRow
        case didUnHighlightRow
        case accessoryButtonTappedForRow
        case performPrimaryActionForRow
        case didBeginMultipleSelectionInteraction
        case didEndMultipleSelectionInteraction
        case heightForRow
        case estimatedHeightForRow
        case canFocusRow
        case shouldHighlightRow
        case selectionFollowsFocusForRow
        case shouldIndentWhileEditingRow
        case canPerformPrimaryActionForRow
        case shouldBeginMultipleSelectionInteraction
        case willSelectRow
        case willDeselectRow
        case editingStyleForRow
        case indentationLevelForRow
        case heightForFooterInSection
        case heightForHeaderInSection
        case estimatedHeightForHeaderInSection
        case estimatedHeightForFooterInSection
        case viewForHeaderInSection
        case viewForFooterInSection
        case disUpdateFocusIn
        case willDisplayContextMenu
        case willDisplayFooterView
        case willDisplayHeaderView
        case willEndContextMenuInteraction
        case leadingSwipeActionsConfigurationForRow
        case trailingSwipeActionsConfigurationForRow
        case didEndDisplayingFooterView
        case didEndDisplayingHeaderView
        case contextMenuConfigurationForRow
        case titleForDeleteConfirmationButtonForRow
        case willPerformPreviewActionForMenu
    }
}

//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

public protocol TableViewDelegate: UITableViewDelegate {
    var onDidSelectItem: AnyPublisher<IndexPath, Never> { get }
    var onDidDeSelectItem: AnyPublisher<IndexPath, Never> { get }
    var onDidEndEditing: AnyPublisher<IndexPath?, Never> { get }
    var onPerformPrimaryAction: AnyPublisher<IndexPath, Never> { get }
    var onAccessoryButtonTappedForRowWith: AnyPublisher<IndexPath, Never> { get }

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

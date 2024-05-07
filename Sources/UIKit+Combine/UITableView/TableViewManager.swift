//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import Combine
import UIKit

public final class TableViewManager: NSObject,TableViewDataSource, TableViewDelegate {
    
    // MARK: - Properties
    var sections: (() -> Int)?
    var rowsInSection: ((Section) -> Int)?
    var cellBuilder: ((IndexPath) -> UITableViewCell)?
    var canEditRow: ((IndexPath) -> Bool)?
    var canMoveRow: ((IndexPath) -> Bool)?
    var moveRow:((IndexPath, IndexPath) -> Void)?
    var commitEditingStyle: ((UITableViewCell.EditingStyle, IndexPath) -> Void)?
    var footerTitle: ((Int) -> String?)?
    var headerTitle: ((Int) -> String?)?
    
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
    
    
    // MARK: - Init
    init(withTableView tableView: UITableView) {
        super.init()
        tableView.dataSource = self
        tableView.delegate = self
    }

    // MARK: - De-init
    deinit {
        selectedItemSubject.send(completion: .finished)
        deSelectedItemSubject.send(completion: .finished)
        didEndEditingSubject.send(completion: .finished)
        performPrimaryActionAt.send(completion: .finished)
        accessoryButtonTappedForRowWith.send(completion: .finished)
    }
}

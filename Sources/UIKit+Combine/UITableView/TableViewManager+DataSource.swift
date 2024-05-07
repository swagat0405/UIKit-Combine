//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - UITableViewDataSource
extension TableViewManager: TableViewDataSource {
    public func numberOfSections(in tableView: UITableView) -> Int {
        guard let sections = sections else { return tableView.style == .plain ? 1 : 0 }
        return sections()
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let rows = rowsInSection else { return 0 }
        return rows(section)
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cellBuilder = cellBuilder else {
            return UITableViewCell()
        }
        return cellBuilder(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        guard let canEditRow = canEditRow else { return true }
        return canEditRow(indexPath)
    }

    public func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        guard let canMoveRow = canMoveRow else { return true }
        return canMoveRow(indexPath)
    }
    
    public func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        guard let moveRow = moveRow else { return }
        moveRow(sourceIndexPath, destinationIndexPath)
    }
    
    public func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        commitEditingStyle?(editingStyle, indexPath)
    }
    
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        guard let footer = footerTitle else { return nil }
        return footer(section)
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        guard let header = headerTitle else { return nil }
        return header(section)
    }

}

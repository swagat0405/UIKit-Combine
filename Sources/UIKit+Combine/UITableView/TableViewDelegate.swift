//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit
import Combine

protocol TableViewDelegate {
    var heightForRow: ((IndexPath) -> CGFloat)? { get }
    var heightForHeader: ((Int) -> CGFloat)? { get }
    var heightForFooter: ((Int) -> CGFloat)? { get }
    var estimatedHeightForRow: ((IndexPath) -> CGFloat)? { get }
    var editingStyleForRow: ((IndexPath) -> UITableViewCell.EditingStyle)? { get }
    var viewForFooterInSection: ((Int) -> UIView?)? { get }
    var viewForHeaderInSection: ((Int) -> UIView?)? { get }
    var leadingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
    var trailingSwipeActionsConfigurationForRowAt: ((IndexPath) -> UISwipeActionsConfiguration?)? { get }
    var contextMenuConfigurationForRowAt: ((IndexPath, CGPoint) -> UIContextMenuConfiguration?)? { get }
    var titleForDeleteConfirmationButtonForRowAt: ((IndexPath) -> String?)? { get }
    
    var selectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var deSelectedItemSubject: PassthroughSubject<IndexPath, Never> { get }
    var didEndEditingSubject: PassthroughSubject<IndexPath?, Never> { get }
    var performPrimaryActionAt: PassthroughSubject<IndexPath, Never> { get }
    var accessoryButtonTappedForRowWith: PassthroughSubject<IndexPath, Never> { get }
}

//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - CollectionViewManager+CollectionViewDataSource
extension CollectionViewManager: CollectionViewDataSource {
    func build(
        sections: (() -> Int)? = nil,
        itemsInSection: @escaping ((Int) -> Int),
        cellBuilder: @escaping ((IndexPath) -> UICollectionViewCell),
        viewForSupplementaryElement: ((String, IndexPath) -> UICollectionReusableView)? = nil,
        canMoveItem: ((IndexPath) -> Bool)? = nil,
        moveItem: ((IndexPath, IndexPath) -> Void)? = nil,
        indexTitles: ((UICollectionView) -> [String]?)? = nil,
        indexPathForIndexTitle: ((String, Int) -> IndexPath)? = nil
    ) {
        self.sections = sections
        self.itemsInSection = itemsInSection
        self.cellBuilder = cellBuilder
        self.viewForSupplementaryElement = viewForSupplementaryElement
        self.canMoveItem = canMoveItem
        self.moveItem = moveItem
        self.indexTitles = indexTitles
        self.indexPathForIndexTitle = indexPathForIndexTitle
    }
}

// MARK: - CollectionViewManager+UICollectionViewDataSource
extension CollectionViewManager: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        itemsInSection(section)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        cellBuilder(indexPath)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sections?() ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        viewForSupplementaryElement?(kind, indexPath) ?? UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, canMoveItemAt indexPath: IndexPath) -> Bool {
        canMoveItem?(indexPath) ?? true
    }

    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        moveItem?(sourceIndexPath, destinationIndexPath)
    }

    func indexTitles(for collectionView: UICollectionView) -> [String]? {
        indexTitles?(collectionView)
    }

    func collectionView(_ collectionView: UICollectionView, indexPathForIndexTitle title: String, at index: Int) -> IndexPath {
        indexPathForIndexTitle?(title, index) ?? .init(index: index)
    }
}


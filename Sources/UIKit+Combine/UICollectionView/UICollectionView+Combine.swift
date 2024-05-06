//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

public final class UICollectionView_Combine: UICollectionView {
    private lazy var manager = CollectionViewManager()
    
    public override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.dataSource = manager
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    public func build(
        sections: (() -> Int)? = nil,
        itemsInSection: @escaping ((Int) -> Int),
        cellBuilder: @escaping ((IndexPath) -> UICollectionViewCell),
        viewForSupplementaryElement: ((String, IndexPath) -> UICollectionReusableView)? = nil,
        canMoveItem: ((IndexPath) -> Bool)? = nil,
        moveItem: ((IndexPath, IndexPath) -> Void)? = nil,
        indexTitles: ((UICollectionView) -> [String]?)? = nil,
        indexPathForIndexTitle: ((String, Int) -> IndexPath)? = nil
    ) {
        manager.build(
            sections: sections,
            itemsInSection: itemsInSection,
            cellBuilder: cellBuilder,
            viewForSupplementaryElement: viewForSupplementaryElement,
            canMoveItem: canMoveItem,
            moveItem: moveItem,
            indexTitles: indexTitles,
            indexPathForIndexTitle: indexPathForIndexTitle
        )
    }
}

//
//  File.swift
//  
//
//  Created by Swagat Mishra on 5/6/24.
//

import UIKit

// MARK: - CollectionViewDataSource
protocol CollectionViewDataSource: UICollectionViewDataSource {
    func build(
        sections: (() -> Int)?,
        itemsInSection: (@escaping (Int) -> Int),
        cellBuilder: (@escaping (IndexPath) -> UICollectionViewCell),
        viewForSupplementaryElement: ((String, IndexPath) -> UICollectionReusableView)?,
        canMoveItem: ((IndexPath) -> Bool)?,
        moveItem: ((IndexPath, IndexPath) -> Void)?,
        indexTitles: ((UICollectionView) -> [String]?)?,
        indexPathForIndexTitle: ((String, Int) -> IndexPath)?
    )
}

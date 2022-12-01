//
//  PostsCollectionViewDataSource.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import UIKit

final class PostsCollectionViewDataSource: UICollectionViewDiffableDataSource<PostsPresenter.Section, PostPresentationModel> {
    
    convenience init(collectionView: UICollectionView) {
        self.init(collectionView: collectionView) { collectionView, indexPath, itemIdentifier in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.reuseID, for: indexPath) as? PostCollectionViewCell
            else { return nil }
            // cell.configure(with: itemIdentifier)
            return cell
        }
    }
}

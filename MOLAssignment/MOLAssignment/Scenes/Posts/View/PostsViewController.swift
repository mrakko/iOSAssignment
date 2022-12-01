//
//  PostsViewController.swift
//  MOLAssignment
//
//  Created by Tajti Márk on 2022. 12. 01..
//

import UIKit

protocol PostsView: AnyObject {
    func reload()
}

final class PostsViewController: UIViewController {
    private enum Layout {
        static let interItemSpacing: CGFloat = 16
        static let cellHeight: CGFloat = 138
    }
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
        collectionView.register(PostCollectionViewCell.self, forCellWithReuseIdentifier: PostCollectionViewCell.reuseID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .lightGray
        return collectionView
    }()
    private lazy var dataSource: PostsCollectionViewDataSource = {
        PostsCollectionViewDataSource(collectionView: collectionView)
    }()
    var presenter: PostsPresenterInput!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupContraints()
        presenter.viewDidLoad()
    }
    
    private func setupViews() {
        view.backgroundColor = .lightGray
        view.addSubview(collectionView)
    }
    
    private func setupContraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension PostsViewController {
    private func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, env in
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(Layout.cellHeight))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            group.interItemSpacing = .fixed(Layout.interItemSpacing)

            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = Layout.interItemSpacing

            return section
        }
        return layout
    }
}

extension PostsViewController: PostsView {
    func reload() {
        var snapshot = NSDiffableDataSourceSnapshot<PostsPresenter.Section, PostPresentationModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(presenter.getPostPresentationModels())
        dataSource.apply(snapshot)
    }
}

//
//  GenericCollectionViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/15/23.
//

import UIKit

class GenericCollectionViewController<Section: Hashable, Element: Hashable>: UICollectionViewController {

    var sections: [Section] = []
    var allowHeaderViewRender = true
    var allowElementToBeSelected = false
    
    var numberOfColumns = 1
    var didScroll: ((UIScrollView) -> Void)?
    var scrollDirection: ScrollDirection = .vertical
    var elementsForSection: [Section: [Element]] = [:]
    var didSelectElement: ((IndexPath, Element) -> Void)?
    var headerViewBuilder: ((UICollectionView, IndexPath, Section) -> UICollectionReusableView)?
    var cellViewBuilder: ((UICollectionView, IndexPath, Section, Element) -> UICollectionViewCell)?
    var cellDimensions: ((() -> (width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension)))?
    var groupDimensions: ((() -> (width: NSCollectionLayoutDimension, height: NSCollectionLayoutDimension)))?
    var sectionInterGroupSpacing: CGFloat = 3
    var sectionContentInsets = NSDirectionalEdgeInsets(top: 8, leading: 1, bottom: 8, trailing: 1)
    var groupInterItemSpacing: NSCollectionLayoutSpacing = .fixed(10)
    var groupContentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
    
    private typealias DataSource = UICollectionViewDiffableDataSource<Section, Element>
    private typealias Snapshot = NSDiffableDataSourceSnapshot<Section, Element>
    
    enum ScrollDirection {
        case horizontal, vertical
    }
    
    private lazy var dataSource: DataSource = {
        return DataSource(collectionView: collectionView, cellProvider: { [unowned self] collectionView, indexPath, element in
            guard let cellViewBuilder = cellViewBuilder
            else { fatalError("This callback needs to be implemented at call site") }
            let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
            return cellViewBuilder(collectionView, indexPath, section, element)
        })
    }()
    
    init() {
        super.init(collectionViewLayout: UICollectionViewLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyDataGridLayout()
        applySnapshot()
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        didScroll?(scrollView)
    }
    
    func applySnapshot(animatingDifferences: Bool = false) {
        var snapshot = Snapshot()
        snapshot.appendSections(sections)
        
        sections.forEach {
            guard let elementsForSection = elementsForSection[$0] else { snapshot.appendItems([], toSection: $0); return }
            snapshot.appendItems(elementsForSection, toSection: $0)
        }

        dataSource.apply(snapshot, animatingDifferences: animatingDifferences)
    }
    
    func applyDataGridLayout() {

        guard let cellDimensions = cellDimensions else { return assertionFailure("Cell dimension must be defined") }
        
        let size = NSCollectionLayoutSize(widthDimension: cellDimensions().width,
                                          heightDimension: cellDimensions().height)
        
        let item = NSCollectionLayoutItem(layoutSize: size)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 1, bottom: 0, trailing: 1)
        
        let group: NSCollectionLayoutGroup
        var groupSize = size
        
        if let groupDimensions {
            groupSize = NSCollectionLayoutSize(widthDimension: groupDimensions().width,
                                               heightDimension: groupDimensions().height)
        }
        
        switch scrollDirection {
        case .vertical:
            group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: Array(repeating: item, count: numberOfColumns))
        case .horizontal:
            group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: Array(repeating: item, count: numberOfColumns))
        }
        
        group.interItemSpacing = groupInterItemSpacing
        group.contentInsets = groupContentInsets
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = sectionContentInsets
        section.interGroupSpacing = sectionInterGroupSpacing
        
        if case .horizontal = scrollDirection {
            section.orthogonalScrollingBehavior = .continuous
        }

        if allowHeaderViewRender {

            guard let headerViewBuilder = headerViewBuilder else { fatalError("This callback needs to be implemented at call site") }
            
            let headerFooterSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(50))
            let sectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerFooterSize,
                                                                            elementKind: UICollectionView.elementKindSectionHeader,
                                                                            alignment: .top)

            section.boundarySupplementaryItems = [sectionHeader]
            
            // This activates the "Sticky Header" behavior
            sectionHeader.pinToVisibleBounds = true
            
            dataSource.supplementaryViewProvider = { [unowned self] collectionView, _, indexPath in
                let section = dataSource.snapshot().sectionIdentifiers[indexPath.section]
                return headerViewBuilder(collectionView, indexPath, section)
            }
        }

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.setCollectionViewLayout(layout, animated: false)
    }
    
    // MARK: - UICollectionViewDelegate
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let selectedElement = dataSource.itemIdentifier(for: indexPath), allowElementToBeSelected {
            didSelectElement?(indexPath, selectedElement)
        }

        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

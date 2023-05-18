//
//  PeopleListCollectionViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import UIKit

private let reuseIdentifier = "Cell"
private var refreshControl = UIRefreshControl()

class CharacterListCollectionViewController: GenericCollectionViewController<String, Character> {
    
    var viewModel: HomeScreenViewModel!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        numberOfColumns = 1
        let onlySection = "OneSection"
        sections = [onlySection]
        allowHeaderViewRender = false
        
        cellDimensions = {
            (.fractionalWidth(1), .absolute(160))
        }
        
        sectionInterGroupSpacing = 10
        
        cellViewBuilder = { collectionView, indexPath, section, character in
            collectionView.register(CharacterItemCell.self)
            let cell: CharacterItemCell = collectionView.dequeueCell(for: indexPath)
            cell.configure(character: character)
            return cell
        }
        
        viewModel.characterListDidChange = { [unowned self] filteredCharacterList in
            elementsForSection[onlySection] = filteredCharacterList
            applySnapshot(animatingDifferences: true)
        }
        
        didScroll = { [unowned self] scrollView in
            
            if(didScrollUntilBottom(scrollView)) {
                viewModel.collectionViewDidScrollUntilBottom()
            }
        }
        
        refreshControl.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        
        super.viewDidLoad()
    }
    
    
    // MARK: Private Methods
    @objc private func refreshCollectionView() {
        viewModel.collectionViewDidMadeRefreshGesture()
        
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    private func didScrollUntilBottom(_ scrollView: UIScrollView) -> Bool {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        return offsetY > contentHeight - height
    }
}

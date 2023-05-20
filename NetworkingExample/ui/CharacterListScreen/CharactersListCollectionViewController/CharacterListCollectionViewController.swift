//
//  PeopleListCollectionViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import UIKit

private let reuseIdentifier = "Cell"
private var refreshControl = UIRefreshControl()

final class CharacterListCollectionViewController: GenericCollectionViewController<String, Character> {
    
    var viewModel: CharacterListViewModel!
    let onlySection = "OneSection"
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        
        numberOfColumns = 1
        sections = [onlySection]
        allowHeaderViewRender = false
        allowElementToBeSelected = true
        
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
  
        refreshControl.addTarget(self, action: #selector(refreshCollectionView), for: .valueChanged)
        collectionView.refreshControl = refreshControl
  
        
        setObservables()
        super.viewDidLoad()
    }
    
    // MARK: Private Methods
    @objc private func refreshCollectionView() {
        
        viewModel.collectionViewDidMadeRefreshGesture()
        
        DispatchQueue.main.async {
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
    private func setObservables() {
        
        viewModel.characterListDidChange = { [unowned self] filteredCharacterList in
            elementsForSection[onlySection] = filteredCharacterList
            applySnapshot(animatingDifferences: true)
        }
        
        viewModel.errorDidChange = { error in
            //show error message or error screen
        }
        
        didScroll = { [unowned self] scrollView in
            
            if(didScrollUntilBottom(scrollView)) {
                viewModel.collectionViewDidScrollUntilBottom()
            }
        }
        
        didSelectElement = { [unowned self] _, character in
            viewModel.didTapElement(elementId: String(character.id))
        }
    }
    
    private func didScrollUntilBottom(_ scrollView: UIScrollView) -> Bool {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let height = scrollView.frame.size.height

        return offsetY > contentHeight - height
    }
}

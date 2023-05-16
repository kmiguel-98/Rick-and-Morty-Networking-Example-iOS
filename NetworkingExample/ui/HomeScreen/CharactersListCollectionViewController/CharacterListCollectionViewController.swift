//
//  PeopleListCollectionViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/14/23.
//

import UIKit

private let reuseIdentifier = "Cell"

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
            print(filteredCharacterList)
        }
        
        super.viewDidLoad()
    }
    
    // MARK: - CollectionView Delegate
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
}

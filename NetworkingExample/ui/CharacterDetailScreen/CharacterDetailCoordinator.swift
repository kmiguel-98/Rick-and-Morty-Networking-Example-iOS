//
//  CharacterDetailCoordinator.swift
//  NetworkingExample
//
//  Created by Miguel on 5/17/23.
//

import UIKit

final class CharacterDetailCoordinator {
    
    let navigationController: UINavigationController
    let characterDetailViewController: CharacterDetailViewController
    let useCases = RickAndMortyCharacterUseCases()
    
    init(_ navController: UINavigationController) {
        navigationController = navController
        let viewModel = CharacterDetailViewModel(useCases)
        characterDetailViewController = CharacterDetailViewController(viewModel)
    }
}

extension CharacterDetailCoordinator: Coordinator {
    
    func start() {
        
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
}

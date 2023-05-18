//
//  MainCoordinator.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

final class CharacterListScreenCoordinator {
    
    let navigationController: UINavigationController
    let characterListViewController: CharacterListContainerViewController
    let viewModel: CharacterListViewModel
    let useCases = RickAndMortyCharacterUseCases()
    
    init(_ navController: UINavigationController) {
        
        navigationController = navController
        viewModel = CharacterListViewModel(useCases)
        characterListViewController = CharacterListContainerViewController(viewModel)
    }
}

extension CharacterListScreenCoordinator: Coordinator {
    
    func start() {
        viewModel.coordinator = self
        navigationController.pushViewController(characterListViewController, animated: false)
    }
}

extension CharacterListScreenCoordinator: CharacterListScreenCoordinatorRepresentable {
    
    func navigateToDetailScreen(with id: String) {
        
        let viewModel = CharacterDetailViewModel(useCases, id: id)
        let characterDetailViewController = CharacterDetailViewController(viewModel)
        
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
}

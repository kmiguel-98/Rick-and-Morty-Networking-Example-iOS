//
//  MainCoordinator.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

final class CharacterListScreenCoordinator {
    
    let navigationController: UINavigationController
    private let characterListViewController: CharacterListContainerViewController
    private let characterListViewModel: CharacterListViewModel
    private var useCases: RickAndMortyCharacterUseCases
    
    init(_ navController: UINavigationController) {
        
        navigationController = navController
        useCases = RickAndMortyCharacterUseCases()
        characterListViewModel = CharacterListViewModel(useCases)
        characterListViewController = CharacterListContainerViewController(characterListViewModel)
    }
}

extension CharacterListScreenCoordinator: Coordinator {
    
    func start() {
        
        characterListViewModel.coordinator = self
        navigationController.pushViewController(characterListViewController, animated: false)
    }
}

extension CharacterListScreenCoordinator: CharacterListScreenCoordinatorRepresentable {
    
    func navigateToDetailScreen(with id: String) {
        
        let viewModel = CharacterDetailViewModel(useCases)
        let characterDetailViewController = CharacterDetailViewController(viewModel, id: id)
        navigationController.pushViewController(characterDetailViewController, animated: true)
    }
}

//
//  MainCoordinator.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

final class CharacterListScreenCoordinator : Coordinator {
    
    let navigationController: UINavigationController
    let homeScreenViewController: HomeScreenViewController
    let useCases = RickAndMortyCharacterUseCases()
    
    init(_ navController: UINavigationController) {
        navigationController = navController
        let viewModel = HomeScreenViewModel(useCases)
        homeScreenViewController = HomeScreenViewController()
        homeScreenViewController.viewModel = viewModel
    }
    
    func start() {
        navigationController.pushViewController(homeScreenViewController, animated: false)
    }
}

//
//  MainCoordinator.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

final class HomeScreenCoordinator : Coordinator {
    
    let navigationController: UINavigationController
    let homeScreenViewController: HomeScreenViewController
    let useCases = CharacterUseCases()
    
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

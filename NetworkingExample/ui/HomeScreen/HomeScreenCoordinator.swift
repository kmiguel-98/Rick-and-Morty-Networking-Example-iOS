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
    
    init(_ navController: UINavigationController) {
        navigationController = navController
        
        let useCases = CharacterUseCases()
        homeScreenViewController = HomeScreenViewController()
        homeScreenViewController.viewModel = HomeScreenViewModel(useCases: useCases)
    }
    
    func start() {
        navigationController.pushViewController(homeScreenViewController, animated: false)
    }
}

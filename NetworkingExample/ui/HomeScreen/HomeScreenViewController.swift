//
//  HomeScreenViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet private weak var characterListContainerView: UIView!
    
    private let characterListCollectionViewController = CharacterListCollectionViewController()
    
    var viewModel: HomeScreenViewModel!
    
    init() {
        super.init(nibName: "HomeScreenViewController",
                   bundle: Bundle(for: HomeScreenViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        title = "Rick & Morty Characters"
        characterListCollectionViewController.viewModel = viewModel
        add(viewController: characterListCollectionViewController, to: characterListContainerView)

        // Set navigation bar visibility
        navigationController?.isNavigationBarHidden = false
        customizeNavigationBar()
        
        super.viewDidLoad()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func customizeNavigationBar() {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.windows.first?.windowScene?.statusBarManager
        else { return }

        let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
        statusBarView.backgroundColor = UIColor(named: "R&MPaletteSeanBlue")
        view.addSubview(statusBarView)
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "R&MPaletteSeanBlue")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "R&MPaletteSeanBlue")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        //navigationController.hidesBarsOnSwipe = true
    }
}

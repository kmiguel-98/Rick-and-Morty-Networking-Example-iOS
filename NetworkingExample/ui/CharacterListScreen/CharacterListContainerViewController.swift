//
//  HomeScreenViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

final class CharacterListContainerViewController: UIViewController {
    
    @IBOutlet private weak var characterListContainerView: UIView!
    
    private let characterListCollectionViewController = CharacterListCollectionViewController()
    
    private(set) var viewModel: CharacterListViewModel!
    
    init(_ viewModel: CharacterListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CharacterListContainerViewController",
                   bundle: Bundle(for: CharacterListContainerViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
   
        characterListCollectionViewController.viewModel = viewModel
        add(viewController: characterListCollectionViewController, to: characterListContainerView)
        
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        title = "Rick & Morty Characters"
        navigationController?.isNavigationBarHidden = false
        setNavigationBar()
        super.viewWillAppear(animated)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    private func setNavigationBar() {
        
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let statusBarManager = windowScene.windows.first?.windowScene?.statusBarManager
        else { return }

        let statusBarView = UIView(frame: statusBarManager.statusBarFrame)
        statusBarView.backgroundColor = UIColor(named: "R&MPaletteGreen")
        view.addSubview(statusBarView)
        
        navigationController?.navigationBar.barTintColor = UIColor(named: "R&MPaletteGreen")
        navigationController?.navigationBar.backgroundColor = UIColor(named: "R&MPaletteGreen")
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
    }
}

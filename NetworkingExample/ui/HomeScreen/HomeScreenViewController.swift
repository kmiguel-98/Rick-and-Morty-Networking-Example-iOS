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
        
       
        characterListCollectionViewController.viewModel = viewModel
        add(viewController: characterListCollectionViewController, to: characterListContainerView)
        

        
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
}

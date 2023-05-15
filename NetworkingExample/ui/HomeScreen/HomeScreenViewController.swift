//
//  HomeScreenViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/13/23.
//

import UIKit

class HomeScreenViewController: UIViewController {

    var viewModel: HomeScreenViewModel!
    
    init() {
        super.init(nibName: "HomeScreenViewController",
                   bundle: Bundle(for: HomeScreenViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        viewModel.characterListDidChange = { characters in
            print(characters)
        }
        
        super.viewDidLoad()
        
        viewModel.viewDidLoad()
    }
    
}

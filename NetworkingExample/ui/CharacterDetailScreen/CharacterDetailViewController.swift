//
//  CharacterDetailViewController.swift
//  NetworkingExample
//
//  Created by Miguel on 5/18/23.
//

import UIKit

final class CharacterDetailViewController: UIViewController {
    
    private let viewModel: CharacterDetailViewModel
    
    init(_ viewModel: CharacterDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "CharacterDetailViewController", bundle: Bundle(for: CharacterDetailViewController.self))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        
        view.backgroundColor = UIColor.green
        
        super.viewDidLoad()
    }
}

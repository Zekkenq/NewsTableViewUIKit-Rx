//
//  ViewController.swift
//  NewsReader
//
//  Created by Andrey on 07.03.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        
       
        
    }
    override func viewDidAppear(_ animated: Bool) {
        let service = NewsService()
        
        let viewModel = HeadlinesViewModel(service: service)
        let headlinesVC = HeadlinesViewController(viewModel: viewModel)
        headlinesVC.modalPresentationStyle = .fullScreen
        present(headlinesVC, animated: false)
    }

}


//
//  HeadlinesViewController.swift
//  NewsReader
//
//  Created by Andrey on 07.03.2023.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Foundation

class HeadlinesViewController: UIViewController{
    
    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)

    let activityIndicator = UIActivityIndicatorView()
    
    private var disposeBag = DisposeBag()
    
    private lazy var dataSource = RxTableViewSectionedAnimatedDataSource<NewsSection>{(
        dataSource, tableView: UITableView, indexPath, item ) in
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! HeadlineCell
        cell.initialize(with: item)
        return cell
    }
    
    typealias ViewModel = HeadlinesViewModel
    
    let viewModel : ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialize()
        view.backgroundColor = .white
    }
}

extension HeadlinesViewController{
    func initialize(){
        configureTableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)]
            )
    }
    
    func configureTableView(){
        tableView.rowHeight = UITableView.automaticDimension
        
        tableView.register(HeadlineCell.self, forCellReuseIdentifier: "cell")
        tableView
            .rx
            .itemSelected
            .subscribe(onNext: {[unowned self] ip in
                tableView.deselectRow(at: ip, animated: true)
            })
            .disposed(by: disposeBag)
        
        viewModel
            .headlines
            .drive(
                tableView.rx.items(dataSource: dataSource)
            )
            .disposed(by: disposeBag)
    }
}




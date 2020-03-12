//
//  ListProductViewController.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/11/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import UIKit

class ListProductViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(ListProductCell.self)
        }
    }
    private var products: [Product] = [] {
        didSet {
            tableView.reloadData()
        }
    }
    
    private var productsLoader: ProductsLoader!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        searchProduct()
    }
    
    func setupUI() {
        let searchBar = UISearchBar()
        searchBar.sizeToFit()
        searchBar.placeholder = "Nhập tên, mã sản phẩm"
        searchBar.setImage(UIImage(named: "ic_search"), for: .search, state: .normal)
        searchBar.searchTextField.backgroundColor = .white
        searchBar.delegate = self
        navigationItem.titleView = searchBar
        navigationController?.navigationBar.barTintColor = UIColor(named: "F5471E")
    }
    
    func searchProduct(query: String = "") {
        startAnimating()
        productsLoader = ProductsLoader(query: query, page: 1)
        productsLoader.load { [weak self] result in
            self?.stopAnimating()
            switch result {
            case .success(let products):
                self?.products = products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func loadMoreProduct() {
        productsLoader.next { [weak self] result in
            switch result {
            case .success(let products):
                self?.products += products
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
}

extension ListProductViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as ListProductCell
        cell.configureCell(product: products[indexPath.row])
        return cell
    }
}

extension ListProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
    }
    
}

extension ListProductViewController: UISearchBarDelegate {
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let text = searchBar.text {
            searchProduct(query: text)
        }
    }
}

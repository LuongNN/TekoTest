//
//  ProductDetailViewController.swift
//  TekoStudy
//
//  Created by LuongNguyen on 3/12/20.
//  Copyright © 2020 Luong Nguyen. All rights reserved.
//

import UIKit
import PagingKit
import FSPagerView


class ProductDetailViewController: UIViewController {
    @IBOutlet weak var imagePagerView: FSPagerView! {
        didSet {
            imagePagerView.dataSource = self
            imagePagerView.delegate = self
            imagePagerView.register(FSPagerViewCell.self, forCellWithReuseIdentifier: "FSPagerViewCell")
        }
    }
    
    @IBOutlet weak var pageControl: FSPageControl! {
        didSet {
            pageControl.setFillColor(UIColor(named: "EEF1F3"), for: .normal)
            pageControl.setFillColor(UIColor(named: "F5471E"), for: .selected)
            pageControl.numberOfPages = 4
        }
    }
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(InfoProductViewCell.self)
        }
    }
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            collectionView.register(ProductCollectionViewCell.self)
        }
    }
    
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productIdLabel: UILabel!
    @IBOutlet weak var sateProductLabel: PadingLabel!
    @IBOutlet weak var sellPriceLabel: CurrencyView!
    @IBOutlet weak var supplierPriceLabel: UILabel!
    
    @IBOutlet weak var numberProductLabel: UILabel!
    
    @IBOutlet weak var totalAmountLabel: UILabel!
    var productId: String = ""
    var product: Product?
    var menuViewController: PagingMenuViewController?
    lazy var titleView = UIView.load(DetailProductTitleView.self)
    var totalAmount: Int = 0 {
        didSet {
            totalAmountLabel.text = totalAmount.formatNumber(separator: ".") + " đ"
        }
    }
    var totalNumberProduct: Int = 1 {
        didSet {
            numberProductLabel.text = "\(totalNumberProduct)"
        }
    }
    private let dataSource: [(menu: String, content: UIViewController)] = [(menu: "Mô tả sản phẩm", content: UIViewController()), (menu: "Thông số kỹ thuật", content: UIViewController()), (menu: "So sánh giá", content: UIViewController())]

    override func viewDidLoad() {
        super.viewDidLoad()
        configPagingView()
        fetchDetailProduct()
        configNavigationBar()
        menuViewController?.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.barTintColor = .white
        navigationController?.navigationBar.tintColor = UIColor(named: "262829")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.barTintColor = UIColor(named: "F5471E")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? PagingMenuViewController {
            menuViewController = vc
            menuViewController?.dataSource = self
            menuViewController?.delegate = self
        }
    }
    
    func configNavigationBar() {
        let view = UIView.load(CartButton.self)
        let cartButton = UIBarButtonItem(customView: view)
        navigationItem.rightBarButtonItem = cartButton
    }
    
    func configPagingView() {
        let underline = UnderlineFocusView()
        underline.underlineColor = UIColor(named: "F5471E")!
        underline.underlineHeight = 2
        menuViewController?.registerFocusView(view: underline)
        menuViewController?.register(nib: UINib(nibName: "MenuCell", bundle: nil), forCellWithReuseIdentifier: "MenuCell")
    }
    
    func configureTitleView(name: String, price: Int) {
        navigationItem.titleView = titleView
        titleView.productNameLabel.text = name
        titleView.sellPriceLabel.text = price.formatNumber(separator: ".") + " đ"
    }
    
    func configInfoProductView(product: Product) {
        productNameLabel.text = product.name
        productIdLabel.text = product.sku
        totalAmount = product.price.sellPrice ?? 0
        sellPriceLabel.text = product.price.sellPrice?.formatNumber(separator: ".")
        if let price = product.price.supplierSalePrice {
        let attributedString = NSMutableAttributedString(string: price.formatNumber(separator: "."))
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 2, range: NSMakeRange(0, attributedString.length))
        supplierPriceLabel.attributedText = attributedString
        }
        //promotionPercentLabel.text = "\(percentage)%"
        
    }
    
    func fetchDetailProduct() {
        startAnimating()
        ProductDetailService.getProductDetail(productId: productId) { [weak self] (result) in
            self?.stopAnimating()
            switch result {
            case .success(let product):
                self?.product = product
                self?.configureTitleView(name: product.name, price: product.price.sellPrice ?? 0)
                self?.configInfoProductView(product: product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    @IBAction func decreaseButtonTapped(_ sender: Any) {
        guard totalNumberProduct > 1 else { return }
        totalAmount -= product?.price.sellPrice ?? 0
        totalNumberProduct -= 1
        
    }
    
    @IBAction func increaseButtonTapped(_ sender: Any) {
        totalAmount += product?.price.sellPrice ?? 0
        totalNumberProduct += 1
    }
    
}

// MARK: - PagingMenuViewControllerDataSource
extension ProductDetailViewController: PagingMenuViewControllerDataSource {
    func numberOfItemsForMenuViewController(viewController: PagingMenuViewController) -> Int {
        return dataSource.count
    }
    
    func menuViewController(viewController: PagingMenuViewController, cellForItemAt index: Int) -> PagingMenuViewCell {
        let cell = viewController.dequeueReusableCell(withReuseIdentifier: "MenuCell", for: index) as! MenuCell
        cell.titleLabel.text = dataSource[index].menu
        return cell
    }
    
    func menuViewController(viewController: PagingMenuViewController, widthForItemAt index: Int) -> CGFloat {
        return UIScreen.main.bounds.width / 3.0
    }
    
    
}

// MARK: - PagingMenuViewControllerDelegate
extension ProductDetailViewController: PagingMenuViewControllerDelegate {
    func menuViewController(viewController: PagingMenuViewController, didSelect page: Int, previousPage: Int) {
    }
}


extension ProductDetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(forIndexPath: indexPath) as InfoProductViewCell
        return cell
    }
}

extension ProductDetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ProductCollectionViewCell
        return cell
    }
}

extension ProductDetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 162, height: collectionView.bounds.height)
    }
}

extension ProductDetailViewController: FSPagerViewDataSource {
    func numberOfItems(in pagerView: FSPagerView) -> Int {
        return 4
    }
    func pagerView(_ pagerView: FSPagerView, cellForItemAt index: Int) -> FSPagerViewCell {
        let cell = pagerView.dequeueReusableCell(withReuseIdentifier: "FSPagerViewCell", at: index)
        cell.imageView?.image = UIImage(named: "ic_cart")
        return cell
    }
}
extension ProductDetailViewController: FSPagerViewDelegate {
    
    func pagerView(_ pagerView: FSPagerView, didSelectItemAt index: Int) {
        pagerView.deselectItem(at: index, animated: false)
    }
    func pagerViewDidScroll(_ pagerView: FSPagerView) {
        pageControl.currentPage = pagerView.currentIndex
    }
}

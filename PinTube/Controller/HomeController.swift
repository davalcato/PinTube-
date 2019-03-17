//
//  ViewController.swift
//  PinTube
//
//  Created by Daval Cato on 2/17/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video]?
    
    let cellId = "cellId"
    
    
    func fetchVideos() {
        ApiService.sharedInstance.fetchVideos { (videos: [Video]) in
            
            self.videos = videos
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchVideos()
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: -332, height: 21))
        titleLabel.text = "  Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel
        
        
        setupCollectionView()
        setupMenuBar()
        setupNavBarButtons()
        
    }
    
    func setupCollectionView() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
            flowLayout.minimumLineSpacing = 0
            
        }
        
        collectionView?.backgroundColor = UIColor.white
        
//        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: cellId)
        
        collectionView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        collectionView.isPagingEnabled = true
    }
    
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")!.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
        
    }
    
    lazy var settingsLauncher: SettingsLauncher = {
        let launcher = SettingsLauncher()
        launcher.homeController = self
        return launcher
    }()
    
    @objc func handleMore() {
        //show menu
        settingsLauncher.showSettings()
        
    }
    
    
    func showControllerForSetting(setting: Setting) {
        let dummySettingsViewController = UIViewController()
        dummySettingsViewController.view.backgroundColor = UIColor.white
        dummySettingsViewController.navigationItem.title = setting.name.rawValue
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        
        navigationController?.pushViewController(dummySettingsViewController, animated: true)
        
        
    }
    
    @objc func handleSearch() {
       scrollToMenuIndex(menuIndex: 2)
        
        
    }
    
    
    func scrollToMenuIndex(menuIndex: Int) {
        
        let indexPath = NSIndexPath(item: menuIndex, section: 0)
        collectionView.scrollToItem(at: indexPath as IndexPath, at: [], animated: true)
        
        
    }
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.homeController = self
        return mb
        
    }()
    
    private func setupMenuBar() {
        navigationController?.hidesBarsOnSwipe = true
        
        let greenview = UIView()
        greenview.backgroundColor = UIColor.rgb(red: 156, green: 181, blue: 108)
        view.addSubview(greenview)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: greenview)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: greenview)
        
        
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]", views: menuBar)
        
        if #available(iOS 11.0, *) {
            menuBar.topAnchor.constraint(equalToSystemSpacingBelow: topLayoutGuide.bottomAnchor, multiplier: 1.0).isActive = true
        } else {
            // Fallback on earlier versions
        }
        
        
    }
    
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        menuBar.horizontalBarLeftAnchorConstraint?.constant = scrollView.contentOffset.x / 4
    }
  
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let index = targetContentOffset.pointee.x / view.frame.width
        
        let indexPath = NSIndexPath(item: Int(index), section: 0)
      
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        let colors: [UIColor] = [UIColor.blue, UIColor.orange, UIColor.yellow, UIColor.red]
        
        cell.backgroundColor = colors[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    
    
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return videos?.count ?? 0
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
//
//        cell.video = videos?[indexPath.item]
//
//        return cell
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        _ = (view.frame.width - 16 - 16) * 9 / 16
//        return CGSize(width: 330, height: 400)
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 0
//    }
    
}





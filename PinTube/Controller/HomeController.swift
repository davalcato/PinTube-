//
//  ViewController.swift
//  PinTube
//
//  Created by Daval Cato on 2/17/19.
//  Copyright © 2019 Daval Cato. All rights reserved.
//

import UIKit

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var videos: [Video] = {
        var WillChannel = Channel()
        WillChannel.name = "WillIsTheBestChannel"
        WillChannel.profileImageName = "Cutie_profile"
        
        var blankSpaceVideo = Video()
        blankSpaceVideo.title = "Taylor Swift - Blank Space"
        blankSpaceVideo.thumbnailImageName = "taylor_swift_blank_space"
        blankSpaceVideo.channel = WillChannel
        
        var badbloodVideo = Video()
        badbloodVideo.title = "Draya Michele - Bad Blood"
        badbloodVideo.thumbnailImageName = "Bad_blood"
        badbloodVideo.channel = WillChannel 
        
        
        return [blankSpaceVideo, badbloodVideo]
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Home"
        
        navigationController?.navigationBar.isTranslucent = false
        
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: -332, height: 21))
        titleLabel.text = "Home"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont.systemFont(ofSize: 20)
        navigationItem.titleView = titleLabel

        collectionView?.backgroundColor = UIColor.white
        
        collectionView?.register(VideoCell.self, forCellWithReuseIdentifier: "cellId")
        
        collectionView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        collectionView.scrollIndicatorInsets = UIEdgeInsets(top: 50, left: 0, bottom: 0, right: 0)
        
        
        setupMenuBar()
        setupNavBarButtons()
       
    }
    
    func setupNavBarButtons() {
        let searchImage = UIImage(named: "search_icon")!.withRenderingMode(.alwaysOriginal)
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(handleSearch))
        
        let moreButton = UIBarButtonItem(image: UIImage(named: "nav_more_icon")!.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMore))
        navigationItem.rightBarButtonItems = [moreButton, searchBarButtonItem]
        
    }
    
    @objc func handleMore() {
        
        
    }
    
    @objc func handleSearch() {
        print(123)
        
    }
    
    let menuBar: MenuBar = {
        let mb = MenuBar()
        return mb
        
    }()
    
    private func setupMenuBar() {
        view.addSubview(menuBar)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|[v0(50)]|", views: menuBar)
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! VideoCell
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        _ = (view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: 330, height: 400)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
   
}





//
//  CollectionViewController.swift
//  SampleExam
//
//  Created by Chris Chadillon on 2017-02-26.
//  Copyright © 2017 Chris Chadillon. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TheCell"

class CollectionViewController: UICollectionViewController {

    var theListOfAvatars:[String?] = []
    var theUpdateObject:UpdateAvatar!
    var indexOfPerson:Int!
    
    override func viewDidLoad() {
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.theListOfAvatars.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CustomCollectionViewCell
    
        if let avatarName = self.theListOfAvatars[indexPath.row] {
            cell.theImage.image = UIImage(named: avatarName)
            cell.theImage.backgroundColor = UIColor.white
        } else {
            cell.theImage.backgroundColor = UIColor.lightGray
        }
    
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.theUpdateObject.updateAvatar(indexOfPerson: self.indexOfPerson, indexOfImage: indexPath.row)
        self.navigationController!.popViewController(animated: true)
    }
}

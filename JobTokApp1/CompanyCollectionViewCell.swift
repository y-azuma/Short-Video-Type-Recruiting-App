//
//  CollectionViewCell.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/10/02.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class CompanyCollectionViewCell: UICollectionViewCell {

    private let fruitsNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width / 2.0, height: UIScreen.main.bounds.size.width / 2.0)
        label.textColor = UIColor.gray
        label.textAlignment = .center
        return label
    }()
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: (screenSize.width/3)-5, height: 1.618*(screenSize.width/3)-5)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        /*
        layer.borderColor = UIColor.darkGray.cgColor
        layer.borderWidth = 3.0
         */
        contentView.addSubview(cellImageView)
    }
    
    func setUpContents(image: UIImage) {
        cellImageView.image = image
    }
}

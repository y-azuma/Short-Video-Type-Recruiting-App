//
//  CompanyCollectionViewCell.swift
//  JobTokApp1
//
//  Created by 東　雄大 on 2019/10/18.
//  Copyright © 2019 Azuma Yudai. All rights reserved.
//

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
    private let cellLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 0, y: 0, width:  screenSize.width/2, height:  screenSize.width/2)
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: CGFloat(20))
        label.numberOfLines = 10
        label.lineBreakMode = .byWordWrapping
        label.textAlignment = .center
        return label
        }()
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 0, y: 0, width: screenSize.width/2, height: screenSize.width/2)
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
        contentView.addSubview(cellLabel)
        }
        
    func setUpContentsimage(image: UIImage) {
        cellImageView.image = image
        }
    func setUpContentslabel(text:String) {
        cellLabel.text = text
    }
    }

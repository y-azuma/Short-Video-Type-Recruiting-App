import UIKit

// CollectionViewのセル設定
class SearchCollectionViewCell: UICollectionViewCell {
    private let cellNameLabel: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 10, y: 120, width: 80,height: 50)
        label.font = .systemFont(ofSize: 14, weight: UIFont.Weight(rawValue: 1))
        label.textColor = UIColor.darkGray
        label.textAlignment = .center
        return label
    }()
    
    private let cellImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.frame = CGRect(x: 10, y: 5, width: 85, height: 110)
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
        contentView.addSubview(cellImageView)
        contentView.addSubview(cellNameLabel)
    }
    
    func setUpContents(image: UIImage, textName: String) {
        cellImageView.image = image
        cellNameLabel.text = textName
    }
}

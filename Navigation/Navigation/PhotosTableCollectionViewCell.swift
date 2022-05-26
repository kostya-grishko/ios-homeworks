
import UIKit

class PhotosTableCollectionViewCell: UICollectionViewCell {
    
    public var photosArray: [String] = ["1", "2", "3", "4", "5", "6"]
    
    public let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .clear
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    func setupCell(index: Int) {
        let name: String = photosArray[index]
        photoImageView.image = UIImage(named: name)
    }
    
    private func setupView() {
        contentView.addSubview(photoImageView)
        photoImageView.layer.cornerRadius = 15
        
        NSLayoutConstraint.activate([
            photoImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            photoImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photoImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photoImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

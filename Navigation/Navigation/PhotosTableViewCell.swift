
import UIKit

protocol PhotosTableViewDelegate: AnyObject {
    func buttonPressed()
}

class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewDelegate?
    
    lazy var photosTableCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotosTableCollectionViewCell.self, forCellWithReuseIdentifier: PhotosTableCollectionViewCell.identifier)
        return collectionView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photo"
        label.backgroundColor = .clear
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 1
        return label
    }()
    
    lazy var pushButton: UIButton = {
        let pushButton = UIButton()
        pushButton.translatesAutoresizingMaskIntoConstraints = false
        pushButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        pushButton.setImage(UIImage(named: "strelka"), for: .normal)
        return pushButton
    }()
    
    @objc private func tapAction() {
        delegate?.buttonPressed()
    }
    
    private func layout() {
        [photosTableCollectionView, titleLabel, pushButton].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            pushButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            pushButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            pushButton.heightAnchor.constraint(equalTo: titleLabel.heightAnchor),
            pushButton.widthAnchor.constraint(equalTo: pushButton.heightAnchor),
            
            photosTableCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            photosTableCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            photosTableCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            photosTableCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PhotosTableViewCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosTableCollectionViewCell.identifier, for: indexPath) as! PhotosTableCollectionViewCell
        cell.setupCell(index: indexPath.row)
        return cell
    }
}

extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat { return 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.height - sideInset * 3)
        return CGSize(width: height, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
}

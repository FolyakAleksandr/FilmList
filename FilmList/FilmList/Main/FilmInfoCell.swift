import UIKit

final class FilmInfoCell: UITableViewCell {
    // MARK: - private properties

    private let containerView = UIView()
    private let filmsImageView = UIImageView()
    private let nameFilmLabel = UILabel()
    private let ratingFilmLabel = UILabel()
    
    // MARK: - initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        roundCorners(presentView: filmsImageView, corners: [.bottomLeft, .topLeft])
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup UI

    private func setupUI() {
        layoutContainerView()
        setupContainerView()
        
        layoutFilmsImageView()
        setupFilmsImageView()
        
        layoutNameFilmLabel()
        setupNameFilmLabel()
        
        layoutRatingFilmLabel()
        setupRatingFilmLabel()
    }
    
    private func layoutContainerView() {
        contentView.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 22),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 22),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -22),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -22)
        ])
    }
    
    private func setupContainerView() {
        containerView.backgroundColor = .white
        containerView.layer.cornerRadius = 8
        containerView.layer.shadowColor = UIColor.systemGray.cgColor
        containerView.layer.shadowOpacity = 0.7
        containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
        containerView.layer.shadowRadius = 4
    }
    
    private func layoutFilmsImageView() {
        containerView.addSubview(filmsImageView)
        filmsImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filmsImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0),
            filmsImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0),
            filmsImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 0),
            filmsImageView.widthAnchor.constraint(equalTo: containerView.widthAnchor, multiplier: 0.6),
            filmsImageView.heightAnchor.constraint(equalTo: filmsImageView.widthAnchor, multiplier: 1)
        ])
    }

    private func setupFilmsImageView() {
        filmsImageView.contentMode = .scaleAspectFill
        roundCorners(presentView: filmsImageView, corners: [.bottomLeft, .topLeft])
    }
    
    private func layoutNameFilmLabel() {
        containerView.addSubview(nameFilmLabel)
        nameFilmLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameFilmLabel.leadingAnchor.constraint(equalTo: filmsImageView.trailingAnchor, constant: 15),
            nameFilmLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            nameFilmLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 34)
        ])
    }
    
    private func setupNameFilmLabel() {
        nameFilmLabel.textColor = .black
        nameFilmLabel.numberOfLines = 4
        nameFilmLabel.textAlignment = .center
        nameFilmLabel.font = .systemFont(ofSize: 18)
    }
    
    private func layoutRatingFilmLabel() {
        containerView.addSubview(ratingFilmLabel)
        ratingFilmLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            ratingFilmLabel.leadingAnchor.constraint(equalTo: filmsImageView.trailingAnchor, constant: 15),
            ratingFilmLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -15),
            ratingFilmLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -34)
        ])
    }
    
    private func setupRatingFilmLabel() {
        ratingFilmLabel.textAlignment = .center
        ratingFilmLabel.numberOfLines = 1
    }
    
    private func configureAttributedString(text: String) {
        let location = text.count - 3
        let lengthLast = text.count - location
        let length = text.count
    
        let attributedString = NSMutableAttributedString(string: text)
    
        let boldBlackAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 20, weight: .bold)
        ]
        let regularGrayAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.systemGray,
            .font: UIFont.systemFont(ofSize: 20, weight: .regular)
        ]
        let kernAttributes: [NSAttributedString.Key: Any] = [
            .kern: 1.5
        ]
    
        attributedString.addAttributes(regularGrayAttributes, range: NSRange(location: location, length: lengthLast))
        attributedString.addAttributes(boldBlackAttributes, range: NSRange(location: 0, length: lengthLast))
        attributedString.addAttributes(kernAttributes, range: NSRange(location: 0, length: length))
    
        ratingFilmLabel.attributedText = attributedString
    }

    // MARK: - configuration
    
    func configureFilmInfoCell(_ image: UIImage, _ name: String, _ rating: String) {
        filmsImageView.image = UIImage(named: "\(image)")
        nameFilmLabel.text = name
        configureAttributedString(text: rating)
    }
}

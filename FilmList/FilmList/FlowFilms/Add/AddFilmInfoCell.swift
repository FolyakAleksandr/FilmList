import UIKit

final class AddFilmInfoCell: UICollectionViewCell {
    // MARK: - private properties

    private let stackView = UIStackView()
    private let titleLabel = UILabel()
    private let lineLabel = UILabel()
    private let changeButton = UIButton()
    
    // MARK: - initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - setup UI
    
    private func setupUI() {
        layoutStackView()
        setupStackView()
        
        setupTitleLabel()
        setupLineLabel()
        setupChangeButton()
    }
    
    private func layoutStackView() {
        contentView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
        ])
    }
    
    private func setupStackView() {
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.axis = .vertical
        
        [titleLabel, lineLabel, changeButton].forEach { stackView.addArrangedSubview($0) }
    }
    
    private func setupTitleLabel() {
        titleLabel.font = .systemFont(ofSize: 19)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.text = "Name"
    }
    
    private func setupLineLabel() {
        lineLabel.font = .systemFont(ofSize: 17, weight: .light)
        lineLabel.textColor = .darkGray
        lineLabel.text = "-"
        lineLabel.numberOfLines = 0
        lineLabel.textAlignment = .center
    }
    
    private func setupChangeButton() {
        changeButton.backgroundColor = .white
        changeButton.setTitleColor(.systemBlue, for: .normal)
        changeButton.setTitle("Change", for: .normal)
    }
    
    // MARK: - configuration
    
    func configureAddFilmInfoCell(_ title: String) {
        titleLabel.text = title
    }
}

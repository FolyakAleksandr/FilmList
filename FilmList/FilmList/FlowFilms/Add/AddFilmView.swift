import UIKit

final class AddFilmView: UIViewController {
    // MARK: - variable

    var viewModel: AddFilmViewModel?

    // MARK: - private properties

    private let nameTitleArray = ["Name", "Your Rating", "Release Date", "YouTube Link"]

    private let contentViewForImageView = UIView()
    private let filmImageVIew = UIImageView()
    private let layout = UICollectionViewFlowLayout()
    private let dataFilmCollectionView = UICollectionView(frame: CGRect(), collectionViewLayout: UICollectionViewLayout())
    private let descriptionLabel = UILabel()
    private let descriptionTextView = UITextView()

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
        configureNavigationBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    // MARK: - setup UI

    private func setupUI() {
        layoutContentViewForImageView()
        setupContentViewForImageView()

        layoutFilmImageView()
        setupFilmImageView()

        layoutDataFilmCollectionView()
        setupDataFilmCollectionView()

        layoutDescriptionLabel()
        setupDescriptionLabel()
        
        layoutDescriptionTextView()
        setupDescriptionTextView()
    }

    private func configureNavigationBar() {
        navigationController?.setCustomAppearance(
            largeText: true,
            titleColor: .black,
            backgroundColor: .white)

        navigationItem.title = "Add new"
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        navigationController?.saveButton(target: self, action: #selector(saveButtonTapped))
    }

    @objc func saveButtonTapped() {
        viewModel?.saveButtonTapped()
    }

    private func layoutContentViewForImageView() {
        view.addSubview(contentViewForImageView)
        contentViewForImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentViewForImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25),
            contentViewForImageView.heightAnchor.constraint(equalTo: contentViewForImageView.widthAnchor, multiplier: 1),
            contentViewForImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            contentViewForImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupContentViewForImageView() {
        view.layoutIfNeeded()
        contentViewForImageView.backgroundColor = .systemGray5
        contentViewForImageView.layer.cornerRadius = contentViewForImageView.frame.height / 2
        contentViewForImageView.clipsToBounds = true
    }

    private func layoutFilmImageView() {
        contentViewForImageView.addSubview(filmImageVIew)
        filmImageVIew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filmImageVIew.widthAnchor.constraint(equalTo: contentViewForImageView.widthAnchor, multiplier: 0.7),
            filmImageVIew.heightAnchor.constraint(equalTo: filmImageVIew.widthAnchor, multiplier: 1),
            filmImageVIew.centerYAnchor.constraint(equalTo: contentViewForImageView.centerYAnchor),
            filmImageVIew.centerXAnchor.constraint(equalTo: contentViewForImageView.centerXAnchor)
        ])
    }

    private func setupFilmImageView() {
        filmImageVIew.image = UIImage(systemName: "photo")
        filmImageVIew.tintColor = .darkGray
        filmImageVIew.contentMode = .scaleAspectFit
    }

    private func layoutDataFilmCollectionView() {
        view.addSubview(dataFilmCollectionView)
        dataFilmCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            dataFilmCollectionView.topAnchor.constraint(equalTo: contentViewForImageView.bottomAnchor, constant: 15),
            dataFilmCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dataFilmCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            dataFilmCollectionView.heightAnchor.constraint(equalTo: dataFilmCollectionView.widthAnchor, multiplier: 0.7)
        ])
    }

    private func setupDataFilmCollectionView() {
        layout.minimumLineSpacing = 30
        dataFilmCollectionView.collectionViewLayout = layout
        dataFilmCollectionView.delegate = self
        dataFilmCollectionView.dataSource = self
        dataFilmCollectionView.register(AddFilmInfoCell.self, forCellWithReuseIdentifier: "AddFilmInfoCell")
    }

    private func layoutDescriptionLabel() {
        view.addSubview(descriptionLabel)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: dataFilmCollectionView.bottomAnchor, constant: 0),
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupDescriptionLabel() {
        descriptionLabel.text = "Description"
        descriptionLabel.font = .systemFont(ofSize: 24, weight: .regular)
    }

    private func layoutDescriptionTextView() {
        view.addSubview(descriptionTextView)
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 10),
            descriptionTextView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            descriptionTextView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8),
            descriptionTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15)
        ])
    }
    
    private func setupDescriptionTextView() {
        descriptionTextView.textColor = .black
        descriptionTextView.font = .systemFont(ofSize: 16, weight: .light)
        descriptionTextView.layer.shadowColor = UIColor.systemGray4.cgColor
        descriptionTextView.layer.shadowRadius = 5
        descriptionTextView.layer.shadowOpacity = 0.8
        descriptionTextView.layer.shadowOffset = CGSize(width: 0, height: 0)
        descriptionTextView.layer.cornerRadius = 8
        descriptionTextView.clipsToBounds = false
    }
}

// MARK: - extension

extension AddFilmView: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        nameTitleArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddFilmInfoCell", for: indexPath) as? AddFilmInfoCell else { return UICollectionViewCell() }
        cell.configureAddFilmInfoCell(nameTitleArray[indexPath.item])
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2.3
        let height = width / 1.7

        return CGSize(width: width, height: height)
    }
}

import UIKit

final class ListFilmsView: UIViewController {
    // MARK: - private properties

    private let filmsTableView = UITableView()

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    // MARK: - setup UI

    private func setupUI() {
        layoutFilmsTableView()
        setupFilmsTableView()
    }

    private func layoutFilmsTableView() {
        view.addSubview(filmsTableView)
        filmsTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            filmsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            filmsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            filmsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            filmsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
        ])
    }

    private func setupFilmsTableView() {
        filmsTableView.delegate = self
        filmsTableView.dataSource = self
        filmsTableView.showsVerticalScrollIndicator = false
        filmsTableView.separatorStyle = .none
    }
}

// MARK: - extension

extension ListFilmsView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        UITableViewCell()
    }
}

import UIKit

final class AddFilmView: UIViewController {
    // MARK: - variable

    var viewModel: AddFilmViewModel?

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureBindings()
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

    private func configureNavigationBar() {
        navigationController?.setCustomAppearance(
            largeText: false,
            titleColor: .black,
            backgroundColor: .white)

        navigationItem.title = ""
        navigationController?.navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.topItem?.hidesBackButton = true
        navigationController?.saveButton(target: self, action: #selector(saveButtonTapped))
    }

    @objc func saveButtonTapped() {
        viewModel?.saveButtonTapped()
    }

    private func configureBindings() {
        viewModel?.navigationToListFilmView = { [weak self] in
            guard let self else { return }
            navigationController?.popToRootViewController(animated: true)
        }
    }
}

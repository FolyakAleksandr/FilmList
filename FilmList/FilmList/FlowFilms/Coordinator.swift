import UIKit

protocol AppCoordinator {
    func start()
}

final class Coordinator: AppCoordinator {
    let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        showMainScreen()
    }

    func showMainScreen() {
        let view = ListFilmsView()
        let viewModel = DefaultListFilmsViewModel()
        view.viewModel = viewModel

        navigationController.pushViewController(view, animated: true)

        viewModel.navigateToAddFilmView = { [weak self] in
            guard let self else { return }
            showAddScreen()
        }
    }

    func showAddScreen() {
        let view = AddFilmView()
        let viewModel = DefaultAddFilmViewModel()
        view.viewModel = viewModel
        navigationController.pushViewController(view, animated: true)

        viewModel.navigationToListFilmView = { [weak self] in
            guard let self else { return }
            navigationController.popToRootViewController(animated: true)
        }
    }
}

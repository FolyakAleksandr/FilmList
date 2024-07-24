protocol ListFilmsViewModel: AnyObject {
    func buttonTaped()
    var navigateToAddFilmView: (() -> ())? { get set }
}

final class DefaultListFilmsViewModel: ListFilmsViewModel {
    var navigateToAddFilmView: (() -> ())?

    func buttonTaped() {
        navigateToAddFilmView?()
    }
}

protocol AddFilmViewModel: AnyObject {
    func saveButtonTapped()

    var navigationToListFilmView: (() -> ())? { get set }
}

final class DefaultAddFilmViewModel: AddFilmViewModel {
    var navigationToListFilmView: (() -> ())?

    func saveButtonTapped() {
        navigationToListFilmView?()
    }
}

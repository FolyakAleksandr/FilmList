import UIKit

final class ChangeNameView: UIViewController {
    // MARK: - variable

    var viewModel: ChangedNameViewModel?

    // MARK: - private properties

    private let titleLabel = UILabel()
    private let nameTextField = UITextField()
    private let borderBottom = UIView()
    private let saveButton = UIButton()

    // MARK: - lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }

    // MARK: - setup UI

    private func setupUI() {
        layoutTitleLabel()
        setupTitleLabel()

        layoutNameTextField()
        setupNameTextField()

        layoutBorderBottom()
        setupBorderBottom()
        
        layoutSaveButton()
        setupSaveButton()
        
        closeKeyboard()
    }

    private func layoutTitleLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 7)
        ])
    }

    private func setupTitleLabel() {
        titleLabel.text = "Film Name"
        titleLabel.font = .systemFont(ofSize: 28, weight: .regular)
        titleLabel.textColor = .black
    }

    private func layoutNameTextField() {
        view.addSubview(nameTextField)
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 7),
            nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.75),
            nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    private func setupNameTextField() {
        nameTextField.placeholder = "Name"
        nameTextField.textColor = .systemGray2
        nameTextField.layer.borderWidth = 0
    }

    private func layoutBorderBottom() {
        view.addSubview(borderBottom)
        borderBottom.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            borderBottom.topAnchor.constraint(equalToSystemSpacingBelow: nameTextField.bottomAnchor, multiplier: 2),
            borderBottom.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            borderBottom.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.85),
            borderBottom.heightAnchor.constraint(equalToConstant: 0.5)
        ])
    }

    private func setupBorderBottom() {
        borderBottom.backgroundColor = .systemGray2
    }

    private func layoutSaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            saveButton.topAnchor.constraint(equalToSystemSpacingBelow: borderBottom.bottomAnchor, multiplier: 5)
        ])
    }
    
    private func setupSaveButton() {
        saveButton.backgroundColor = .clear
        saveButton.setTitle("Save", for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.setTitleColor(.systemGray, for: .highlighted)
    }
    
    private func closeKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedView))
        view.addGestureRecognizer(tap)
    }
    
    @objc private func tappedView() {
        view.endEditing(true)
    }
}

import UIKit


class AskViewTouchbleView: UIView, UITextFieldDelegate {
    
    //MARK: - UI
    
    weak var arriveDelegate: ArriveDelegate?
    
    let topStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    let topImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "planeDepart")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    let topTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Откуда - Москва"
        textField.textColor = Colors.rlyWhite.color
        textField.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        
        if let _ = currentForm {
            textField.text = currentForm!
        }
        
        return textField
    }()
    
    let lineView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        return view
    }()
    
    let bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        return stackView
    }()
    
    let bottomLeftImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "glass")
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    let bottomTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Куда - Турция"
        textField.font = UIFont(name: "SFProDisplay-Medium", size: 16)
        textField.textColor = Colors.rlyWhite.color
        return textField
    }()
    
    private let bottomRightImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "union")
        imageView.tintColor = UIColor(red: 159/255, green: 159/255, blue: 159/255, alpha: 1)
        imageView.contentMode = .scaleAspectFit
        imageView.setContentHuggingPriority(.required, for: .horizontal)
        imageView.setContentHuggingPriority(.required, for: .vertical)
        imageView.setContentCompressionResistancePriority(.required, for: .horizontal)
        imageView.setContentCompressionResistancePriority(.required, for: .vertical)
        return imageView
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Setup View

    func setupView() {
        
        bottomTextField.delegate = self
        topTextField.delegate = self
        
        backgroundColor = Colors.semiGray.color
        layer.cornerRadius = 16
        
        topStackView.addArrangedSubview(topImageView)
        topStackView.addArrangedSubview(topTextField)

        bottomStackView.addArrangedSubview(bottomLeftImageView)
        bottomStackView.addArrangedSubview(bottomTextField)
        bottomStackView.addArrangedSubview(bottomRightImageView)
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(clear))
        bottomRightImageView.addGestureRecognizer(gesture)
        bottomRightImageView.isUserInteractionEnabled = true
        
        addSubview(topStackView)
        addSubview(lineView)
        addSubview(bottomStackView)
        
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        lineView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            topImageView.heightAnchor.constraint(equalTo: topImageView.widthAnchor),
            bottomLeftImageView.heightAnchor.constraint(equalTo: topImageView.widthAnchor),
            bottomLeftImageView.widthAnchor.constraint(equalTo: topImageView.widthAnchor),
            bottomRightImageView.heightAnchor.constraint(equalTo: topImageView.widthAnchor),
            bottomRightImageView.widthAnchor.constraint(equalTo: topImageView.widthAnchor),
                
            topStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            topStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            topStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),

            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            lineView.heightAnchor.constraint(equalToConstant: 2),
            lineView.centerYAnchor.constraint(equalTo: centerYAnchor),

            bottomStackView.topAnchor.constraint(equalTo: lineView.bottomAnchor, constant: 8),
            bottomStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            bottomStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomStackView.heightAnchor.constraint(equalTo: topStackView.heightAnchor)
        ])
        
    }
}


// MARK: - textField delegate
extension AskViewTouchbleView {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let cyrillicSet = CharacterSet(charactersIn: "абвгдеёжзийклмнопрстуфхцчшщъыьэюяАБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ -")
        return string.isEmpty || string.rangeOfCharacter(from: cyrillicSet) != nil
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if let bottomText = bottomTextField.text,
           let topText = topTextField.text,
           !bottomText.isEmpty,
           !topText.isEmpty {
            print("Оба текстовых поля заполнены")
            currentForm = topText
            currentTo = bottomText
            arriveDelegate?.didPickedCities(from: topText, to: bottomText)
        }
        else {
            if textField == topTextField {
                bottomTextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
        }
        
        return true
    }
}


    //MARK: - Actions
extension AskViewTouchbleView {
    @objc func clear(){
        bottomTextField.text = nil
    }
}

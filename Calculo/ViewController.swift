//
//  ViewController.swift
//  Calculo
//
//  Created by francielly pazello on 27/04/25.
//

import UIKit

class ViewController: UIViewController {

    // Elementos da interface
    private let number1TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o primeiro número"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.accessibilityLabel = "Primeiro número"
        return textField
    }()

    private let number2TextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o segundo número"
        textField.borderStyle = .roundedRect
        textField.keyboardType = .numberPad
        textField.accessibilityLabel = "Segundo número"
        return textField
    }()

    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado:"
        label.textAlignment = .center
        label.accessibilityLabel = "Resultado da soma"
        return label
    }()

    private let calculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calcular", for: .normal)
        button.addTarget(self, action: #selector(calculateSum), for: .touchUpInside)
        button.accessibilityLabel = "Botão Calcular"
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground 

        // Configuração de acessibilidade
        configureAccessibility()
        setupLayout()
    }

    private func configureAccessibility() {
        // Ajuste de ordem lógica de navegação
        view.accessibilityElements = [
            number1TextField,
            number2TextField,
            calculateButton,
            resultLabel
        ]

        // Suporte a tamanhos de texto ajustáveis
        resultLabel.font = UIFont.preferredFont(forTextStyle: .body)
        resultLabel.adjustsFontForContentSizeCategory = true

        number1TextField.font = UIFont.preferredFont(forTextStyle: .body)
        number1TextField.adjustsFontForContentSizeCategory = true

        number2TextField.font = UIFont.preferredFont(forTextStyle: .body)
        number2TextField.adjustsFontForContentSizeCategory = true

        calculateButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        calculateButton.titleLabel?.adjustsFontForContentSizeCategory = true
    }

    private func setupLayout() {
        // Adicionando subviews
        view.addSubview(number1TextField)
        view.addSubview(number2TextField)
        view.addSubview(resultLabel)
        view.addSubview(calculateButton)

        // Configurando constraints
        number1TextField.translatesAutoresizingMaskIntoConstraints = false
        number2TextField.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        calculateButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            number1TextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            number1TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number1TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            number2TextField.topAnchor.constraint(equalTo: number1TextField.bottomAnchor, constant: 20),
            number2TextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            number2TextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            resultLabel.topAnchor.constraint(equalTo: number2TextField.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            calculateButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    @objc private func calculateSum() {
        guard let number1Text = number1TextField.text, let number1 = Double(number1Text),
              let number2Text = number2TextField.text, let number2 = Double(number2Text) else {
            resultLabel.text = "Por favor, insira números válidos."
            return
        }

        let sum = number1 + number2
        resultLabel.text = "Resultado: \(sum)"
    }
}


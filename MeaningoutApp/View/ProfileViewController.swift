//
//  ProfileViewController.swift
//  MeaningoutApp
//
//  Created by 심소영 on 7/9/24.
//

import UIKit

final class ProfileViewController: BaseViewController {
    
    let ud = UserDefaultManager()
    let viewModel = ProfileViewModel()
    var profileImage = ProfileImage(imageAlpha: 1, radius: 60, bordercolor: TextResource.ColorRGB.orangeCG, width: 3)
    let selecteButton = OrangeButton(title: TextResource.ButtonText.finish)
    let cameraButton = CameraButton.init(frame: .zero)
    let textField = NicknameTextField(frame: .zero)
    let controlLabel = ControlLabel(titleText: TextResource.LabelText.nicknameDefalut)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData(){
        viewModel.outputLabel.bind { value in
            self.controlLabel.text = value
        }
        viewModel.outputColor.bind { value in
            self.controlLabel.textColor = value ? .systemGreen: .systemRed
            self.selecteButton.isEnabled = value
            self.selecteButton.backgroundColor = value ? .systemOrange: .gray
        }
    }
    override func configureView() {
        super.configureView()
        navigationItem.title = TextResource.NavigationText.profile.rawValue
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.backIndicatorImage = UIImage(systemName: TextResource.SystemImageName.chevron.rawValue)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    override func configureHierarchy() {
        view.addSubview(profileImage)
        view.addSubview(selecteButton)
        view.addSubview(cameraButton)
        view.addSubview(textField)
        view.addSubview(controlLabel)
        textField.delegate = self
        cameraButton.addTarget(self, action: #selector(cameraButtonTapped), for: .touchUpInside)
        selecteButton.addTarget(self, action: #selector(selecteButtonTapped), for: .touchUpInside)
    }
    override func configureConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.size.equalTo(120)
            make.centerX.equalTo(self.view)
        }
        cameraButton.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).inset(30)
            make.size.equalTo(30)
            make.centerX.equalTo(self.view).offset(40)
        }
        textField.snp.makeConstraints { make in
            make.top.equalTo(profileImage.snp.bottom).offset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
            make.height.equalTo(44)
        }
        controlLabel.snp.makeConstraints { make in
            make.top.equalTo(textField.snp.bottom).offset(20)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        selecteButton.snp.makeConstraints { make in
            make.top.equalTo(controlLabel.snp.bottom).offset(30)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
    }
    @objc func cameraButtonTapped(){
        //navigationController?.pushViewController(ImageSettingViewController(), animated: true)
    }
    @objc func selecteButtonTapped(){
        ud.nickname = textField.text ?? ""
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let currentDateString = formatter.string(from: Date())
        ud.date = "\(currentDateString)"
        
        UserDefaults.standard.set(true, forKey: "isUser")
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowScene?.delegate as? SceneDelegate
       // let rootViewController = TabBarController()
       // sceneDelegate?.window?.rootViewController = rootViewController
        sceneDelegate?.window?.makeKeyAndVisible()
    }
}

extension ProfileViewController: UITextFieldDelegate {
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        viewModel.inputText.value = textField.text
//        return true
//    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        viewModel.inputText.value = textField.text
    }
}

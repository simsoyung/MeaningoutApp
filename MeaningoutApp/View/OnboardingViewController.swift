//
//  OnboardingViewController.swift
//  MeaningoutApp
//
//  Created by 심소영 on 7/9/24.
//

import UIKit
import SnapKit

final class OnboardingViewController: BaseViewController {
    
    let logoImage = UIImageView()
    let launchImage = UIImageView()
    let startButton = OrangeButton(title: .start)
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func configureView() {
        super.configureView()
        logoImage.image = UIImage(named: "logo")
        logoImage.contentMode = .scaleAspectFill
        launchImage.image = UIImage(named: "launch")
        launchImage.contentMode = .scaleAspectFit
        startButton.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    }
    override func configureHierarchy() {
        view.addSubview(logoImage)
        view.addSubview(launchImage)
        view.addSubview(startButton)
    }
    override func configureConstraints() {
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(11)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(21)
        }
        launchImage.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        startButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(21)
            make.height.equalTo(44)
        }
    }
    @objc func startButtonTapped(){
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
}

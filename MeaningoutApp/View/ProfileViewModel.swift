//
//  ProfileViewModel.swift
//  MeaningoutApp
//
//  Created by 심소영 on 7/9/24.
//

import Foundation

class ProfileViewModel {
    var inputText: Observable<String?> = Observable(nil)
    var outputLabel: Observable<String?> = Observable(nil)
    var outputColor = Observable(false)
    init(){
        inputText.bind { _ in
            self.validation()
        }
    }
    private func validation(){
        guard let text = inputText.value else { return }
        if text.isEmpty {
            outputLabel.value = "값을 입력해주세요!!"
            outputColor.value = false
            return
        }
        let num = CharacterSet(charactersIn: "0123456789")
        if text.rangeOfCharacter(from: num) != nil {
            outputLabel.value = "닉네임에 숫자는 포함할 수 없어요 :("
            outputColor.value = false
            return
        }
        let char = CharacterSet(charactersIn: "@#$%")
        if text.rangeOfCharacter(from: char) != nil {
            outputLabel.value = "닉네임에 @,#,$,%는 포함할 수 없어요"
            outputColor.value = false
            return
        }
        if text.count >= 2 && text.count < 10 {
            outputLabel.value = "사용할 수 있는 닉네임입니다"
            outputColor.value = true
            return
        } else {
            outputLabel.value = "2글자 이상 10글자 미만으로 설정해주세요"
            outputColor.value = false
            return
        }
        
    }
    
}

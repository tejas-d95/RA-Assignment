//
//  CheckboxButton.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 30/06/23.
//

import UIKit

class CheckboxButton: UIButton {
    let checkedImage = AppImages.checkedBoxImage
    let uncheckedImage = AppImages.uncheckedBoxImage
    
    // Property to track checkbox state
    var isChecked: Bool = false {
        didSet {
            updateCheckboxImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        updateCheckboxImage()
    }
    
    // Toggle checkbox state when tapped
    @objc private func checkboxTapped() {
        isChecked.toggle()
    }
    
    // Update checkbox image based on the current state
    private func updateCheckboxImage() {
        let image = isChecked ? checkedImage : uncheckedImage
        setImage(image, for: .normal)
    }
}


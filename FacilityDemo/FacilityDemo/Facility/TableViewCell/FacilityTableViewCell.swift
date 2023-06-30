//
//  FacilityTableViewCell.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import UIKit

class FacilityTableViewCell: UITableViewCell {

    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var icon: UIImageView!
    
    func configureCell(with option: Option) {
        name.text = option.name
        icon.image = UIImage(named: option.icon)
    }

    var isExpanded = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


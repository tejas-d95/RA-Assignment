//
//  FacilityTableDataSource.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 29/06/23.
//

import Foundation
import UIKit

class FacilityTableDataSource: NSObject, UITableViewDataSource {
    var facilities: [Facility]?
    private var viewModel: ViewModel!
    private var lastSelectedOption: (Int?, Option?)
    
    init(viewModel: ViewModel!) {
        self.viewModel = viewModel
        super.init()
        viewModel.delegateCombinationCheck = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.facilities.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if viewModel.collapsedSections.contains(section) {
                return 0 // Return 0 rows for collapsed sections
            } else {
                return viewModel.facilities[section].options.count
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constant.facilityTableViewCellIdentifier, for: indexPath) as? FacilityTableViewCell else {
            return UITableViewCell()
        }
        
        let facility = viewModel.facilities[indexPath.section]
        let option = facility.options[indexPath.row]
        
        cell.configureCell(with: option)
        cell.tag = indexPath.section
        
        // Create a checkbox button as the accessory view
        let checkBoxButton = CheckboxButton(frame: CGRect(x: 50, y: 50, width: 24, height: 24))
        checkBoxButton.addTarget(self, action: #selector(checkboxTapped(_:)), for: .touchUpInside)
        checkBoxButton.tag = indexPath.row
        
        // Determine if the option is selected and set the checkbox state
        if let selectedOption = facility.selectedOption, selectedOption == option {
            checkBoxButton.isChecked = true
        }
        
        cell.accessoryView = checkBoxButton
        return cell
    }
    
    
    @objc func checkboxTapped(_ sender: UIButton) {
        let indexPath = IndexPath(row: sender.tag, section: sender.superview?.tag ?? 0)
        let facility = viewModel.facilities[indexPath.section]
        let option = facility.options[indexPath.row]
        
        lastSelectedOption = (indexPath.section, facility.selectedOption)
        
        // Toggle the selection state of the option
        if facility.selectedOption == option {
            viewModel.facilities[indexPath.section].selectedOption = nil
        } else {
            viewModel.facilities[indexPath.section].selectedOption = option
        }
        viewModel.checkIfExlusionSetCombination()
    }

}

extension FacilityTableDataSource: CombinationCheckDelegate {
    func combinationCheckComplete() {
        guard let section = lastSelectedOption.0 else { return }
        if let lastselectedOption = lastSelectedOption.1 {
            viewModel.facilities[section].selectedOption = lastselectedOption
        }else {
            viewModel.facilities[section].selectedOption = nil
        }
    }
}

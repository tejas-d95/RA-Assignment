//
//  FacilityTableDelegate.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 29/06/23.
//

import Foundation
import UIKit

class FacilityTableDelegate: NSObject, UITableViewDelegate {
    let dataSource: FacilityTableDataSource
    let viewModel: ViewModel
    
    init(dataSource: FacilityTableDataSource, viewModel: ViewModel) {
        self.dataSource = dataSource
        self.viewModel = viewModel
        super.init()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        guard let accessoryView = cell.accessoryView as? UIButton else { return }
        dataSource.checkboxTapped(accessoryView)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        // Allow selection only if the option is not already selected in the section
        let selectedOption = viewModel.facilities[indexPath.section].selectedOption
        return selectedOption == nil ? indexPath : nil
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // Create a custom header view
        let facility = viewModel.facilities[section]
        let headerView = headerViewForTable(with: tableView.frame, section: section, title: facility.name)
        
        // Add a tap gesture recognizer to the header view
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerTapped(_:)))
        headerView?.addGestureRecognizer(tapGesture)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    @objc func headerTapped(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let section = gestureRecognizer.view?.tag else { return }
        
        if viewModel.collapsedSections.contains(section) {
            viewModel.collapsedSections.remove(section)
        } else {
            viewModel.collapsedSections.insert(section)
        }
        
        guard let gestureView = gestureRecognizer.view?.superview as? UITableView else { return }
        gestureView.reloadSections(IndexSet(integer: section), with: .automatic)
    }
        

}

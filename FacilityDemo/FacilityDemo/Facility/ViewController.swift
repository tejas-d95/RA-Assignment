//
//  ViewController.swift
//  FacilityDemo
//
//  Created by Tejas Dubal on 28/06/23.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var facilityTableView: UITableView!
    private var viewModel: ViewModel!
    private var dataSource: FacilityTableDataSource!
    private var tableDelegate: FacilityTableDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
        setupTableView()
    }

    //Setting up View Model
    private func setupViewModel() {
        viewModel = ViewModel()
        viewModel.setDelegate(self)
        viewModel.fetchFacilities()
    }
    
    // Configure table view
    private func setupTableView() {
        self.dataSource = FacilityTableDataSource(viewModel: self.viewModel)
        facilityTableView.dataSource = dataSource
        
        self.tableDelegate = FacilityTableDelegate(dataSource: self.dataSource, viewModel: self.viewModel)
        facilityTableView.delegate = tableDelegate
        
        facilityTableView.register(UINib(nibName: Constant.facilityTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: Constant.facilityTableViewCellIdentifier)
    }

}

//MARK: View Model Delegate
extension ViewController: ViewModelDelegate {
    func facilitiesLoaded() {
        DispatchQueue.main.async {
            self.facilityTableView.reloadData()
        }
    }

    func showError(title: String, message: String) {
        showErrorAlert(title: title, message: message, viewController: self)
    }
    
    func showWrongCombinationError(title: String, message: String) {
        showErrorAlert(title: title, message: message, viewController: self) {
            okClicked in
            self.viewModel.combinationAlertOkClicked = okClicked
        }
    }
}

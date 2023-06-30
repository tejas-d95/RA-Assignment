import Foundation
import Combine

protocol CombinationCheckDelegate {
    func combinationCheckComplete()
}

protocol ViewModelDelegate: AnyObject {
    func facilitiesLoaded()
    func showError(title: String, message: String)
    func showWrongCombinationError(title: String, message: String)
}

class ViewModel {
    private weak var delegate: ViewModelDelegate?
    var delegateCombinationCheck: CombinationCheckDelegate?

    @Published var facilities: [Facility] = []
    @Published var combinationAlertOkClicked = false

    private var exclusions: [[Exclusion]] = [[]]
    private var cancellables = Set<AnyCancellable>()
        
    var collapsedSections = Set<Int>()

    func setDelegate(_ delegate: ViewModelDelegate) {
        self.delegate = delegate
        setupObserving()
    }

    //MARK: API Request - Get facilities and exlusions from server
    func fetchFacilities() {
        guard let facilityUrl = URL(string: ApiEndpoints.facility) else {
            delegate?.showError(title: ErrorTitle.genericTitle, message: ErrorMessage.invalidURL)
            return
        }
        
        let networkManager = NetworkManager()
        networkManager.getApiData(requestUrl: facilityUrl, resultType: EstateModel.self) { [weak self] result in
            switch result {
            case .success(let response):
                self?.facilities = response.facilities
                self?.exclusions = response.exclusions
                self?.delegate?.facilitiesLoaded()
            case .failure(let error):
                self?.delegate?.showError(title: ErrorTitle.genericTitle, message: error.localizedDescription)
            }
        }
    }

//MARK: Check for selected data set is exist in exclusion data set
    func checkIfExlusionSetCombination() {
        let selectedFacilities = self.facilities.filter { $0.selectedOption != nil }
        
        for exclusionSet in self.exclusions {
            var exclusionCounter = 0
            
            for exclusion in exclusionSet {
                let matchingFacilities = selectedFacilities.filter {
                    $0.facility_id == exclusion.facility_id &&
                    $0.selectedOption?.id == exclusion.options_id
                }
                
                if matchingFacilities.count > 0 {
                    exclusionCounter += 1
                }
            }
            
            if exclusionCounter == exclusionSet.count {
                debugPrint("Excluded set found")
                delegate?.showWrongCombinationError(title: ErrorTitle.exclusionFoundTitle, message: ErrorMessage.exclusionFoundError)
            }
        }
        
    }


    
    /******************************Observers************************/
    private func setupObserving() {
        $facilities.sink { [weak self] _ in
            self?.delegate?.facilitiesLoaded()
        }.store(in: &cancellables)
        
        $combinationAlertOkClicked.sink { [weak self] _ in
            self?.delegateCombinationCheck?.combinationCheckComplete()
        }.store(in: &cancellables)
    }
        
    deinit {
        cancellables.forEach { $0.cancel() }
        cancellables.removeAll()
    }
}

//
//  CoronaDomesticListVC.swift
//  Corona19Demo
//
//  Created by Sunmi on 2020/06/09.
//  Copyright © 2020 sun. All rights reserved.
//

import UIKit


// show Number of people by cities and provinces
// searchbar get city name and provinces


class CoronaDomesticListVC: UIViewController {


    var dataSource: UICollectionViewDiffableDataSource<Int, CoronaModel>! = nil
    var searchBar: UISearchBar!
    var coronaCollectionView: UICollectionView! = nil
    
    var arrayData: [CoronaModel] = []
    var filteredCoronaModel: [CoronaModel] = []
    var firstData: CoronaModel!
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSearchController()
        configureHierarchy()
        getCoronaModel()
        configureDataSource()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
     

}


extension CoronaDomesticListVC {
    
    /// - Tag: Seperate Section
    
    
    func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex: Int,
            layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in

            // The group auto-calculates the actual item width to make
            // the requested number of columns fit, so this widthDimension is ignored.
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                 heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)

            let groupHeight = sectionIndex == 0 ?
                            NSCollectionLayoutDimension.absolute(99) :
                            NSCollectionLayoutDimension.absolute(125)
  
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: groupHeight)
            let group: NSCollectionLayoutGroup!
            
            if sectionIndex == 0 {
                group = NSCollectionLayoutGroup.horizontal(layoutSize:  groupSize, subitem: item, count: 1)
            }
            else {
                group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 2)
            }
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10)
                      
            return section
        }
        return layout
    }
      
}

extension CoronaDomesticListVC {
    
    
    func configureHierarchy() {
      view.backgroundColor = .systemBackground
      coronaCollectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createLayout())
      coronaCollectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
      coronaCollectionView.backgroundColor = .systemBackground
      coronaCollectionView.register(KoreaDataCell.self, forCellWithReuseIdentifier: KoreaDataCell.reuseIdentifier)
      coronaCollectionView.register(CityDataCell.self, forCellWithReuseIdentifier: CityDataCell.reuseIdentifier)
      view.addSubview(coronaCollectionView)
      coronaCollectionView.translatesAutoresizingMaskIntoConstraints = false
   
        NSLayoutConstraint.activate([
            coronaCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor , constant: 10),
            coronaCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            coronaCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            coronaCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])

    }

    func getCoronaModel() {
        NetworkManager.shared.getCoronaData() { [weak self] result in
            
            // why?  memory leak , so [weak self]
            guard let self = self else { return }
            switch result {
            case .success(let data):
        
                self.arrayData = data
                let message = "⚠️ No data and check network status!"
                
                if self.arrayData.isEmpty {
                    DispatchQueue.main.async {
                        self.showEmptyStateView(with: message, in: self.view)
                    }
                }

                self.firstData = self.arrayData.first
                self.arrayData.remove(at: 0)
                self.updateData(on: self.arrayData)

            case .failure(let error):
                print(error.rawValue)
                self.presentAlertOnMainThread(title: "Bad Case", message: error.rawValue, buttonTitle: "OK")

            }
        }
    }
    
    func configureDataSource() {
        
        // city corona data
        dataSource = UICollectionViewDiffableDataSource<Int, CoronaModel>(collectionView: coronaCollectionView,cellProvider: { (collectionView, indexPath, coronaData) -> UICollectionViewCell? in
            
            if indexPath.section == 0  {
               
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KoreaDataCell.reuseIdentifier, for: indexPath) as? KoreaDataCell {
                    cell.set(model: self.firstData)
                    cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
                    cell.contentView.layer.borderWidth = 1
                    cell.contentView.layer.cornerRadius = 8
                    
                    return cell
                    
                } else {
                    fatalError("Cannot create new cell")
                }
                
            }
            else {
            
            
               if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CityDataCell.reuseIdentifier, for: indexPath) as? CityDataCell {
                   cell.set(model: coronaData)
                
                    cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
                    cell.contentView.layer.borderWidth = 1
                    cell.contentView.layer.cornerRadius = 8
                
                   return cell
        
               } else {
                    fatalError("Cannot create new cell")
                }
            }
            
          })

    }
    
    func updateData(on data: [CoronaModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Int, CoronaModel>()
        let sections = Array(0..<2)
  
        for section in sections {
            snapshot.appendSections([section])
            section == 0 ? snapshot.appendItems([firstData]): snapshot.appendItems(data)
        }

        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
    
    // create search bar
    // feature : show keyword area
    func createSearchController() {
        
        //IF you want frame replace first line and comment "searchBar.sizeToFit()"
        searchBar = UISearchBar()
        searchBar.searchBarStyle = UISearchBar.Style.prominent
        searchBar.placeholder = "지역이름을 입력하세요!"
        searchBar.showsCancelButton = true
        searchBar.delegate = self
        view.addSubview(searchBar)//Here change your view name
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        let width = view.frame.width - 30
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            searchBar.heightAnchor.constraint(equalToConstant: 50),
            searchBar.widthAnchor.constraint(equalToConstant: width)
        ])
        
    }
    
 
}
//countryName
extension CoronaDomesticListVC: UISearchBarDelegate {

    func searchBar(_ searchBar: UISearchBar, textDidChange textSearched: String) {
        if textSearched.isEmpty { return }
        isSearching = true
        filteredCoronaModel = arrayData.filter { $0.countryName.contains(textSearched) }
        updateData(on: filteredCoronaModel)
        
    }
     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
         isSearching = false
         updateData(on: arrayData)
        
     }
    
}

//
//  UserTagsViewController.swift
//  Foodzilla
//
//  Created by Paweł on 30/04/2023.
//

import UIKit
import Combine

protocol ChipDelegate {
    func selectChip(chip: TagsStruct)
    func deselectChip(chip: TagsStruct)
}

class UserTagsViewController: UIViewController {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var chosenTagsLabel: UILabel!
    @IBOutlet var allTagsCollectionView: UICollectionView!
    @IBOutlet var chosenTagsCollectionView: UICollectionView!
    
    let model = UserTagsViewModel()
    
    var allTagsDelegate: AllTagsDelegate!
    var chosenTagsDelegate: ChosenTagsDelegate!
    
    override func loadView() {
        super.loadView()
        
        allTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
        chosenTagsCollectionView.register(ChipCollectionViewCell.self, forCellWithReuseIdentifier: "ChipCollectionViewCell")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allTagsDelegate = .init()
        allTagsDelegate.model = model
        allTagsDelegate.delegate = self
        
        chosenTagsDelegate = .init()
        chosenTagsDelegate.model = model
        chosenTagsDelegate.delegate = self
        
        allTagsCollectionView.delegate = allTagsDelegate
        allTagsCollectionView.dataSource = allTagsDelegate
        allTagsCollectionView.allowsMultipleSelection = true
        
        chosenTagsCollectionView.delegate = chosenTagsDelegate
        chosenTagsCollectionView.dataSource = chosenTagsDelegate
        chosenTagsCollectionView.allowsMultipleSelection = true
        
        chosenTagsLabel.text = "Chosen tags:"
        titleLabel.text = "Choose tags"
        descriptionLabel.text = "tags will be automatically applied while searching recipes in search tab"
        
        model.filteredAllTagsData = model.allTagsData
    }
    
    @objc private func doneButtonTapped() {
        view.endEditing(true)
    }
    
    private func renderAfterSearch() {
        
        allTagsCollectionView.reloadSections(IndexSet(integersIn: 0..<1))
        
        model.filteredAllTagsData.forEach { tag in
            guard let allTagsChipIndex = model.filteredAllTagsData.firstIndex(where: { $0.id == tag.id }) else { return }
            if model.chosenTagsData.contains(where: { $0.id == tag.id }) {
                if let cell = allTagsCollectionView.cellForItem(at: IndexPath(item: allTagsChipIndex, section: 0)) as? ChipCollectionViewCell {
                    allTagsCollectionView.selectItem(at: IndexPath(item: allTagsChipIndex, section: 0), animated: false, scrollPosition: .top)
                    cell.chipView.accessoryView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
                    cell.chipView.accessoryView?.tintColor = .gray
                    cell.invalidateIntrinsicContentSize()
                }
            } else {
                
                if let cell = allTagsCollectionView.cellForItem(at: IndexPath(item: allTagsChipIndex, section: 0)) as? ChipCollectionViewCell {
                    cell.chipView.accessoryView = nil
                    cell.invalidateIntrinsicContentSize()
                }
            }
        }
    }
}

extension UserTagsViewController: ChipDelegate {
    func selectChip(chip: TagsStruct) {
        model.chosenTagsData.append(chip)
        chosenTagsCollectionView.reloadData()
    }
    
    func deselectChip(chip: TagsStruct) {
        let chosenChipIndex = model.chosenTagsData.firstIndex(where: { $0.id == chip.id })
        let allTagsChipIndex = model.filteredAllTagsData.firstIndex(where: { $0.id == chip.id })
        
        if let chosenChipIndex {
            model.chosenTagsData.removeAll(where: { $0.id == chip.id })
            chosenTagsCollectionView.deleteItems(at: [IndexPath(item: chosenChipIndex, section: 0)])
            
        }
        if let allTagsChipIndex {
            allTagsCollectionView.deselectItem(at: IndexPath(item: allTagsChipIndex, section: 0), animated: true)
            if let cell = allTagsCollectionView.cellForItem(at: IndexPath(item: allTagsChipIndex, section: 0)) as? ChipCollectionViewCell {
                cell.chipView.accessoryView = nil
                cell.invalidateIntrinsicContentSize()
            }
        }
    }
}

extension UserTagsViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 44))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.items = [flexibleSpace, doneButton]
        
        searchBar.searchTextField.inputAccessoryView = toolbar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        guard searchText != "" else {
            model.filteredAllTagsData = model.allTagsData
            renderAfterSearch()
            return
        }
        model.filteredAllTagsData = model.allTagsData.filter({ $0.name.lowercased().contains(searchBar.text!.lowercased()) })
        renderAfterSearch()
    }
}

class AllTagsDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var model: UserTagsViewModel!
    var delegate: ChipDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.filteredAllTagsData.filter { !$0.hidden }.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionViewCell", for: indexPath) as! ChipCollectionViewCell
        let chipView = cell.chipView
        chipView.titleLabel.text = self.model.filteredAllTagsData[indexPath.item].name
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ChipCollectionViewCell else { return }
        
        cell.chipView.accessoryView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        cell.chipView.accessoryView?.tintColor = .gray
        cell.invalidateIntrinsicContentSize()
        delegate?.selectChip(chip: self.model.filteredAllTagsData[indexPath.item])
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ChipCollectionViewCell else { return }
        
        cell.chipView.accessoryView = nil
        cell.invalidateIntrinsicContentSize()
        delegate?.deselectChip(chip: self.model.filteredAllTagsData[indexPath.item])
    }
}

class ChosenTagsDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var model: UserTagsViewModel!
    var delegate: ChipDelegate?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.model.chosenTagsData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ChipCollectionViewCell", for: indexPath) as! ChipCollectionViewCell
        collectionView.selectItem(at: indexPath, animated: false, scrollPosition: .top)
        let chipView = cell.chipView
        cell.chipView.accessoryView = UIImageView(image: UIImage(systemName: "checkmark.circle.fill"))
        cell.chipView.accessoryView?.tintColor = .gray
        chipView.titleLabel.text = self.model.chosenTagsData[indexPath.item].name
        cell.invalidateIntrinsicContentSize()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        delegate?.deselectChip(chip: self.model.chosenTagsData[indexPath.item])
    }
}

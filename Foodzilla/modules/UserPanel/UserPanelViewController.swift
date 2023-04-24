//
//  UserPanelViewController.swift
//  Foodzilla
//
//  Created by Ania Banachowicz on 23/04/2023.
//

import UIKit

final class UserPanelViewController: UIViewController {
    @IBOutlet weak var firstNameLabel: MainLabel!
    @IBOutlet weak var lastNameLabel: MainLabel!
    @IBOutlet weak var emailLabel: MainLabel!
    @IBOutlet weak var modifyButton: LandingButton!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!

    @IBOutlet weak var collectionView: UICollectionView!

    let model: UserPanelViewModel = UserPanelViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "EnabledTagViewCell", bundle: nil), forCellWithReuseIdentifier: "EnabledTagViewCell")
    }

    override func loadView() {
        super.loadView()

        usernameLabel.text = "username"
        modifyButton.title = "MODIFY FILTERS"
        firstNameLabel.mainLabel.text = "User"
        lastNameLabel.mainLabel.text = "Name"
        emailLabel.mainLabel.text = "abc@gmail.com"
    }
}

extension UserPanelViewController:
    UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return model.tags.count
        }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        guard let cell = collectionView.cellForItem(at: indexPath) as? EnabledTagViewCell else { return .zero }
//        return CGSize(width: cell.tagLabel.frame.width, height: cell.tagLabel.frame.height)
            return CGSize(width: 80, height: 50)
        }

    
    // zamiast collectioview daj sam label i przypisz label.text += cell.text + cell.text
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "EnabledTagViewCell", for: indexPath) as? EnabledTagViewCell else { fatalError() }
            cell.tagLabel.text = model.tags[indexPath.item].name

            return cell
        }

    }

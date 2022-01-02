//
//  OnboardingCollectionViewCell.swift
//  Foodie
//
//  Created by Loveth Nwakwudo on 12/31/21.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    func setUp ( _ slide : OnboardingSlide){
        slideImageView.image = slide.image
        slideTitleLabel.text = slide.title
        slideDescriptionLabel.text = slide.description
        
}
}

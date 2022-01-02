//
//  OnboardingViewController.swift
//  Foodie
//
//  Created by Loveth Nwakwudo on 12/31/21.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    var slides: [OnboardingSlide] = []
    
    //did set button title
    
    
    var currentPage = 0 {
        didSet{
            // to update current page colour dot
            pageControl.currentPage = currentPage
            
            if currentPage == slides.count - 1 {
                nextButton.setTitle("Get Started", for: .normal)
              //  nextButton.backgroundColor = UIColor(named: "black")
            }
                else
                {
                    nextButton.setTitle("Next", for: .normal)
                }
            }
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        slides = [ OnboardingSlide  (title: "Delicious Dishes", description: "Experience a variety of amazing dished from different cutures around the world.", image: #imageLiteral(resourceName: "slide2")),
                   OnboardingSlide (title: "World-Class Chefs", description:"Our dishes are prepared only by the best.", image:#imageLiteral(resourceName: "slide1")),
                   OnboardingSlide(title: "Instant World-Wide Delivery", description: "Your orders will be delivered instantly irrespective of your location around the world", image: #imageLiteral(resourceName: "slide3"))
        ]

        // Do any additional setup after loading the view.
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    

    @IBAction func nextButtonPressed(_ sender: UIButton) {
        
        if currentPage == slides.count - 1 {
            // for get started button
            let controller = storyboard?.instantiateViewController(identifier: "Home") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            present(controller, animated: true, completion: nil)
            controller.modalTransitionStyle = .flipHorizontal
            
            print("go to the next page")
        } else {
        currentPage += 1
        let indexPath = IndexPath(item: currentPage, section: 0)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return slides.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:OnboardingCollectionViewCell.identifier , for: indexPath) as! OnboardingCollectionViewCell
        
        cell.setUp(slides[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    //for page controller view color
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
       let width = scrollView.frame.width
       currentPage = Int(scrollView.contentOffset.x/width)
      
        
    }
}

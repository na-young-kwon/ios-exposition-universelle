//
//  Expo1900 - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom academy. All rights reserved.
// 

import UIKit

class ExpositionViewController: UIViewController {
    
    //MARK: - IBOutlet Properties
    
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var visitorsLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!

    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let exposition = parseExpositionFromAsset() else {
            return
        }
        configureContent(from: exposition)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
}

//MARK: - Private Methods

extension ExpositionViewController {
    
    private func parseExpositionFromAsset() -> Exposition? {
        do {
            return try Exposition()
        } catch Expo1900Error.dataNotFoundInAsset(let fileName) {
            print(Expo1900Error.dataNotFoundInAsset(fileName))
            return nil
        } catch {
            print(error)
            return nil
        }
    }
    
    private func configureContent(from exposition: Exposition) {
        titleLabel.text = exposition.title
        visitorsLabel.attributedText = exposition.visitorsDescription
        locationLabel.attributedText = exposition.locationDescription
        durationLabel.attributedText = exposition.durationDescription
        descriptionLabel.text = exposition.description
    }
}

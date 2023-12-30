//
//  HomeController.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 26/12/23.
//

import UIKit
import SwiftUI

class HomeController: UIViewController {
    // MARK: - Properties
    weak var delegate: HomeControllerDelegate?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGroupedBackground
        configureNavigationBar()
    }
    
    // MARK: - Selectors
    @objc private func handleMenuToggle() {
        print("DEBUG: handleMenuToggle Called...")
        delegate?.handleMenuToggle(forMenuOption: nil)
    }
    
    
    // MARK: - Helpers
    func configureNavigationBar() {
        title = "Side Menu"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(handleMenuToggle))
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .black
        appearence.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
}



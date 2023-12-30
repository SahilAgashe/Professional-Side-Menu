//
//  InboxController.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 30/12/23.
//

import UIKit

class InboxController: UIViewController {
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Selectors
    @objc private func handleDismiss() {
        dismiss(animated: true)
    }
    
    // MARK: - Helpers
    private func configureUI() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Inbox"
        
        let appearence = UINavigationBarAppearance()
        appearence.backgroundColor = .systemGray5
        appearence.largeTitleTextAttributes = [.foregroundColor : UIColor.black]
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        let closeSystemBarButtonItem = UIBarButtonItem(barButtonSystemItem: .close, target: self, action: #selector(handleDismiss))
        navigationItem.leftBarButtonItem = closeSystemBarButtonItem
    }
}

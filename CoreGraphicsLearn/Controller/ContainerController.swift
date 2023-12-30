//
//  ContainerController.swift
//  CoreGraphicsLearn
//
//  Created by SAHIL AMRUT AGASHE on 26/12/23.
//

import UIKit

class ContainerController: UIViewController {
    
    // MARK: - Properties
    private var menuController: MenuController?
    private var centerController: UIViewController?
    private var isExpanded = false
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureHomeController()
    }
    
    // MARK: - Override
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
        .slide
    }
    
    override var prefersStatusBarHidden: Bool {
        isExpanded
    }
    
    // MARK: - Helpers
    
    private func configureHomeController() {
        let homeController = HomeController()
        homeController.delegate = self
        centerController = UINavigationController(rootViewController: homeController)
        guard let centerController,
              let centerControllerView = centerController.view
        else { return }
        
        view.addSubview(centerControllerView)
        addChild(centerController)
        centerController.didMove(toParent: self)
    }
    
    private func configureMenuController() {
        if menuController == nil {
            menuController = MenuController()
            menuController?.delegate = self
            guard let menuController else { return }
            view.insertSubview(menuController.view, at: 0)
            addChild(menuController)
            menuController.didMove(toParent: self)
            print("DEBUG ContainerController: added menuController!")
        }
    }
    
    private func animatePanel(shouldExpand: Bool, menuOption: MenuOption?) {
        guard let centerController else { return }
        if shouldExpand {
            // show Menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut) {
                centerController.view.frame.origin.x = centerController.view.frame.width - 80
            }
            
        } else {
            // hide menu
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
                centerController.view.frame.origin.x = 0
            }, completion: { _ in
                guard let menuOption else { return }
                self.didSelectMenuOption(menuOption: menuOption)
            })
        }
        
        animateStatusBar()
    }
    
    func didSelectMenuOption(menuOption: MenuOption) {
        switch menuOption {
        case .Profile:
            present(UINavigationController(rootViewController: ProfileController()), animated: true)
        case .Inbox:
            present(UINavigationController(rootViewController: InboxController()), animated: true)
        case .Notifications:
            present(UINavigationController(rootViewController: NotificationsController()), animated: true)
        case .Settings:
            present(UINavigationController(rootViewController: SettingsController()), animated: true)
        }
    }
    
    func animateStatusBar() {
        UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0, options: .curveEaseInOut) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
}


extension ContainerController: HomeControllerDelegate {
    func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
        if !isExpanded {
            configureMenuController()
        }
        isExpanded.toggle()
        animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
    }
}

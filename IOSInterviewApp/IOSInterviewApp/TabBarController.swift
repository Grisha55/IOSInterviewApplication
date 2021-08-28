//
//  TabBarController.swift
//  IOSInterviewApp
//
//  Created by Григорий Виняр on 28.08.2021.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTabBar()
    }
    
    private func configureTabBar() {
        let menuVC = UINavigationController(rootViewController: MenuVC())
        menuVC.title = "Меню"
        
        //let settingsVC = SettingsVC()
        //settingsVC.title = "Настройки"
        
        self.setViewControllers([menuVC], animated: true)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["menubar.rectangle"]
        
        for index in 0 ..< images.count {
            items[index].image = UIImage(systemName: images[index])
        }
    }

}

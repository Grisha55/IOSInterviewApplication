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
        
        let settingsVC = UINavigationController(rootViewController: SettingsVC())
        settingsVC.title = "Настройки"
        
        self.setViewControllers([menuVC, settingsVC], animated: true)
        
        guard let items = self.tabBar.items else { return }
        
        let images = ["menubar.rectangle", "gear"]
        
        for index in 0 ..< images.count {
            items[index].image = UIImage(systemName: images[index])
        }
    }

}

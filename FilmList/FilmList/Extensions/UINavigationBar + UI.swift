import UIKit

extension UINavigationController {
    func setCustomAppearance(largeText: Bool, titleColor: UIColor, backgroundColor: UIColor?) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        
        appearance.titleTextAttributes = [
            .foregroundColor: titleColor,
            .font: UIFont.systemFont(ofSize: 18, weight: .light)
        ]
        
        appearance.largeTitleTextAttributes = [
            .foregroundColor: titleColor,
            .font: UIFont.systemFont(ofSize: 30, weight: .bold)
        ]
        
        self.navigationBar.prefersLargeTitles = largeText
        
        self.navigationBar.standardAppearance = appearance
        self.navigationBar.scrollEdgeAppearance = appearance
        self.navigationBar.compactAppearance = appearance
    }
    
    func addPlusButton(target: Any, action: Selector) {
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: target, action: action)
        self.navigationBar.topItem?.rightBarButtonItem = plusButton
    }
    
    func saveButton(target: Any, action: Selector) {
        let saveButton = UIBarButtonItem(title: "Save", style: .plain, target: target, action: action)
        self.navigationBar.topItem?.rightBarButtonItem = saveButton
    }
}

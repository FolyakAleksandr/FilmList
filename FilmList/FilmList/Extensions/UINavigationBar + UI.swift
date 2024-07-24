import UIKit

extension UINavigationBar {
    func setCustomAppearance(title: String, titleColor: UIColor, backgroundColor: UIColor) {
        let appearance = UINavigationBarAppearance()
        
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor
        
        self.standardAppearance = appearance
        self.scrollEdgeAppearance = appearance
        self.compactAppearance = appearance
        
        self.prefersLargeTitles = true
        self.topItem?.title = title
    }
    
    func addPlusButton(target: Any, action: Selector) {
        let plusButton = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: target, action: action)
        self.topItem?.rightBarButtonItem = plusButton
    }
}

import UIKit
import PureLayout

class MainViewController: UIViewController {
    fileprivate var mainView: MainView!
    fileprivate var imagePicker: UIImagePickerController!

    override func loadView() {
        super.loadView()
        applyOwnSettings()
        createMainView()
        createImagePicker()
    }

    fileprivate func applyOwnSettings() {
        self.view.backgroundColor = UIColor.white
        self.edgesForExtendedLayout = UIRectEdge()
        self.title = "ContactCircleView example app"
    }

    fileprivate func createMainView() {
        mainView = MainView()
        mainView.delegate = self
        self.view.addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges()
    }

    fileprivate func createImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
    }
}

extension MainViewController: MainViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func mainView(_ view: MainView, didTapApplyButton button: UIButton) {
        view.updateContactInitialsView()
    }

    func mainView(_ view: MainView, didTapApplyWithImageButton button: UIButton) {
        self.present(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:Any]) {
        picker.dismiss(animated: true, completion: nil)
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            mainView.refreshCircleViewWithImage(image)
        }
    }
}

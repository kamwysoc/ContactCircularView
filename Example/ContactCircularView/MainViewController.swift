import UIKit
import PureLayout

class MainViewController: UIViewController {
    private var mainView: MainView!
    private var imagePicker: UIImagePickerController!

    override func loadView() {
        super.loadView()
        applyOwnSettings()
        createMainView()
        createImagePicker()
    }

    private func applyOwnSettings() {
        self.view.backgroundColor = UIColor.whiteColor()
        self.edgesForExtendedLayout = .None
        self.title = "ContactCircleView example app"
    }

    private func createMainView() {
        mainView = MainView()
        mainView.delegate = self;
        self.view.addSubview(mainView)
        mainView.autoPinEdgesToSuperviewEdges()
    }

    private func createImagePicker() {
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.allowsEditing = true
    }
}

extension MainViewController: MainViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func mainView(view: MainView, didTapApplyButton button: UIButton) {
        view.updateContactInitialsView()
    }

    func mainView(view: MainView, didTapApplyWithImageButton button: UIButton) {
        self.presentViewController(imagePicker, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String:AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: nil)
        if let image = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            mainView.refreshCircleViewWithImage(image)
        }
    }
}
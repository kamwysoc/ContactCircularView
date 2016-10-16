import Foundation
import UIKit
import ContactCircularView

protocol MainViewDelegate {
    func mainView(_ view: MainView, didTapApplyButton button: UIButton)

    func mainView(_ view: MainView, didTapApplyWithImageButton button: UIButton)
}

class MainView: UIView {
    fileprivate var nameTextField: UITextField!
    fileprivate var switchDescriptionLabel: UILabel!
    fileprivate var applyButton: UIButton!
    fileprivate var applyWithImageButton: UIButton!
    fileprivate var tableView: UITableView!
    fileprivate var contactInitialsView: ContactCircularView!
    fileprivate var borderSwitch: UISwitch!
    var delegate: MainViewDelegate?

    let circleViewColors = [UIColor.red, UIColor.blue, UIColor.brown]
    var colorCellSelections = [true, false, false]

    init() {
        super.init(frame: CGRect.zero)
        createNameTextField()
        createButton()
        createApplyWithImageButton()
        createSwitchDescriptionLabel()
        createSwitch()
        createTableView()
        createContactInitialsView()
        applyConstraints()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    fileprivate func createNameTextField() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Type your name here"
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.gray.cgColor
        nameTextField.textAlignment = .center
        addSubview(nameTextField)
    }

    fileprivate func createSwitchDescriptionLabel() {
        switchDescriptionLabel = UILabel()
        switchDescriptionLabel.text = "View with border : "
        switchDescriptionLabel.numberOfLines = 1
        addSubview(switchDescriptionLabel)
    }

    fileprivate func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        addSubview(tableView)
    }

    fileprivate func createButton() {
        applyButton = UIButton()
        applyButton.setTitle("Apply", for: UIControlState())
        applyButton.layer.cornerRadius = 5
        applyButton.addTarget(self, action: #selector(refreshContactView(_:)), for: .touchUpInside)
        applyButton.backgroundColor = UIColor.gray
        addSubview(applyButton)
    }

    fileprivate func createApplyWithImageButton() {
        applyWithImageButton = UIButton()
        applyWithImageButton.setTitle("Image", for: UIControlState())
        applyWithImageButton.layer.cornerRadius = 5
        applyWithImageButton.addTarget(self, action: #selector(applyWithImage(_:)), for: .touchUpInside)
        applyWithImageButton.backgroundColor = UIColor.gray
        addSubview(applyWithImageButton)
    }

    fileprivate func createSwitch() {
        borderSwitch = UISwitch()
        addSubview(borderSwitch)
    }

    fileprivate func createContactInitialsView() {
        contactInitialsView = ContactCircularView()
        contactInitialsView.backgroundColor = UIColor.red
        contactInitialsView.applyTextColor(UIColor.white)
        addSubview(contactInitialsView)
    }

    func refreshContactView(_ sender: UIButton) {
        delegate?.mainView(self, didTapApplyButton: sender)
    }

    func applyWithImage(_ sender: UIButton) {
        delegate?.mainView(self, didTapApplyWithImageButton: sender)
    }

    fileprivate func applyConstraints() {
        nameTextField.autoPinEdge(toSuperviewEdge: .top, withInset: 30)
        nameTextField.autoAlignAxis(toSuperviewAxis: .vertical)
        nameTextField.autoSetDimension(.width, toSize: 250.0)
        nameTextField.autoSetDimension(.height, toSize: 50.0)

        switchDescriptionLabel.autoPinEdge(.left, to: .left, of: nameTextField)
        switchDescriptionLabel.autoAlignAxis(.horizontal, toSameAxisOf: borderSwitch)
        switchDescriptionLabel.autoPinEdge(.right, to: .left, of: borderSwitch, withOffset: -5.0)

        borderSwitch.autoPinEdge(.top, to: .bottom, of: nameTextField, withOffset: 10.0)
        borderSwitch.autoPinEdge(.right, to: .right, of: nameTextField)

        tableView.autoPinEdge(.left, to: .left, of: nameTextField)
        tableView.autoPinEdge(.top, to: .bottom, of: switchDescriptionLabel, withOffset: 10.0)
        tableView.autoSetDimension(.height, toSize: 150)
        tableView.autoPinEdge(.right, to: .right, of: nameTextField)

        applyButton.autoPinEdge(.top, to: .bottom, of: tableView, withOffset: 15.0)
        applyButton.autoPinEdge(.left, to: .left, of: tableView)
        applyButton.autoSetDimension(.width, toSize: 80.0)
        applyButton.autoSetDimension(.height, toSize: 40.0)

        applyWithImageButton.autoPinEdge(.top, to: .bottom, of: tableView, withOffset: 15.0)
        applyWithImageButton.autoPinEdge(.right, to: .right, of: tableView)
        applyWithImageButton.autoSetDimension(.height, toSize: 40.0)
        applyWithImageButton.autoSetDimension(.width, toSize: 80.0)


        contactInitialsView.autoPinEdge(.top, to: .bottom, of: applyButton, withOffset: 15.0)
        contactInitialsView.autoAlignAxis(toSuperviewAxis: .vertical)
        contactInitialsView.autoSetDimension(.height, toSize: 60.0)
        contactInitialsView.autoSetDimension(.width, toSize: 60.0)
    }

    func updateContactInitialsView() {
        contactInitialsView.applyInitialsFromName(nameTextField.text)
        let selectedColor = circleViewColors[colorCellSelections.index(of: true)!]
        contactInitialsView.backgroundColor = selectedColor
        if (borderSwitch.isOn) {
            contactInitialsView.applyBorderWithColor(UIColor.green, andWidth: 2.0)
        } else {
            contactInitialsView.removeBorder()
        }
    }

    func refreshCircleViewWithImage(_ image: UIImage) {
        contactInitialsView.applyImage(image)
        if (borderSwitch.isOn) {
            contactInitialsView.applyBorderWithColor(UIColor.green, andWidth: 2.0)
        } else {
            contactInitialsView.removeBorder()
        }
    }

}

extension MainView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = circleViewColors[(indexPath as NSIndexPath).row]
        if (colorCellSelections[(indexPath as NSIndexPath).row]) {
            cell.textLabel?.textAlignment = .center
            cell.textLabel?.text = "selected"
        }
        cell.selectionStyle = .none
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circleViewColors.count
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        colorCellSelections = [false, false, false]
        colorCellSelections[(indexPath as NSIndexPath).row] = true
        tableView.reloadData()
    }
}

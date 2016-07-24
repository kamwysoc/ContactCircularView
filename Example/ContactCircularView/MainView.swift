import Foundation
import UIKit
import ContactCircularView

protocol MainViewDelegate {
    func mainView(view: MainView, didTapApplyButton button: UIButton)

    func mainView(view: MainView, didTapApplyWithImageButton button: UIButton)
}

class MainView: UIView {
    private var nameTextField: UITextField!
    private var switchDescriptionLabel: UILabel!
    private var applyButton: UIButton!
    private var applyWithImageButton: UIButton!
    private var tableView: UITableView!
    private var contactInitialsView: ContactCircularView!
    private var borderSwitch: UISwitch!
    var delegate: MainViewDelegate?

    let circleViewColors = [UIColor.redColor(), UIColor.blueColor(), UIColor.brownColor()]
    var colorCellSelections = [true, false, false]

    init() {
        super.init(frame: CGRectZero)
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

    private func createNameTextField() {
        nameTextField = UITextField()
        nameTextField.placeholder = "Type your name here"
        nameTextField.layer.borderWidth = 1.0
        nameTextField.layer.borderColor = UIColor.grayColor().CGColor
        nameTextField.textAlignment = .Center
        self.addSubview(nameTextField)
    }

    private func createSwitchDescriptionLabel() {
        switchDescriptionLabel = UILabel()
        switchDescriptionLabel.text = "View with border : "
        switchDescriptionLabel.numberOfLines = 1
        self.addSubview(switchDescriptionLabel)
    }

    private func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.scrollEnabled = false
        self.addSubview(tableView)
    }

    private func createButton() {
        applyButton = UIButton()
        applyButton.setTitle("Apply", forState: .Normal)
        applyButton.layer.cornerRadius = 5
        applyButton.addTarget(self, action: #selector(refreshContactView(_:)), forControlEvents: .TouchUpInside)
        applyButton.backgroundColor = UIColor.grayColor()
        self.addSubview(applyButton)
    }

    private func createApplyWithImageButton() {
        applyWithImageButton = UIButton()
        applyWithImageButton.setTitle("Image", forState: .Normal)
        applyWithImageButton.layer.cornerRadius = 5
        applyWithImageButton.addTarget(self, action: #selector(applyWithImage(_:)), forControlEvents: .TouchUpInside)
        applyWithImageButton.backgroundColor = UIColor.grayColor()
        self.addSubview(applyWithImageButton)
    }

    private func createSwitch() {
        borderSwitch = UISwitch()
        self.addSubview(borderSwitch)
    }

    private func createContactInitialsView() {
        contactInitialsView = ContactCircularView()
        contactInitialsView.backgroundColor = UIColor.redColor()
        self.addSubview(contactInitialsView)
    }

    func refreshContactView(sender: UIButton) {
        self.delegate?.mainView(self, didTapApplyButton: sender)
    }

    func applyWithImage(sender: UIButton) {
        self.delegate?.mainView(self, didTapApplyWithImageButton: sender)
    }

    private func applyConstraints() {
        nameTextField.autoPinEdgeToSuperviewEdge(.Top, withInset: 30)
        nameTextField.autoAlignAxisToSuperviewAxis(.Vertical)
        nameTextField.autoSetDimension(.Width, toSize: 250.0)
        nameTextField.autoSetDimension(.Height, toSize: 50.0)

        switchDescriptionLabel.autoPinEdge(.Left, toEdge: .Left, ofView: nameTextField)
        switchDescriptionLabel.autoAlignAxis(.Horizontal, toSameAxisOfView: borderSwitch)
        switchDescriptionLabel.autoPinEdge(.Right, toEdge: .Left, ofView: borderSwitch, withOffset: -5.0)

        borderSwitch.autoPinEdge(.Top, toEdge: .Bottom, ofView: nameTextField, withOffset: 10.0)
        borderSwitch.autoPinEdge(.Right, toEdge: .Right, ofView: nameTextField)

        tableView.autoPinEdge(.Left, toEdge: .Left, ofView: nameTextField)
        tableView.autoPinEdge(.Top, toEdge: .Bottom, ofView: switchDescriptionLabel, withOffset: 10.0)
        tableView.autoSetDimension(.Height, toSize: 150)
        tableView.autoPinEdge(.Right, toEdge: .Right, ofView: nameTextField)

        applyButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: tableView, withOffset: 15.0)
        applyButton.autoPinEdge(.Left, toEdge: .Left, ofView: tableView)
        applyButton.autoSetDimension(.Width, toSize: 80.0)
        applyButton.autoSetDimension(.Height, toSize: 40.0)

        applyWithImageButton.autoPinEdge(.Top, toEdge: .Bottom, ofView: tableView, withOffset: 15.0)
        applyWithImageButton.autoPinEdge(.Right, toEdge: .Right, ofView: tableView)
        applyWithImageButton.autoSetDimension(.Height, toSize: 40.0)
        applyWithImageButton.autoSetDimension(.Width, toSize: 80.0)


        contactInitialsView.autoPinEdge(.Top, toEdge: .Bottom, ofView: applyButton, withOffset: 15.0)
        contactInitialsView.autoAlignAxisToSuperviewAxis(.Vertical)
        contactInitialsView.autoSetDimension(.Height, toSize: 60.0)
        contactInitialsView.autoSetDimension(.Width, toSize: 60.0)
    }

    func updateContactInitialsView() {
        contactInitialsView.applyInitialsFromName(nameTextField.text);
        let selectedColor = circleViewColors[colorCellSelections.indexOf(true)!]
        contactInitialsView.backgroundColor = selectedColor
        if (borderSwitch.on) {
            contactInitialsView.applyBorderWithColor(UIColor.greenColor(), andWidth: 2.0)
        } else {
            contactInitialsView.removeBorder()
        }
    }

    func refreshCircleViewWithImage(image: UIImage) {
        contactInitialsView.applyImage(image)
        if (borderSwitch.on) {
            contactInitialsView.applyBorderWithColor(UIColor.greenColor(), andWidth: 2.0)
        } else {
            contactInitialsView.removeBorder()
        }
    }

}

extension MainView: UITableViewDelegate, UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.backgroundColor = circleViewColors[indexPath.row]
        if (colorCellSelections[indexPath.row]) {
            cell.textLabel?.textAlignment = .Center
            cell.textLabel?.text = "selected"
        }
        cell.selectionStyle = .None
        return cell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return circleViewColors.count
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        colorCellSelections = [false, false, false]
        colorCellSelections[indexPath.row] = true
        tableView.reloadData()
    }
}

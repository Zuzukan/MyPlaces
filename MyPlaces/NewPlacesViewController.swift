//
//  NewPlacesViewController.swift
//  MyPlaces
//
//  Created by Ruslan Bihun on 20.01.2022.
//

import UIKit

class NewPlacesViewController: UITableViewController {
    var newPlace: Place?
    var imageIsChanged = false
    
    //MARK: - IB Outlets
    @IBOutlet weak var placeImage: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var typeTextField: UITextField!
    @IBOutlet weak var saveBarButton: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveBarButton.isEnabled = false
        nameTextField.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    func saveNewPlace() {
        
        var image: UIImage?
        
        if imageIsChanged == true {
            image = placeImage.image
        } else {
            image = #imageLiteral(resourceName: "imagePlaceholder")
        }
        
        newPlace = Place(placeImage: nil,
                         name: nameTextField.text!,
                         location: locationTextField.text,
                         type: typeTextField.text,
                         image: image)
       
    }
    
    //MARK: - TableView Setup
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            alertSeet()
        } else {
            view.endEditing(true)
        }
    }
    
     
    
}

//MARK: - TextFieldDelegate
extension NewPlacesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.endEditing(true)
        return   true
    }
    @objc private func textFieldChanged() {
        if nameTextField.text?.isEmpty == false {
            saveBarButton.isEnabled = true
        } else {
            saveBarButton.isEnabled = false
        }
    }
}
//MARK: - Alert Creation
extension NewPlacesViewController {
    func alertSeet() {
        let alertSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let imageCamera = #imageLiteral(resourceName: "camera")
        let camera = UIAlertAction(title: "Camera", style: .default) { _ in
            self.chooseImagePicker(source: .camera)
        }
        camera.setValue(imageCamera, forKey: "image")
        camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let imagePhoto = #imageLiteral(resourceName: "photo")
        let photo = UIAlertAction(title: "Photo", style: .default) { _ in
            self.chooseImagePicker(source: .savedPhotosAlbum)
        }
        photo.setValue(imagePhoto, forKey: "image")
        photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
        
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        alertSheet.addAction(camera)
        alertSheet.addAction(photo)
        alertSheet.addAction(cancel)
        present(alertSheet, animated: true)
    }
}

//MARK: - Work with Image
extension NewPlacesViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        placeImage.image = info[.editedImage] as? UIImage
        imageIsChanged = true
        placeImage.contentMode = .scaleAspectFill
        placeImage.clipsToBounds = true
        dismiss(animated: true)
        
    }
    
    
    
    
}

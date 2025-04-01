//
//  SubmitController.swift
//  TheBigThing
//
// Created by zhaqy079.
// Reference: https://www.youtube.com/watch?v=OZrUrz7_AZw 

import SwiftUI

struct SubmitController: View {
    
    @State private var name: String = ""
    @State private var location: String = ""
    @State private var description: String = ""
    @State private var image: UIImage? = nil
    @State private var showImagePicker: Bool = false
    
    var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Big Thing Info")) {
                        TextField("Name", text: $name)
                        TextField("Location", text: $location)
                        TextField("Description", text: $description)
                    }

                    Section(header: Text("Upload Image")) {
                        if let image = image {
                            Image(uiImage: image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 200)
                                .cornerRadius(10)
                        } else {
                            Button(action: {
                                showImagePicker = true
                            }) {
                                Text("Select an Image")
                                    .foregroundColor(.blue)
                            }
                        }
                    }

                    Section {
                        Button(action: submitBigThing) {
                            Text("Submit")
                                .frame(maxWidth: .infinity, alignment: .center)
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.blue)
                                .cornerRadius(8)
                        }
                    }
                }
                .navigationTitle("Submit a Big Thing")
                .sheet(isPresented: $showImagePicker) {
                    ImagePicker(selectedImage: $image)
                }
            }
        }

    // submit button
    private func submitBigThing() {
           // Validate input fields
           guard !name.isEmpty, !location.isEmpty, !description.isEmpty else {
               print("Please fill all fields.")
               return
           }
           
           // Create a new BigThing object
        // Create a new BigThing object using the user-entered values
            let newBigThing = BigThing(
                uid: UUID().uuidString, // Generate a unique ID for the new BigThing
                name: name,
                details: description,
                location: location,
                year: "2024",
                status: "New",
                latitude: "0.0",
                longitude: "0.0",
                rating: "0",
                votes: "0",
                photo: image ?? UIImage() // Use the selected image or an empty UIImage if none is provided
            )
            
        // Add the new BigThing to the DataManager
           DataManager.shared.addNewBigThing(newBigThing)
           
           // Notify the list to reload data
           NotificationCenter.default.post(name: NSNotification.Name("BigThingsUpdated"), object: nil)
           
       }
   }


// ImagePicker to select an image
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var selectedImage: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let image = info[.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            picker.dismiss(animated: true)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

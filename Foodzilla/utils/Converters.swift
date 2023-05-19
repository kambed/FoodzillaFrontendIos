//
//  Converters.swift
//  Foodzilla
//
//  Created by Paweł on 18/05/2023.
//

func convertBase64ToUIImage(base64String: String) -> UIImage? {
    guard let imageData = Data(base64Encoded: base64String) else {
        return nil
    }
    
    return UIImage(data: imageData)
}

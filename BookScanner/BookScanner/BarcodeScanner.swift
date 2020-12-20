//
//  BarcodeScanner.swift
//  BookScanner
//
//  Created by Tharindu Darshana on 19/12/20.
//

import UIKit
import SwiftUI
import AVFoundation

struct BarcodeScanner: UIViewControllerRepresentable {
    @Binding var isbn : String?
    
    @Environment(\.presentationMode) private var presentataionMode
    
    func updateViewController(_uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.black
        
        context.coordinator.captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else {fatalError()}
        
        let videoInput: AVCaptureDeviceInput
        videoInput = try! AVCaptureDeviceInput(device: videoCaptureDevice)
        
        if(context.coordinator.captureSession.canAddInput(videoInput)){
            context.coordinator.captureSession.addInput(videoInput)
        } else {
            print("Could not input capture session")
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if(context.coordinator.captureSession.canAddOutput(metadataOutput)){
            context.coordinator.captureSession.addOutput(metadataOutput)
            metadataOutput.setMetadataObjectsDelegate(context.coordinator, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.ean8, .ean13, .pdf417]
        } else {
            print("Output problem")
        }
        
        context.coordinator.previewLayer = AVCaptureVideoPreviewLayer(session: context.coordinator.captureSession)
        context.coordinator.previewLayer.frame = vc.view.layer.bounds
        context.coordinator.previewLayer.videoGravity = .resizeAspectFill
        vc.view.layer.addSublayer(context.coordinator.previewLayer)
        
        context.coordinator.captureSession.startRunning()
        
        return vc
    }
}

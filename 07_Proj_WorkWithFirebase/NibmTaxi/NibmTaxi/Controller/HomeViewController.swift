//
//  HomeViewController.swift
//  NibmTaxi
//
//  Created by thusitha on 8/8/20.
//  Copyright © 2020 nibm. All rights reserved.
//

import UIKit
import Firebase
import MapKit

class HomeViewController: UIViewController {
    // MARK: - Properties
    
    private let mapView = MKMapView()
    private let locationManager = CLLocationManager()
    
    private let inputActivationUIView = LocationInputActivationUIView ()
    private let locationInputView = LocationInputView()
    
    // MARK: - Lifecycale
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkIsUserLoggedIn()
        enableLocationServices()
        //        signOut()
        view.backgroundColor = .white
    }
    
    //MARK: API
    
    func checkIsUserLoggedIn() {
        if(Auth.auth().currentUser?.uid == nil) {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginViewController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        } else {
            configureUI()
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print("DEBUG: sign out error")
        }
    }
    
    // MARK: - Helper Function
    
    func configureUI() {
        confugireMapView()
        
        view.addSubview(inputActivationUIView)
        inputActivationUIView.centerX(inView: view)
        inputActivationUIView.setDimensions(height: 50, width: view.frame.width - 64)
        inputActivationUIView.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        inputActivationUIView.alpha = 0
        inputActivationUIView.delegate = self
        
        UIView.animate(withDuration: 2) {
            self.inputActivationUIView.alpha = 1
        }
    }
    
    func confugireMapView() {
        view.addSubview(mapView)
        mapView.frame = view.frame
        
        mapView.showsUserLocation = true
        mapView.userTrackingMode = .follow
    }
    
    func configureLocationInputView () {
        locationInputView.delegate = self
        
        view.addSubview(locationInputView)
        locationInputView.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 200)
        locationInputView.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.locationInputView.alpha = 1
        }) { _ in
            print("DEBUG: Present table view")
        }
    }
}

// MARK: - LocationServices

extension HomeViewController: CLLocationManagerDelegate {
    
    func enableLocationServices() {
        
        locationManager.delegate = self
        
        switch CLLocationManager.authorizationStatus() {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted, .denied:
            break
        case .authorizedWhenInUse:
            locationManager.requestAlwaysAuthorization()
        case .authorizedAlways:
            locationManager.startUpdatingLocation()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .authorizedWhenInUse {
            locationManager.requestAlwaysAuthorization()
        }
    }
}

// MARK: - LocationInputActivationUIViewDelegate

extension HomeViewController: LocationInputActivationUIViewDelegate {
    func presentLocationInputView() {
        inputActivationUIView.alpha = 0
        configureLocationInputView()
    }
}

extension HomeViewController: LocationInputViewDelegate {
    func dismissLocationInputView() {
        UIView.animate(withDuration: 0.3, animations: {
            self.locationInputView.alpha = 0
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                self.inputActivationUIView.alpha = 1
            }
        }
    }
}

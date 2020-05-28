//
//  ViewController.swift
//  task2.2Lab9
//
//  Created by Ivan on 15.05.2020.
//  Copyright © 2020 Ivan. All rights reserved.
//

import UIKit
import CoreData
import MapKit
import CoreLocation

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,MKMapViewDelegate, WeatherGetterDelegate {
    func didNotGetWeather(error: NSError) {
        
    }
    
    
    var foundRoutes = [NSManagedObject]();
    var weather : WeatherGetter!;
    
    @IBOutlet weak var FromField: UITextField!
    @IBOutlet weak var table: UITableView!
    @IBOutlet weak var ToField: UITextField!
    @IBOutlet weak var Map: MKMapView!
    
    private var locationManager = LocationManager();
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        foundRoutes.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = table.dequeueReusableCell(withIdentifier: "RouteCell", for: indexPath) as! RouteCell;
        
        var route = foundRoutes[indexPath.row];
        
        cell.Name.text = NSLocalizedString(route.value(forKey: "name") as! String,comment: "");
        cell.Amount.text = String( route.value(forKey: "prise") as! Int64)+NSLocalizedString("rubels", comment: "some comment");
        cell.Hours.text = String(route.value(forKey: "duration") as! Int64)+NSLocalizedString("hours", comment: "some comment");
        cell.FreeSpace.text = String( route.value(forKey: "freeSpace") as! Bool == true ?  "+":"-");
        
        return cell;
        
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        DisplayWether(city: (view.annotation?.title!)!);
    }
    
    private func DisplayWether(city:String){
        weather.getWeatherByCity(city: city);
    }
    
    func didGetWeather(weather: Weather) {
      // This method is called asynchronously, which means it won't execute in the main queue.
      // All UI code needs to execute in the main queue, which is why we're wrapping the code
      // that updates all the labels in a dispatch_async() call.
      DispatchQueue.main.async{
        

        var weatherInfo = "";
        weatherInfo+=String( weather.tempCelsius)+" C \n";

        weatherInfo+=weather.weatherDescription+"\n";
        
        let alert = UIAlertController(title:NSLocalizedString("Weather", comment: "some comment"), message: weatherInfo, preferredStyle: UIAlertController.Style.actionSheet)
        alert.preferredContentSize = self.preferredContentSize;
        alert.addAction(UIAlertAction(title: NSLocalizedString("Close", comment: "Close comment"), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        
      }
      
    }
    
    
    @IBAction func SearchButtonClicked(_ sender: Any) {
        
        var searchRequest = NSFetchRequest<Route>(entityName: "Route");
        
        searchRequest.predicate=NSPredicate(format: "from == %@ && to == %@", FromField.text!, ToField.text!);
        
        try!
        foundRoutes=appDelegate.persistentContainer.viewContext.fetch(searchRequest);
        
        table.reloadData();
        
        
        Map.removeAnnotations(Map.annotations);
        
        locationManager.getLocation(forPlaceCalled: FromField.text!){
            location in
            self.MarkLocation(title: self.FromField.text!, location: location!)
        }
        
        locationManager.getLocation(forPlaceCalled: ToField.text!){
            location in
            self.MarkLocation(title: self.ToField.text!, location: location!)
        }
        
    }
    
    private func MarkLocation(title: String, location: CLLocation){
        
        var annotation = MKPointAnnotation();
        annotation.coordinate=location.coordinate;
        annotation.title=title;
        
        Map.addAnnotation(annotation);
        
        
    }
    

    
   var appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        weather =  WeatherGetter(delegate: self)
        let ReqVar = NSFetchRequest<NSFetchRequestResult>(entityName: "Route")
        let DelAllReqVar = NSBatchDeleteRequest(fetchRequest: ReqVar)
        do { try appDelegate.persistentContainer.viewContext.execute(DelAllReqVar) }
        catch { print(error) }
            
            UserDefaults.standard.setValue(true, forKey: "DidSetup");
            
            //Fill the database
      
            var     newObject     = NSEntityDescription.insertNewObject(forEntityName: "Route", into: appDelegate.persistentContainer.viewContext) as NSManagedObject ;
             
             newObject.setValue("Station-1",     forKey:     "name");
            newObject.setValue("Minsk",     forKey:     "from");
             newObject.setValue("Brest",     forKey:     "to");
            newObject.setValue(2,     forKey:     "duration");
             newObject.setValue(true,     forKey:     "freeSpace");
             newObject.setValue(30,     forKey:     "prise");
            
                 newObject     = NSEntityDescription.insertNewObject(forEntityName: "Route", into: appDelegate.persistentContainer.viewContext) as NSManagedObject ;
                     
                     newObject.setValue("Station-2",     forKey:     "name");
                    newObject.setValue("Minsk",     forKey:     "from");
                     newObject.setValue("Brest",     forKey:     "to");
                     newObject.setValue(false,     forKey:     "freeSpace");
                     newObject.setValue(14,     forKey:     "prise");
            newObject.setValue(2,     forKey:     "duration");
            
                newObject     = NSEntityDescription.insertNewObject(forEntityName: "Route", into: appDelegate.persistentContainer.viewContext) as NSManagedObject ;
                     
                     newObject.setValue("Station-B8",     forKey:     "name");
                    newObject.setValue("Mogilev",     forKey:     "from");
                     newObject.setValue("Brest",     forKey:     "to");
                     newObject.setValue(true,     forKey:     "freeSpace");
                     newObject.setValue(18,     forKey:     "prise");
            newObject.setValue(1,     forKey:     "duration");
            
            newObject     = NSEntityDescription.insertNewObject(forEntityName: "Route", into: appDelegate.persistentContainer.viewContext) as NSManagedObject ;
             
            
            
             newObject.setValue("Station-CR2",     forKey:     "name");
            newObject.setValue("Mogilev",     forKey:     "from");
             newObject.setValue("Minsk",     forKey:     "to");
             newObject.setValue(false,     forKey:     "freeSpace");
             newObject.setValue(18,     forKey:     "prise");
            newObject.setValue(4,     forKey:     "duration");
            
            newObject     = NSEntityDescription.insertNewObject(forEntityName: "Route", into: appDelegate.persistentContainer.viewContext) as NSManagedObject ;
             
             newObject.setValue("Station-PS2",     forKey:     "name");
            newObject.setValue("Brest",     forKey:     "from");
             newObject.setValue("Minsk",     forKey:     "to");
             newObject.setValue(true,     forKey:     "freeSpace");
             newObject.setValue(20,     forKey:     "prise");
            newObject.setValue(4,     forKey:     "duration");
            
            try!
            appDelegate.persistentContainer.viewContext.save();
        
    }
    
    
    
    
    


}


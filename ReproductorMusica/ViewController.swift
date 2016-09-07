//
//  ViewController.swift
//  ReproductorMusica
//
//  Created by Jesus Manuel Porras on 9/3/16.
//  Copyright © 2016 Jesus Manuel Porras. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //-----------vars-------------------------------
    var reproductor: AVAudioPlayer!
    var volumenActual: Float = 30
    var canciones: [String: String] = ["01": "Luis Miguel - La media vuelta.", "02" : "Moby - Lift me up.", "03" : "Julieta Venegas - Me voy.", "04" : "Keane - Open your eyes", "05" : "Zoé - Poli Love"]
    //-------------functions------------------------
    func randomSong()->String{
            let randomIndex = Int(arc4random_uniform(UInt32(canciones.count)))
        
            let rowToSelect:NSIndexPath = NSIndexPath(forRow: randomIndex, inSection: 0);
            self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None);
        
            return "0\(randomIndex+1)"
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return canciones.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        cell.nombre.text = canciones["0\(indexPath.row + 1)"]
        let rowToSelect:NSIndexPath = NSIndexPath(forRow: 0, inSection: 0);
        self.tableView.selectRowAtIndexPath(rowToSelect, animated: true, scrollPosition: UITableViewScrollPosition.None);
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        seleccionarCancion(String("0\(indexPath.row + 1)"))
        reproductor.play()
    }
    
    

    
    //------------Sel Cancion------------------------
    func seleccionarCancion(cancion: String){
        let sonidoURL = NSBundle.mainBundle().URLForResource(String(cancion), withExtension: "mp3")
        imagen.image = UIImage(named: "cover\(cancion).jpg")
        titulo.text = canciones[cancion]
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            volumenActual = volume.value
            reproductor.volume = volumenActual
        } catch {
            print("Error al cargar el archivo de sonido")
        }
    }
    //-----------------Inicialización-----------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        let sonidoURL = NSBundle.mainBundle().URLForResource("01", withExtension: "mp3")
            imagen.image = UIImage(named: ("cover01.jpg"))
            titulo.text = canciones["01"]
        
        do{
            try reproductor = AVAudioPlayer(contentsOfURL: sonidoURL!)
            reproductor.volume = 0.3
        } catch {
            print("Error al cargar el archivo de sonido")
        }

    }

    //--------------Actions-----------------------
    
    
    @IBOutlet weak var tableView: UITableView!

    
    
    @IBOutlet weak var titulo: UILabel!
    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var btnReproducir: UIButton!
    
    
    @IBAction func detener() {
        if (reproductor.playing){
            reproductor.stop()
            reproductor.currentTime = 0.0
        }
    }
    
    @IBAction func reproducir() {
        if (!reproductor.playing){
            
            reproductor.play()
        }
    }
    
    @IBAction func shuffle() {
        if (reproductor.playing){
            reproductor.stop()
        }
        seleccionarCancion(String(randomSong()))
        
       
        
        
        
        reproductor.play()
    }

    @IBAction func pausa() {
        if (reproductor.playing){
            reproductor.pause()
        }
    }
    
    @IBOutlet weak var volume: UISlider!
    
    
    @IBAction func actionVolume(sender: AnyObject) {
        volumenActual = volume.value
        reproductor.volume = volumenActual
    }
    
}


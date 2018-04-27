//
//  HomeTableViewController.swift
//  demo24042018
//
//  Created by NguyenThanhTri on 4/26/18.
//  Copyright © 2018 CPU12131. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    var g_Foods:[Food] = [
        Food(foodName: "Beef Hamburger", foodDescription: "Bring the wine and 400ml of the stock to a simmer (chicken or vegetable are the most versatile, but ham, fish or beef may work better, depending on your choice of ingredients: if you’re using a stock pot or cube, which can be salty, taste and dilute as necessary before use). Red wine is sometimes used for risottos featuring beef or sausages.", imageName: "food1.jpg", foodRating: 3),
        Food(foodName: "Pork Hamburger", foodDescription: "Over a medium-low heat, melt two tablespoons of the butter in a wide, shallow pan for which you have a lid (a wide pan means that more of the rice will come into contact with the stock, so it will cook more evenly). If you’re making a seafood risotto, or would simply prefer to keep the dish dairy-free, use extra-virgin olive oil instead.", imageName: "food2.jpg", foodRating: 2),
        Food(foodName: "Cheese Fried", foodDescription: "we have a small favour to ask. More people are reading the Guardian than ever but advertising revenues across the media are falling fast. And unlike many news organisations, we haven’t put up a paywall – we want to keep our journalism as open as we can. So you can see why we need to ask for your help. The Guardian’s independent, investigative journalism takes a lot of time, money and hard work to produce. But we do it because we believe our perspective matters – because it might well be your perspective, too.", imageName: "food3.jpg", foodRating: 4),
        Food(foodName: "Bacon", foodDescription: "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", imageName: "food5.jpg", foodRating: 5),
        Food(foodName: "Beef Steak", foodDescription: "Stir in the remaining parsley mixture, drizzle with the remaining two tablespoons of oil, and garnish with the fried chickpeas and a good grind of pepper.", imageName: "food6.jpg", foodRating: 1),
        Food(foodName: "Medium Steak", foodDescription: "No data", imageName: "food7.jpg", foodRating: 3),
        Food(foodName: "Wagu Meat", foodDescription: "Put the first six ingredients and two teaspoons of salt in a large saute pan for which you have a lid, then put it on a medium heat and fry gently for eight minutes, stirring often, until the chickpeas are slightly crisp. Transfer a third of the chickpeas to a small bowl, to use as a garnish. \n In a second bowl, combine the parsley, lemon zest, capers and olives, then add two-thirds of this mix to the saute pan with the cherry tomatoes, sugar and caraway seeds, and cook for two minutes more, stirring often. \n Add the pasta, stock and 200ml water, and bring up to a simmer. Turn the heat to medium, cover with a lid and leave to cook, undisturbed, for 12-14 minutes, until the pasta is al dente.", imageName: "food8.jpg", foodRating: 5),
    ]
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK - datasource for table view controller
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return g_Foods.count
    }
    
    // INIT ROW TYPE
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "foodCell", for: indexPath) as! FoodTableViewCell
        let food = g_Foods[indexPath.row]
        cell.gFood = food
        return cell
    }
    
    // SET ROW HEIGHT
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    // CHANGE VIEW WHEN TAPPING 1 ROW
    var selectedFood: Food?     // stored the selected food to prepare for segue
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFood = g_Foods[indexPath.row]
        // GO TO PREPARE() FUNCTION
        performSegue(withIdentifier: "showFoodDetailSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFoodDetailSegue" {
            let foodInfo = segue.destination as! FoodDetailTableViewController
            foodInfo.gFood = selectedFood
        }
    }

    // ADD UNWIND SEGUE
    @IBAction func backToHome(segue: UIStoryboardSegue){}
    
    
}

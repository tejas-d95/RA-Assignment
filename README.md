# RA-RealEstate
RA-iOSAssignment

This project is an assignemnt project to assess my development skills. It has list of facilities with options that can be used to filter the properties. 

# Features
1. List of facilities
2. Collapsible sections
3. Option selection to filter properties

# Design Patterns Used
MVVM 
<br><br>I am new to MVVM design pattern, I did my best to implement here in this project. 
<br>You can find speperate class for each responsibility intead of loading multiple responsibilities to single class. You can find speperate class for table view datasource and table view delegate.
<br><br>Dependancy injection has been used to inject view model to the viewcontroller so that code can be easy to test. Protocols has been used to communicate between view model and view controller.
<br><br>Combine framework has been used to demonestrate my knowledge regarding observer pattern. Whenever anything changes to facilitis data facilities table will get reloaded automaticall. 

# File Structure 
Repository Pattern 

# Locations
1. Model - Facility Demo/Facility/Model
2. View Model - Facility Demo/Facility/ViewModel
3. View Controller - Facility Demo/Facility/View Controller

# Networking
Please note I havn't used any third party library like Alamofire, I belive Swift has the copability and feasible to implement our own networking class using URLSession and Generics.   <br>Location to Networking class - Facility Demo/Facility/Networking

# Views
1. Facility and option list has been created using single storyboard, I think for single screen application like this single storyboard is better way.
2. Table view cell has been created using custom XIB class 
3. Custom Views - Check box has been created by customizing UIButton

# Common
You can find common views and properties here - Facility Demo/Common

# Contact
Please feel free to reach at tejasdubal95@gmail.com for any queries. Thank you !



## RA-iOSAssignment

This project is an assignment designed to assess my iOS development skills. It features a list of facilities with options that users can use to filter the properties.

### Features

1. List of facilities: The app displays a list of facilities available to users.
2. Collapsible sections: Users can collapse or expand sections for better navigation.
3. Option selection to filter properties: Users can select options to filter and refine the displayed properties.

### Design Patterns Used

MVVM:
- The MVVM design pattern is employed in the project to keep responsibilities separate and promote code maintainability.
- Each responsibility has its own class, including separate classes for table view data source and delegate.
- Dependency injection is used to inject view models into view controllers, enhancing testability.
- Protocols are employed for communication between view models and view controllers.
- The Combine framework is used to demonstrate knowledge of the observer pattern. Changes to the facilities data automatically trigger a reload of the facilities table.

### File Structure

Repository Pattern:
- The project follows the Repository Pattern to organize files and separate concerns.
- The structure includes distinct directories for models, view models, view controllers, and networking components.

### Locations

1. Model - Facility Demo/Facility/Model: Contains model classes for the project.
2. View Model - Facility Demo/Facility/ViewModel: Holds the view model classes responsible for managing the data presented in the views.
3. View Controller - Facility Demo/Facility/View Controller: Contains view controller classes responsible for handling user interactions and view presentation.

### Networking

- The project uses native URLSession and generics for networking instead of relying on third-party libraries like Alamofire.
- Networking classes can be found in the "Facility Demo/Facility/Networking" directory.

### Views

1. Facility and option list: These views are created using a single storyboard, providing a cohesive user experience for the entire screen.
2. Table view cell: A custom XIB class is used to represent the table view cell, ensuring a consistent look and feel.
3. Custom views - Checkbox: A custom UIButton is used to create a checkbox-like view, enhancing the user interface.

### Common

- Common views and properties are centralized in the "Facility Demo/Common" directory, promoting code reusability and maintainability.

### Contact 
- Please fell free to contact me at tejasdubal95@mail.com for any queries. Thank You !

# Collectify
iOS Summer Internship Shopify Challenge

## Screenshots
<img src="Collections.png" width ="260" height="460"> <img src="Products.png" width ="260" height="460">

## Startup Guide

```bash
https://github.com/woodward4422/Collectify.git
```

```bash
pod install
```

## Dependencies
* Result - Dependency used in the CustomCollectionService to handle Networking responses without having to pass around nil for responses and instead allows you to define your different error cases, implemented in Swift standard library in Swift 5
* Alamofire - Simple networking dependency that also handles the decoding of date with the Codable protocol
* KingFisher - Image downloading and cacheing

## File Structure
This project follows an MVC structure with the use of a Service layer, the structure goes as follows: 

* Models - All the necessary Models that all conform to Codable to allow for a seamless interaction between the network layer and the models
* Controllers - Contains logic to layout views and to populate data into these views from the Models
* Views - All the UIViews, UICollectionViews, and UICollectionViewCells and specific layout/constraint logic


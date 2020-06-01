-- MySQL dump 10.13  Distrib 5.7.29, for osx10.13 (x86_64)
--
-- Host: localhost    Database: pizza
-- ------------------------------------------------------
-- Server version	5.7.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id_order` int(11) NOT NULL AUTO_INCREMENT,
  `location` varchar(244) DEFAULT NULL,
  `id_order_product` smallint(6) DEFAULT NULL,
  `username` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  KEY `id_order_product` (`id_order_product`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`id_order_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'square Lenina',2,'testio'),(2,'Teatralnaya str. #5',4,'testio'),(3,'Teatralnaya str. #8',5,'testio'),(4,'Railway station',1,'testio'),(5,'Hrushevskogo str. 12 office #24',4,'testio'),(6,'Hrushevskogo str.8',2,'testio'),(7,'Hrushevskogo str.8',1,'testio'),(8,'Hrushevskogo str.8',5,'testio'),(9,'Kyivska str.123',1,'testio'),(10,'48.562340, 32.735902',3,'testio'),(11,'48.654012, 32.375838',4,'testio'),(12,'48.986434, 32.640924',1,'testio'),(13,'48.485358, 32.352081',2,'testio'),(14,'48.343290, 32.359802',4,'testio'),(15,'48.903588, 32.235780',6,'testio'),(16,'3100 Esperanze Xing, Austin, TX 78758',2,'testio'),(17,'3100 Esperanze Xing, Austin, TX 78758',6,'testio'),(18,'2501 Palmer Line 123',1,'testio'),(19,'71 Cherry Court  SOUTHAMPTON  SO53 5PD  UK',1,'testio'),(20,'71 Cherry Court  SOUTHAMPTON  SO53 5PD  UK',4,'testio');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id_product` smallint(6) NOT NULL AUTO_INCREMENT,
  `id_product_recipe` int(11) DEFAULT NULL,
  `name` varchar(64) DEFAULT NULL,
  `weight` smallint(6) DEFAULT NULL,
  `price` smallint(6) DEFAULT NULL,
  `describe_prod` varchar(68) DEFAULT NULL,
  PRIMARY KEY (`id_product`),
  KEY `id_product_recipe` (`id_product_recipe`),
  CONSTRAINT `products_ibfk_1` FOREIGN KEY (`id_product_recipe`) REFERENCES `recipes` (`id_recipe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,1,'Classic',650,225,'Classic piza with tomato sous and beef'),(2,2,'Mexican',675,250,'Hot Mexican piza with picant flavour'),(3,3,'Vegan',600,275,'Vegan piza with mushrooms'),(4,4,'Hunter',700,300,'Many meat in Hunter piza'),(5,5,'Fish',600,325,'With shreems and tuna flavour'),(6,6,'Exotic',650,275,'With exotic peanapl\ne');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipes`
--

DROP TABLE IF EXISTS `recipes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipes` (
  `id_recipe` int(11) NOT NULL AUTO_INCREMENT,
  `name_recipes` varchar(68) DEFAULT NULL,
  `dough` smallint(6) DEFAULT NULL,
  `tomato` smallint(6) DEFAULT NULL,
  `bacon` smallint(6) DEFAULT NULL,
  `beef` smallint(6) DEFAULT NULL,
  `chicken` smallint(6) DEFAULT NULL,
  `chedder` smallint(6) DEFAULT NULL,
  `mozzarella` smallint(6) DEFAULT NULL,
  `prmezan` smallint(6) DEFAULT NULL,
  `mushroom` smallint(6) DEFAULT NULL,
  `peanaple` smallint(6) DEFAULT NULL,
  `olive` smallint(6) DEFAULT NULL,
  `shreem` smallint(6) DEFAULT NULL,
  `onion` smallint(6) DEFAULT NULL,
  `tuna` smallint(6) DEFAULT NULL,
  `pepper` smallint(6) DEFAULT NULL,
  `sous_tomato` smallint(6) DEFAULT NULL,
  `sous_hot` smallint(6) DEFAULT NULL,
  `sous_island` smallint(6) DEFAULT NULL,
  `salat` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id_recipe`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipes`
--

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;
INSERT INTO `recipes` VALUES (1,'Classic',350,35,NULL,50,NULL,75,NULL,NULL,40,NULL,NULL,NULL,35,NULL,5,45,NULL,NULL,NULL),(2,'Mexican',300,40,30,NULL,40,80,NULL,NULL,40,NULL,20,NULL,20,NULL,5,NULL,35,NULL,NULL),(3,'Vegan',300,35,NULL,NULL,NULL,NULL,80,20,40,NULL,20,NULL,20,NULL,NULL,NULL,NULL,40,35),(4,'Hunter',300,NULL,35,50,50,NULL,80,NULL,NULL,NULL,15,NULL,20,NULL,10,50,NULL,NULL,35),(5,'Fish',300,35,NULL,NULL,NULL,50,NULL,25,NULL,NULL,25,50,30,35,10,50,NULL,NULL,35),(6,'Exotic',300,35,35,NULL,80,80,NULL,NULL,50,100,NULL,NULL,NULL,NULL,10,50,NULL,NULL,NULL);
/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resources`
--

DROP TABLE IF EXISTS `resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `resources` (
  `id_resource` int(11) NOT NULL AUTO_INCREMENT,
  `name_resource` varchar(64) DEFAULT NULL,
  `weight_resource` smallint(6) DEFAULT NULL,
  `price_resource` smallint(6) DEFAULT NULL,
  `date_resource` date DEFAULT NULL,
  `describe_resource` varchar(244) DEFAULT NULL,
  PRIMARY KEY (`id_resource`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resources`
--

LOCK TABLES `resources` WRITE;
/*!40000 ALTER TABLE `resources` DISABLE KEYS */;
INSERT INTO `resources` VALUES (1,'dough',35,55,'2020-10-11','The dough from Metro'),(2,'tomato',5,45,'2022-01-01','Fresh tomatos from Metro'),(3,'bacon',3,195,'2021-04-08','The bacon from Metro'),(4,'beef',5,150,'2022-01-01','Frozen beef from Metro'),(5,'chicken',4,55,'2021-01-01','Frozen file of chicken from Metro'),(6,'chedder',2,250,'2021-05-11','Slices of Hochland chedder bying in Metro'),(7,'mozzarella',4,150,'2020-12-10','Mozzarella from local manufacture'),(8,'prmezan',1,525,'2023-01-04','Parmezan from local manufacture'),(9,'mushroom',4,60,'2021-03-07','Mushrooms from local manufacture'),(10,'peanaple',2,90,'2021-05-05','Peanaple from local market'),(11,'olive',4,75,'2024-01-01','Canned olives made in Spain'),(12,'shreem',2,275,'2022-07-02','Frozen meat of shreems'),(13,'onion',4,55,'2020-07-01','Fresh onions'),(14,'tuna',2,475,'2022-01-01','Frozen tuna meat'),(15,'pepper',1,90,'2024-01-01','Red hot pepper'),(16,'sous_tomato',5,45,'2022-04-09','Ketchup from tomatos'),(17,'sous_hot',2,55,'2023-08-10','Hot chili sous from Metro'),(18,'sous_island',2,125,'2021-02-05','Thousand islands sous'),(19,'salat',2,85,'2020-07-02','Fresh salat from local market');
/*!40000 ALTER TABLE `resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `mail` varchar(255) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'test','827ccb0eea8a706c4c34a16891f84e7b','test@test'),(2,'test2','e10adc3949ba59abbe56e057f20f883e','test@test'),(3,'test2555','5b1b68a9abf4d2cd155c81a9225fd158','555555'),(4,'test266666','ad5e04d63467f88063c4b12f7cebf2ba','fghdfhdfh'),(5,'test29999','fb15a22a63f26b4a2a63fff47be7f5a2','cvgcgcgc'),(6,'test2ssss','837a502d6d0bb6e5c54b0204148eff40','test@test'),(7,'test2888888888888','6cdf396173123eac91b9f42df504dc69','test@test'),(8,'user','827ccb0eea8a706c4c34a16891f84e7b','qwertyuiu'),(9,'usernew','fcea920f7412b5da7be0cf42b8c93759','test1@test1'),(10,'root','827ccb0eea8a706c4c34a16891f84e7b','test@test111'),(11,'testio','testio','testio@testio'),(12,'mambo','mambo','mambo@mambo'),(13,'lol','lol','lol@lol'),(14,'tuna','tuna','tuna@tuna'),(15,'big','big','big@big'),(16,'cap','cap','cap@cap'),(17,'cap','cap','cap@cap');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-31 22:33:41

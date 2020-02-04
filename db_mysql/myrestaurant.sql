-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 04, 2020 at 03:29 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `myrestaurant`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `ExtraPrice` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `addon`
--

INSERT INTO `addon` (`ID`, `Name`, `Description`, `ExtraPrice`) VALUES
(1, 'Special Sauce 01', '', 5),
(2, 'Special Sauce 02', '', 5),
(3, 'Special Sauce 03', '', 5),
(4, 'Special Sauce 04', '', 5),
(5, 'Special Sauce 05', '', 5);

-- --------------------------------------------------------

--
-- Table structure for table `favorite`
--

CREATE TABLE `favorite` (
  `FBID` varchar(50) NOT NULL,
  `FoodId` int(11) NOT NULL,
  `RestaurantId` int(11) NOT NULL,
  `RestaurantName` varchar(50) DEFAULT NULL,
  `FoodName` varchar(50) DEFAULT NULL,
  `FoodImage` longtext DEFAULT NULL,
  `Price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorite`
--

INSERT INTO `favorite` (`FBID`, `FoodId`, `RestaurantId`, `RestaurantName`, `FoodName`, `FoodImage`, `Price`) VALUES
('2739799736047038', 5, 1, 'Restaurant A', 'GINGER SOY FISH CAKE', 'http://10.0.2.2:3000/5_ginger_vegetarian_fish.jpg', 25),
('383170518961862', 1, 1, 'restaurant a', 'abc', 'abc', 100),
('383170518961862', 5, 6, 'Restaurant F', 'GINGER SOY FISH CAKE', 'http://10.0.2.2:3000/5_ginger_vegetarian_fish.jpg', 25),
('383170518961862', 6, 6, 'Restaurant F', 'GONG BAO MUSHROOM TOFU', 'http://10.0.2.2:3000/6_kung_po_mushroom_tofu.jpg', 25),
('383170518961862', 7, 6, 'Restaurant F', 'PUMPKIN LUO HAN ZHAI', 'http://10.0.2.2:3000/7_pumpkin_luo_han_zhai.jpg', 25),
('383170518961862', 8, 6, 'Restaurant F', 'SWEET & SOUR MONKEY HEAD MUSHROOM', 'http://10.0.2.2:3000/8_sweet_sour_cranberry_monkey_head_mushroom.jpg', 25),
('383170518961862', 40, 3, 'Restaurant C', 'MARGHERITA PIZZA', 'http://10.0.2.2:3000/20_margherita_pizza.jpg', 25);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` longtext DEFAULT NULL,
  `Image` longtext DEFAULT NULL,
  `Price` double NOT NULL DEFAULT 0,
  `IsSize` tinyint(1) NOT NULL DEFAULT 0,
  `IsAddon` tinyint(1) NOT NULL DEFAULT 0,
  `Discount` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`ID`, `Name`, `Description`, `Image`, `Price`, `IsSize`, `IsAddon`, `Discount`) VALUES
(1, 'ROASTED QUARTER CHICKEN', 'Served with mushroom gravy, cranberry & mint sauces', 'http://10.0.2.2:3000/4_roasted_quarter_chicken_with_special_sauces.jpg', 25, 0, 0, 0),
(2, 'CURRY CHICKEN', 'Chicken served in curry that is made from more than 10 spices to bring out the authentic traditional taste. Served with rice and 3 side dishes\r\n', 'http://10.0.2.2:3000/2_curry_chic.jpg', 25, 0, 0, 0),
(3, '\r\nRENDANG CHICKEN', 'Simmered chicken in spices. Served with rice and 3 side dishes', 'http://10.0.2.2:3000/1_classic_rendang.jpg', 25, 0, 0, 0),
(4, 'HERBAL STEAMED CHICKEN', 'Steamed chicken with red dates and mushroom. Served with rice and 3 side dishes', 'http://10.0.2.2:3000/3_herbal_steamed_chic.jpg', 25, 0, 0, 0),
(5, 'GINGER SOY FISH CAKE', 'Vegetarian soy fish topped with ginger paste and soy sauce', 'http://10.0.2.2:3000/5_ginger_vegetarian_fish.jpg', 25, 0, 0, 0),
(6, 'GONG BAO MUSHROOM TOFU', 'Fried mushroom served in a sweet and savoury sauce', 'http://10.0.2.2:3000/6_kung_po_mushroom_tofu.jpg', 25, 0, 0, 0),
(7, 'PUMPKIN LUO HAN ZHAI', 'An assortment of mushrooms, vegetables and white silken tofu in pumpkin sauce', 'http://10.0.2.2:3000/7_pumpkin_luo_han_zhai.jpg', 25, 0, 0, 0),
(8, 'SWEET & SOUR MONKEY HEAD MUSHROOM', 'Fried breaded monkey head mushroom on a bed of tofu topped with homemade sweet and sour cranberry sauce', 'http://10.0.2.2:3000/8_sweet_sour_cranberry_monkey_head_mushroom.jpg', 25, 0, 0, 0),
(9, 'LOTUS ROOT', 'Lotus root, ground nuts and kombu', 'http://10.0.2.2:3000/s5_lotus_chinese_soup.jpg', 30, 0, 0, 0),
(10, 'OLD CUCUMBER', 'Old cucumber and longan', 'http://10.0.2.2:3000/s6_old_cucumber_chinese_soup.jpg', 30, 0, 0, 0),
(11, 'BURDOCK', 'Burdock, fig, longan and goji berry', 'http://10.0.2.2:3000/s7_bur_dock_chinese_soup.jpg', 25, 0, 0, 0),
(12, 'ABC', 'Carrot, potato, onion, and tomato', 'http://10.0.2.2:3000/s8_abc_chinese_soup.jpg', 25, 0, 0, 0),
(13, 'THAI STYLE SALAD', 'Bamboo fungus in spicy thai style sauce', 'http://10.0.2.2:3000/a1_thai_style_salad.jpg', 15, 0, 0, 0),
(14, 'BLACK SESAME BALL', 'Glutinous rice ball with black sesame paste filling coated with minced peanuts', 'http://10.0.2.2:3000/a2_sesame_ball_peanut.jpg', 15, 0, 0, 0),
(15, 'SPINACH POTATO BALL', 'Golden fried spinach potato ball', 'http://10.0.2.2:3000/a3_potato_ball.jpg', 15, 0, 0, 0),
(16, 'DOUBLE DELIGHT', 'Apple in yoghurt sauce with walnut & sunflower seeds coated with cane sugar and sesame seeds', 'http://10.0.2.2:3000/a4_caramelised_sunflower_seeds.jpg', 25, 0, 0, 0),
(17, 'SOUR & SPICY TOFU', 'Tofu in spicy thai style sauce', 'http://10.0.2.2:3000/a5_sour_and_spicy_tofu.jpg', 25, 0, 0, 0),
(18, 'ASAM FISH HEAD', 'Half a salmon fish head cooked in an asam broth. Served with rice and 3 ', 'http://10.0.2.2:3000/9_asam_salmon_fish_head.jpg', 15, 0, 0, 0),
(19, 'DUO SEASON SALMON PUFFS', 'Golden fried salmon stuffed bread puffs. Served with mashed potato & salad', 'http://10.0.2.2:3000/10_duo_season_salmon_puff.jpg', 25, 0, 0, 0),
(20, 'TOMAN IN PUMPKIN SAUCE', 'Breaded fried toman fish slices in pumpkin sauce. Served with rice and 3 side dishes', 'http://10.0.2.2:3000/11_pumpkin_sauce_fish.jpg', 25, 0, 0, 0),
(21, 'MEDIFOODS NASI LEMAK', 'Enjoy the healthy version of the classic malaysian delight we all love', 'http://10.0.2.2:3000/34_nasi_lemak_veg.jpg', 20, 0, 0, 0),
(22, 'LEI CHA', 'Assortment of vegetables & nut served with rice and our signature basil blended soup', 'http://10.0.2.2:3000/13_lui_cha.jpg', 25, 0, 0, 0),
(23, 'BLACK PEPPER UDON', 'Udon noodle stir fried with blackpepper, soy sauce and mixed vegetables', 'http://10.0.2.2:3000/26_black_pepper_udon.jpg', 25, 0, 0, 0),
(24, 'KWAI FA MEE', 'Stir fried mee in special tomato sauce topped with organic egg', 'http://10.0.2.2:3000/28_kwai_fa_mee.jpg', 25, 0, 0, 0),
(25, 'JAPANESE CHARCOAL SOBA', 'Japanese charcoal noodles served with vegetable miso soup', 'http://10.0.2.2:3000/25_japanese_charcoal_soba.jpg', 25, 0, 0, 0),
(26, 'CANTONESE STYLE MEE SUA', 'Rice vermicelli cooked in vegetable soup infused with organic egg', 'http://10.0.2.2:3000/27_cantonese_style_mee_sua.jpg', 25, 0, 0, 0),
(27, 'MF SPECIAL FRIED RICE', 'Fried rice with egg, textured soy protein, capsicum and our own lui cha sauce', 'http://10.0.2.2:3000/29_mf_special_fried_rice.jpg', 20, 0, 0, 0),
(28, 'BITTERGOURD MEE HOON', 'Bittergourd braised in vegatble soup along with tofu, bamboo fungus and rice vermicilli', 'http://10.0.2.2:3000/30_bittergourd_meehun.jpg', 25, 0, 0, 0),
(29, 'JAPANESE RAMEN', 'Udon noodles served in a light miso soup with egg, japanese tofu, oyster mushroom and seaweed', 'http://10.0.2.2:3000/31_japanese_ramen.jpg', 25, 0, 0, 0),
(30, 'MEDIFOODS PORRIDGE', 'Boiled calrose rice with pumpkin, textured soy protein, tofu, toman fish and topped with fried meehoon', 'http://10.0.2.2:3000/33_porridge_nonveg.jpg', 20, 0, 0, 0),
(31, 'HOKKIEN VEGETARIAN FRIED MEE HOON', 'Fried rice vermicili with cloud ear, carrot and topped with vegetarian fish', 'http://10.0.2.2:3000/36_mf_hokkien_vegetarian_fried_meehoon.jpg', 25, 0, 0, 0),
(32, 'CURRY MEE HOON', 'Rice vermicilli served in santan-free curry with chicken, long beans , tau pok and enoki mushrooms\r\n', 'http://10.0.2.2:3000/12_curry_mee.jpg', 25, 0, 0, 0),
(33, 'MEDIFOODS RICE', 'Long grain Basmati rice with lentil and millets', 'http://10.0.2.2:3000/38_mf_rice.jpg', 25, 0, 0, 0),
(34, 'GARDEN AGLIO OLIO', 'Pasta tossed with capsicum, tofu, soybean chunks and special herb-infused olive oil', 'http://10.0.2.2:3000/15_garden_aglio_olio.jpg', 25, 0, 0, 0),
(35, 'SPICY AGLIO OLIO', 'Pasta tossed with traditional Asian spices and served with pan fried diced vegetables\r\n', 'http://10.0.2.2:3000/17_spicy_aglio_olio.jpg', 25, 0, 0, 0),
(36, 'BOLOGNESE AGLIO OLIO', 'Bolognese spaghetti with chunky vegetables', 'http://10.0.2.2:3000/18_spaghetti_bolognese.jpg', 25, 0, 0, 0),
(37, 'CAULIFLOWER FETTUCCINE', 'Creamy fettuccine served with green peas, cauliflower and long beans', 'http://10.0.2.2:3000/14_cauliflower_fettucine.jpg', 25, 0, 0, 0),
(38, 'FUSION SPAGHETTI', 'It\'s unique and one of a kind!', 'http://10.0.2.2:3000/16_medifoods_fusion_spaghetti.jpg', 25, 0, 0, 0),
(39, 'MUSHROOM PIZZA', 'Mushrooms and onion', 'http://10.0.2.2:3000/21_mushroom_pizza.jpg', 25, 1, 1, 0),
(40, 'MARGHERITA PIZZA', 'Tomatoes, capsicum and pesto', 'http://10.0.2.2:3000/20_margherita_pizza.jpg', 25, 1, 1, 0),
(41, 'HAWAIIAN PIZZA', 'Pineapple, beancurd sheet and onion', 'http://10.0.2.2:3000/19_hawaiian_pizza.jpg', 25, 1, 1, 0),
(42, 'EGG MAYO SANDWICH', '2 organic eggs with only 1 yolk served with fresh organic vegetables and low fat mayonnaise on panini bread', 'http://10.0.2.2:3000/22_egg_mayo.jpg', 25, 0, 0, 0),
(43, 'LENTIL SANDWICH', 'A patty made of organic mushrooms, lentils and spices, topped with an organic sunny side up egg\r\n', 'http://10.0.2.2:3000/24_lentil_burger.jpg', 25, 0, 0, 0),
(44, 'HUMMUS PLATTER', 'A refreshing dip made with chickpeas, tahini (sesame paste), and served with crackers, pita bread, fruit and an assortment of salads\r\n', 'http://10.0.2.2:3000/23_hummus_platter.jpg', 25, 0, 0, 0),
(45, 'GINGER PAO', '', 'http://10.0.2.2:3000/p1_ginger_pao.jpg', 25, 0, 0, 0),
(46, 'COCONUT PAO', '', 'http://10.0.2.2:3000/p2_coconut_pao.jpg', 25, 0, 0, 0),
(47, 'RED BEAN PAO', '', 'http://10.0.2.2:3000/p3_red_bean_pao.jpg', 25, 0, 0, 0),
(48, 'CHAR SIEW PAO', '', 'http://10.0.2.2:3000/p4_char_siew_pao.jpg', 25, 0, 0, 0),
(49, 'CHAI PAO', '', 'http://10.0.2.2:3000/p5_chai_pao.jpg', 25, 0, 0, 0),
(50, 'ONDE ONDE', '', 'http://10.0.2.2:3000/d1_onde_onde.jpg', 25, 0, 0, 0),
(51, 'CHAI KUIH', '', 'http://10.0.2.2:3000/d2_chai_kuih.jpg', 25, 0, 0, 0),
(52, 'YAM CAKE', '', 'http://10.0.2.2:3000/d5_yam_cake.jpg', 25, 0, 0, 0),
(53, 'RADISH CAKE', '', 'http://10.0.2.2:3000/d6_radish_cake.jpg', 25, 0, 0, 0),
(54, 'PUMPKIN CAKE', '', 'http://10.0.2.2:3000/d7_pumpkin_cake.jpg', 25, 0, 0, 0),
(55, 'ANG KU', '', 'http://10.0.2.2:3000/d8_d9_angku.jpg', 25, 0, 0, 0),
(56, '3 LAYER CAKE', '', 'http://10.0.2.2:3000/d11_three_layer_cake.jpg', 25, 0, 0, 0),
(57, 'FATT KO', '', 'http://10.0.2.2:3000/d10_fatt_ko.jpg', 25, 0, 0, 0),
(58, 'CREAM OF MUSHROOM', 'Flavourful blend of 3 types of mushrooms, onion and herbs\r\n', 'http://10.0.2.2:3000/s3_mushroom_soup_western_soup.jpg', 25, 0, 0, 0),
(59, 'CREAM OF PUMPKIN', 'Delicious blend of pumpkin, carrot and onion', 'http://10.0.2.2:3000/s4_pumpkin_soup_western_soup.jpg', 25, 0, 0, 0),
(60, 'MF GARDEN BLEND', 'Refreshing blend of root and vine vegetables', 'http://10.0.2.2:3000/s2_mf_garden_blend_western_soup.jpg', 25, 0, 0, 0),
(61, 'MINESTRONE', 'Clear tomato based soup with chunky vegetables and herbs', 'http://10.0.2.2:3000/s1_minestrone_western_soup.jpg', 25, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `food_addon`
--

CREATE TABLE `food_addon` (
  `FoodId` int(11) NOT NULL,
  `AddonId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food_addon`
--

INSERT INTO `food_addon` (`FoodId`, `AddonId`) VALUES
(39, 1),
(39, 2),
(39, 3),
(39, 4),
(40, 1),
(40, 2),
(40, 4),
(41, 1),
(41, 2),
(41, 3);

-- --------------------------------------------------------

--
-- Table structure for table `food_size`
--

CREATE TABLE `food_size` (
  `FoodId` int(11) NOT NULL,
  `SizeId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `food_size`
--

INSERT INTO `food_size` (`FoodId`, `SizeId`) VALUES
(39, 1),
(39, 2),
(39, 3),
(40, 1),
(40, 2),
(40, 3),
(41, 1),
(41, 2),
(41, 3);

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Image` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`ID`, `Name`, `Description`, `Image`) VALUES
(1, 'CHICKEN', 'We know from experience that de-skinning a chicken has its benefits. It removes close to 40% of fat. However, many believe that this will compromise the taste.\r\n\r\nBut magic happens in our kitchen! Our recipes will release the natural sweetness and tenderness of our kampung chickens for you to savour!\r\n', 'http://10.0.2.2:3000/menu_ch.png'),
(2, 'CHINESE VEGETARIAN', 'Are you certain that the widely available and commercially prepared vegetarian dishes offer healthier options? It’s different at Medifoods; because your health is our priority!\r\n\r\nOur Chinese vegetarian dishes are served with wholesome vegetables, enriched with protein and free of vegetarian ‘meat’.\r\n\r\nThe sumptuous platter is served with rice, 3 side-dishes and one double-boiled soup!\r\n', 'http://10.0.2.2:3000/menu_chinese.png'),
(3, 'EASTERN SOUPS', 'DOUBLE-BOIL – that’s what we do to give you a soup that is nutritious, tasty, and wholesome. Grandma had always double-boiled the vegetables in order to gently release their essence and nutrients. This traditional technique preserves the delicate balance of our Eastern Soups.\r\n\r\nAnd rest assured that we never include anything pickled or preserved; and surely no MSG!\r\n\r\n', 'http://10.0.2.2:3000/menu_eastern_soup.png'),
(4, 'FINGERS FOOD', 'Like to savour something light? Go ahead, explore our unique range of finger foods. You may want to wash your hands first, before you ‘dirty’ them!\r\n', 'http://10.0.2.2:3000/menu_finger_food.png'),
(5, 'FISH', 'Fish is a healthier meat choice. It is high in omega oils and protein. Our recipes do not mask over the natural taste of the fish!\r\n\r\nIt releases its natural goodness while you savour every bite!', 'http://10.0.2.2:3000/menu_fish.png'),
(6, 'MEDIFOODS DELIGHTS', 'Malaysia is home to a variety of favourite ‘local foods’! We can find them everywhere, and we have the opportunity to enjoy them 24/7/365!\r\n\r\nBut why not eat them healthy, and guilt-free! So go ahead and order your favourite local dish.\r\n\r\nWe will prepare them with the freshest of ingredients, with less oil, the right pinch of salt, no MSG; and the resulting taste will surprise you!\r\n', 'http://10.0.2.2:3000/menu_medifoods_delights.png'),
(7, 'PASTA', 'Did you know that a commercial vegetarian pasta is loaded with oil & carbs, and lacks proteins? This is a challenge we like!\r\n\r\nOur chefs and dietitians have created a selection of nutritious and balanced pastas for a healthy you, and to delight your taste-buds! Have a guilt-free go at our Pastas!\r\n', 'http://10.0.2.2:3000/menu_pasta.png'),
(8, 'PIZZA', 'Think pizza and you may feel ‘heavy’! But let us surprise you! Try our pizzas! Go for it!\r\n\r\nOur scrumptious pizzas come with the usual crunchy crust but with NO shortening, an ingredient which is loaded with unhealthy trans fat!\r\n\r\nWe top our pizzas with a special homemade tomato paste and proprietary cheese mix to serve you a delicious and healthy pizza!\r\n', 'http://10.0.2.2:3000/menu_pizza.png'),
(9, 'SANDWICHES', 'The ultimate experience with any sandwich comes from within – the space in-between the slices which holds the mix and quality of compatible ingredients.\r\n\r\nGo ahead and savour our healthy sandwiches. And rest assured that you will not encounter any trace of heavy cream or high-fat mayonnaise with every bite.\r\n\r\nAnd the platter will not include fried potatoes which are high in oil and trans fat!\r\n', 'http://10.0.2.2:3000/menu_sandwiches.png'),
(10, 'SNACKS', 'There’s nothing like stimulating your appetite with traditional and local snacks.\r\n\r\nOur variety is unique, people just love them and you will too! And each snack will deliver no more than 150kcal!\r\n', 'http://10.0.2.2:3000/menu_snacks.png'),
(11, 'WESTERN SOUPS', 'We like to share a secret with you. Our Western Soup spread is rich and creamy, though we DON’T add cream, dairy or any thickener.\r\n\r\nInstead, we add Oat Embryo to bring out the best from the fresh ingredients we use, and to tickle your taste-buds.\r\n\r\nAnd the modest inclusion of sea salt + bamboo salt will complete the delectable experience that will be delivered by every spoon.\r\n', 'http://10.0.2.2:3000/menu_western_soup.png');

-- --------------------------------------------------------

--
-- Table structure for table `menu_food`
--

CREATE TABLE `menu_food` (
  `MenuID` int(11) NOT NULL,
  `FoodID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `menu_food`
--

INSERT INTO `menu_food` (`MenuID`, `FoodID`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(3, 9),
(3, 10),
(3, 11),
(3, 12),
(4, 13),
(4, 14),
(4, 15),
(4, 16),
(4, 17),
(5, 18),
(5, 19),
(5, 20),
(6, 21),
(6, 22),
(6, 23),
(6, 24),
(6, 25),
(6, 26),
(6, 27),
(6, 28),
(6, 29),
(6, 30),
(6, 31),
(6, 32),
(6, 33),
(7, 34),
(7, 35),
(7, 36),
(7, 37),
(7, 38),
(8, 39),
(8, 40),
(8, 41),
(9, 42),
(9, 43),
(9, 44),
(10, 45),
(10, 46),
(10, 47),
(10, 48),
(10, 49),
(10, 50),
(10, 51),
(10, 52),
(10, 53),
(10, 54),
(10, 55),
(10, 56),
(10, 57),
(11, 58),
(11, 59),
(11, 60),
(11, 61);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `OrderId` int(11) NOT NULL,
  `OrderFBID` varchar(50) DEFAULT NULL,
  `OrderPhone` varchar(50) DEFAULT NULL,
  `OrderName` varchar(50) DEFAULT NULL,
  `OrderAddress` varchar(500) DEFAULT NULL,
  `OrderStatus` int(11) DEFAULT 0,
  `OrderDate` date DEFAULT NULL,
  `RestaurantId` int(11) DEFAULT NULL,
  `TransactionId` varchar(50) NOT NULL DEFAULT 'None',
  `COD` tinyint(1) NOT NULL DEFAULT 1,
  `TotalPrice` double NOT NULL DEFAULT 0,
  `NumOfItem` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`OrderId`, `OrderFBID`, `OrderPhone`, `OrderName`, `OrderAddress`, `OrderStatus`, `OrderDate`, `RestaurantId`, `TransactionId`, `COD`, `TotalPrice`, `NumOfItem`) VALUES
(1, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(2, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(3, '2739799736047038', 'abc', '111', '222', 0, '0000-00-00', 1, 'NONE', 0, 100, 2),
(4, '2739799736047038', 'abc', '111', '222', 0, '0000-00-00', 1, 'NONE', 0, 100, 2),
(5, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(6, '2739799736047038', 'abc', '111', '222', 0, '0000-00-00', 1, 'NONE', 0, 100, 2),
(7, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 3, 'NONE', 0, 25, 1),
(8, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(9, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(10, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 2),
(11, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 62, 0),
(12, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 25, 1),
(13, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '0000-00-00', 1, 'NONE', 0, 25, 0),
(14, '2739799736047038', '1', '1', '1', 0, '0000-00-00', 1, 'NONE', 1, 1, 2),
(15, '2739799736047038', '1', '1', '1', 0, '0000-00-00', 1, 'NONE', 1, 1, 2),
(16, '2739799736047038', '1', '1', '1', 0, '0000-00-00', 1, 'NONE', 1, 1, 2),
(17, '2739799736047038', '1', '1', '1', 0, '2015-05-09', 1, 'NONE', 1, 1, 2),
(18, '2739799736047038', '1', '1', '1', 0, '2015-05-31', 1, 'NONE', 1, 1, 2),
(19, '2739799736047038', '1', '1', '1', 0, '2015-05-31', 1, 'NONE', 1, 1, 2),
(20, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '2019-05-31', 1, 'NONE', 0, 30, 1),
(21, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '2019-05-31', 1, 'NONE', 0, 30, 0),
(22, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '2019-05-31', 1, 'NONE', 0, 45, 3),
(23, '2739799736047038', '+84988353682', 'Eddy Lee abc', '300 Bevery Hills', 0, '2019-05-31', 1, 'NONE', 0, 45, 0),
(24, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 3, 'COD', 0, 50, 2),
(25, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 3, 'COD', 0, 50, 0),
(26, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 6, 'COD', 0, 75, 3),
(27, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 6, 'COD', 0, 75, 0),
(28, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 7, 'COD', 0, 25, 1),
(29, '383170518961862', '+84988353682', 'Eddy Lee1', '1', 0, '0000-00-00', 7, 'COD', 0, 25, 0),
(30, '2739799736047038', '1', '1', '1', 0, '2019-05-24', 1, 'NONE', 0, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `OrderId` int(11) NOT NULL,
  `ItemId` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL DEFAULT 0,
  `Price` double NOT NULL DEFAULT 0,
  `Discount` int(11) NOT NULL DEFAULT 0,
  `Size` varchar(50) DEFAULT NULL,
  `Addon` varchar(50) DEFAULT NULL,
  `ExtraPrice` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`OrderId`, `ItemId`, `Quantity`, `Price`, `Discount`, `Size`, `Addon`, `ExtraPrice`) VALUES
(1, 39, 2, 25, 0, 'Large', 'None', 14),
(12, 1, 1, 25, 0, 'NORMAL', 'None', 0),
(20, 10, 1, 30, 0, 'NORMAL', 'None', 0),
(22, 13, 1, 15, 0, 'NORMAL', 'None', 0),
(24, 39, 1, 25, 0, 'None', 'None', 0),
(26, 6, 1, 25, 0, 'None', 'None', 0),
(28, 1, 1, 25, 0, 'None', 'None', 0),
(30, 39, 2, 25, 0, NULL, '[{\"extraPrice\":5.0,\"id\":2,\"name\":\"Special Sauce 02', 14);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Address` varchar(500) DEFAULT NULL,
  `Phone` varchar(50) DEFAULT NULL,
  `Lat` double NOT NULL DEFAULT 0,
  `Lng` double NOT NULL DEFAULT 0,
  `UserOwner` int(11) DEFAULT 0,
  `Image` longtext NOT NULL,
  `PaymentUrl` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`ID`, `Name`, `Address`, `Phone`, `Lat`, `Lng`, `UserOwner`, `Image`, `PaymentUrl`) VALUES
(1, 'Restaurant A', '2395  Farland Avenue,San Antonio,TX,78212', '830-445-9369', 30.32807, -81.485451, 0, 'http://192.168.100.37:3000/restaurant_a.jpg', 'http://192.168.100.37:3001/'),
(2, 'Restaurant B', '3252  Austin Secret Lane,Ferron,UT,84523', '435-384-5974', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_b.jpg', 'http://10.0.2.2:3001/'),
(3, 'Restaurant C', '2027  Williams Mine Road,New Brunswick,NJ,08901', '971-258-9012', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_c.jpg', 'http://10.0.2.2:3001/'),
(4, 'Restaurant D', '4668  Mattson Street,Portland,OR,97205', '503-376-8277', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_d.jpg', 'http://10.0.2.2:3001/'),
(5, 'Restaurant E', '4323  Garrett Street,Grand Rapids,MI,49503', '949-255-8415', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_e.jpg', 'http://10.0.2.2:3001/'),
(6, 'Restaurant F', '2395  Catherine Drive,Bismarck,ND,58501', '225-936-9727', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_f.jpg', 'http://10.0.2.2:3001/'),
(7, 'Restaurant G', '3255  Heavens Way,Baton Rouge,LA,70827', '423-383-7179', 0, 0, 0, 'http://10.0.2.2:3000/restaurant_g.jpg', 'http://10.0.2.2:3001/');

-- --------------------------------------------------------

--
-- Table structure for table `restaurantowner`
--

CREATE TABLE `restaurantowner` (
  `UserPhone` varchar(50) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `RestaurantId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_menu`
--

CREATE TABLE `restaurant_menu` (
  `RestaurantId` int(11) NOT NULL,
  `MenuId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `restaurant_menu`
--

INSERT INTO `restaurant_menu` (`RestaurantId`, `MenuId`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 7),
(2, 8),
(2, 9),
(2, 10),
(3, 1),
(3, 3),
(3, 5),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(3, 11),
(4, 1),
(4, 2),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(6, 1),
(6, 2),
(7, 1);

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE `size` (
  `ID` int(11) NOT NULL,
  `Description` varchar(50) DEFAULT NULL,
  `ExtraPrice` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`ID`, `Description`, `ExtraPrice`) VALUES
(1, 'Small', 0),
(2, 'Medium', 2),
(3, 'Large', 4);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `FBID` varchar(50) NOT NULL,
  `UserPhone` varchar(50) DEFAULT NULL,
  `Name` varchar(50) DEFAULT 'Please update name',
  `email` varchar(100) NOT NULL,
  `encrypted_password` varchar(150) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `salt` varchar(16) NOT NULL,
  `Address` varchar(500) DEFAULT 'Please update address',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`FBID`, `UserPhone`, `Name`, `email`, `encrypted_password`, `salt`, `Address`, `created_at`, `updated_at`) VALUES
('12', '65494232', 'Orlando', 'orlando-152010@hotmail.com', 'dasfasd', '123-123-123-123', 'uruguay 212', '2020-01-25 10:16:46', '2020-01-25 10:16:46'),
('12314', '65494232', 'orlando', 'odilmar.gareca.pena@gmail.com', 'a6c3ff66842a39cdd6230daeb77b25a75e5a3b647d6a1a047bc7a58195c2480cfda84dbf23b326bb6cd44f0a3cca69b609c794585b47b553dc4b7129a1572647', '6e4dd050d6523cad', 'uruguay 212', '2020-01-25 11:26:55', '2020-01-25 11:26:55'),
('12334444', '1234bb', 'asassaas', '', '', '', 'asasasasas', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('1234', '65494232', 'orlandodasdafaweq', '', '', '', 'uruguay 21212412512', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('12341241241235', '123456789', 'jose', 'jose@gmail.com', '98e3241696b8e38e2ae7eb5d4cdbfde3205528a000cbc5b2240928024075d1b52b6551438dcb7015014d5c30c308a7633e40025c4c73c20f976a7ab1729204ee', '574c037ed70ddc10', 'panamericana', '2020-02-01 09:58:44', '2020-02-01 09:58:44'),
('13', '65494232', 'OrlandoDilmar', 'orlando.dilmar.gareca.pena@gmail.com', '52aa80356be18c3612519d56e844eebda25cc9fab100c93145d41f654d16d96d1182cfe2f84c3004709768c2c0e7a4349ea2eaabb1f70202a68b140924ddcba8', '7446946faa4276bc', 'uruguay 212', '2020-01-25 10:35:11', '2020-01-25 10:35:11'),
('234235', '66666666', 'david', 'david@gmail.com', '025954d16e267ca8c743ef4d2e14fb799a23c494bbf53b63967385da3deffd27f9cfdee1a69474a7cd49b92f500921a37bb7f3aa981eaeef370fe6af3434a558', '4debd57a6a85c946', 'Uruguay #212', '2020-01-25 13:18:37', '2020-01-25 13:18:37'),
('2739799736047038', '+84988353682', 'Eddy Lee', '', '', '', '300 Bevery Hills', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('383170518961862', '+84988353682', 'Eddy Lee1', '', '', '', '1', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('5', '65494232', 'Orlando', '', '', '', 'uruguay 212', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `favorite`
--
ALTER TABLE `favorite`
  ADD PRIMARY KEY (`FBID`,`FoodId`,`RestaurantId`),
  ADD KEY `FoodId` (`FoodId`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `food_addon`
--
ALTER TABLE `food_addon`
  ADD PRIMARY KEY (`FoodId`,`AddonId`),
  ADD KEY `AddonId` (`AddonId`);

--
-- Indexes for table `food_size`
--
ALTER TABLE `food_size`
  ADD PRIMARY KEY (`FoodId`,`SizeId`),
  ADD KEY `SizeId` (`SizeId`);

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `menu_food`
--
ALTER TABLE `menu_food`
  ADD PRIMARY KEY (`MenuID`,`FoodID`),
  ADD KEY `FoodID` (`FoodID`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`OrderId`);

--
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`OrderId`,`ItemId`),
  ADD KEY `ItemId` (`ItemId`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `restaurantowner`
--
ALTER TABLE `restaurantowner`
  ADD PRIMARY KEY (`UserPhone`),
  ADD KEY `RestaurantId` (`RestaurantId`);

--
-- Indexes for table `restaurant_menu`
--
ALTER TABLE `restaurant_menu`
  ADD PRIMARY KEY (`RestaurantId`,`MenuId`),
  ADD KEY `MenuId` (`MenuId`);

--
-- Indexes for table `size`
--
ALTER TABLE `size`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`FBID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon`
--
ALTER TABLE `addon`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT for table `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `OrderId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `favorite`
--
ALTER TABLE `favorite`
  ADD CONSTRAINT `favorite_ibfk_1` FOREIGN KEY (`FBID`) REFERENCES `user` (`FBID`),
  ADD CONSTRAINT `favorite_ibfk_2` FOREIGN KEY (`FoodId`) REFERENCES `food` (`ID`);

--
-- Constraints for table `food_addon`
--
ALTER TABLE `food_addon`
  ADD CONSTRAINT `food_addon_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`ID`),
  ADD CONSTRAINT `food_addon_ibfk_2` FOREIGN KEY (`AddonId`) REFERENCES `addon` (`ID`);

--
-- Constraints for table `food_size`
--
ALTER TABLE `food_size`
  ADD CONSTRAINT `food_size_ibfk_1` FOREIGN KEY (`FoodId`) REFERENCES `food` (`ID`),
  ADD CONSTRAINT `food_size_ibfk_2` FOREIGN KEY (`SizeId`) REFERENCES `size` (`ID`);

--
-- Constraints for table `menu_food`
--
ALTER TABLE `menu_food`
  ADD CONSTRAINT `menu_food_ibfk_1` FOREIGN KEY (`FoodID`) REFERENCES `food` (`ID`),
  ADD CONSTRAINT `menu_food_ibfk_2` FOREIGN KEY (`MenuID`) REFERENCES `menu` (`ID`);

--
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`ItemId`) REFERENCES `food` (`ID`),
  ADD CONSTRAINT `orderdetail_ibfk_3` FOREIGN KEY (`OrderId`) REFERENCES `order` (`OrderId`);

--
-- Constraints for table `restaurantowner`
--
ALTER TABLE `restaurantowner`
  ADD CONSTRAINT `restaurantowner_ibfk_1` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurant` (`ID`);

--
-- Constraints for table `restaurant_menu`
--
ALTER TABLE `restaurant_menu`
  ADD CONSTRAINT `restaurant_menu_ibfk_1` FOREIGN KEY (`MenuId`) REFERENCES `menu` (`ID`),
  ADD CONSTRAINT `restaurant_menu_ibfk_2` FOREIGN KEY (`RestaurantId`) REFERENCES `restaurant` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

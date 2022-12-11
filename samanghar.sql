-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2022 at 06:23 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `samanghar`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_interface_theme`
--

CREATE TABLE `admin_interface_theme` (
  `id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(18) NOT NULL,
  `title_color` varchar(18) NOT NULL,
  `css_header_text_color` varchar(18) NOT NULL,
  `css_header_link_color` varchar(18) NOT NULL,
  `css_header_link_hover_color` varchar(18) NOT NULL,
  `css_module_background_color` varchar(18) NOT NULL,
  `css_module_text_color` varchar(18) NOT NULL,
  `css_module_link_color` varchar(18) NOT NULL,
  `css_module_link_hover_color` varchar(18) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(18) NOT NULL,
  `css_generic_link_hover_color` varchar(18) NOT NULL,
  `css_save_button_background_color` varchar(18) NOT NULL,
  `css_save_button_background_hover_color` varchar(18) NOT NULL,
  `css_save_button_text_color` varchar(18) NOT NULL,
  `css_delete_button_background_color` varchar(18) NOT NULL,
  `css_delete_button_background_hover_color` varchar(18) NOT NULL,
  `css_delete_button_text_color` varchar(18) NOT NULL,
  `css` longtext NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(18) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(18) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(18) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_interface_theme`
--

INSERT INTO `admin_interface_theme` (`id`, `name`, `active`, `title`, `title_visible`, `logo`, `logo_visible`, `css_header_background_color`, `title_color`, `css_header_text_color`, `css_header_link_color`, `css_header_link_hover_color`, `css_module_background_color`, `css_module_text_color`, `css_module_link_color`, `css_module_link_hover_color`, `css_module_rounded_corners`, `css_generic_link_color`, `css_generic_link_hover_color`, `css_save_button_background_color`, `css_save_button_background_hover_color`, `css_save_button_text_color`, `css_delete_button_background_color`, `css_delete_button_background_hover_color`, `css_delete_button_text_color`, `css`, `list_filter_dropdown`, `related_modal_active`, `related_modal_background_color`, `related_modal_rounded_corners`, `logo_color`, `recent_actions_visible`, `favicon`, `related_modal_background_opacity`, `env_name`, `env_visible_in_header`, `env_color`, `env_visible_in_favicon`, `related_modal_close_button_visible`, `language_chooser_active`, `language_chooser_display`) VALUES(1, 'Django', 1, 'Django administration', 1, '', 1, '#0C4B33', '#F5DD5D', '#44B78B', '#FFFFFF', '#C9F0DD', '#44B78B', '#FFFFFF', '#FFFFFF', '#C9F0DD', 1, '#0C3C26', '#156641', '#0C4B33', '#0C3C26', '#FFFFFF', '#BA2121', '#A41515', '#FFFFFF', '', 0, 1, '#000000', 1, '#FFFFFF', 1, '', '0.3', '', 1, '#E74C3C', 1, 1, 1, 'code');

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(1, 'Can add Theme', 1, 'add_theme');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(2, 'Can change Theme', 1, 'change_theme');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(3, 'Can delete Theme', 1, 'delete_theme');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(4, 'Can view Theme', 1, 'view_theme');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(5, 'Can add cart', 2, 'add_cart');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(6, 'Can change cart', 2, 'change_cart');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(7, 'Can delete cart', 2, 'delete_cart');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(8, 'Can view cart', 2, 'view_cart');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(9, 'Can add order', 3, 'add_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(10, 'Can change order', 3, 'change_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(11, 'Can delete order', 3, 'delete_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(12, 'Can view order', 3, 'view_order');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(13, 'Can add product', 4, 'add_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(14, 'Can change product', 4, 'change_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(15, 'Can delete product', 4, 'delete_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(16, 'Can view product', 4, 'view_product');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(17, 'Can add seller', 5, 'add_seller');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(18, 'Can change seller', 5, 'change_seller');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(19, 'Can delete seller', 5, 'delete_seller');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(20, 'Can view seller', 5, 'view_seller');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(21, 'Can add order item', 6, 'add_orderitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(22, 'Can change order item', 6, 'change_orderitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(23, 'Can delete order item', 6, 'delete_orderitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(24, 'Can view order item', 6, 'view_orderitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(25, 'Can add cart item', 7, 'add_cartitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(26, 'Can change cart item', 7, 'change_cartitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(27, 'Can delete cart item', 7, 'delete_cartitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(28, 'Can view cart item', 7, 'view_cartitem');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(29, 'Can add bidder', 8, 'add_bidder');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(30, 'Can change bidder', 8, 'change_bidder');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(31, 'Can delete bidder', 8, 'delete_bidder');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(32, 'Can view bidder', 8, 'view_bidder');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(33, 'Can add profile', 9, 'add_profile');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(34, 'Can change profile', 9, 'change_profile');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(35, 'Can delete profile', 9, 'delete_profile');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(36, 'Can view profile', 9, 'view_profile');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(37, 'Can add history', 10, 'add_history');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(38, 'Can change history', 10, 'change_history');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(39, 'Can delete history', 10, 'delete_history');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(40, 'Can view history', 10, 'view_history');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(41, 'Can add favourites', 11, 'add_favourites');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(42, 'Can change favourites', 11, 'change_favourites');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(43, 'Can delete favourites', 11, 'delete_favourites');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(44, 'Can view favourites', 11, 'view_favourites');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(45, 'Can add conversation', 12, 'add_conversation');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(46, 'Can change conversation', 12, 'change_conversation');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(47, 'Can delete conversation', 12, 'delete_conversation');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(48, 'Can view conversation', 12, 'view_conversation');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(49, 'Can add log entry', 13, 'add_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(50, 'Can change log entry', 13, 'change_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(51, 'Can delete log entry', 13, 'delete_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(52, 'Can view log entry', 13, 'view_logentry');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(53, 'Can add permission', 14, 'add_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(54, 'Can change permission', 14, 'change_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(55, 'Can delete permission', 14, 'delete_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(56, 'Can view permission', 14, 'view_permission');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(57, 'Can add group', 15, 'add_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(58, 'Can change group', 15, 'change_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(59, 'Can delete group', 15, 'delete_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(60, 'Can view group', 15, 'view_group');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(61, 'Can add user', 16, 'add_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(62, 'Can change user', 16, 'change_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(63, 'Can delete user', 16, 'delete_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(64, 'Can view user', 16, 'view_user');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(65, 'Can add content type', 17, 'add_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(66, 'Can change content type', 17, 'change_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(67, 'Can delete content type', 17, 'delete_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(68, 'Can view content type', 17, 'view_contenttype');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(69, 'Can add session', 18, 'add_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(70, 'Can change session', 18, 'change_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(71, 'Can delete session', 18, 'delete_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(72, 'Can view session', 18, 'view_session');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(73, 'Can add notification', 19, 'add_notification');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(74, 'Can change notification', 19, 'change_notification');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(75, 'Can delete notification', 19, 'delete_notification');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(76, 'Can view notification', 19, 'view_notification');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(77, 'Can add notify', 20, 'add_notify');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(78, 'Can change notify', 20, 'change_notify');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(79, 'Can delete notify', 20, 'delete_notify');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(80, 'Can view notify', 20, 'view_notify');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(81, 'Can add dispute', 21, 'add_dispute');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(82, 'Can change dispute', 21, 'change_dispute');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(83, 'Can delete dispute', 21, 'delete_dispute');
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES(84, 'Can view dispute', 21, 'view_dispute');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(1, 'pbkdf2_sha256$150000$yziVHlwiwRa1$VWMKBMA2z9niB05T04hAsIhbbmuVzScVaHtnQspLDOQ=', '2020-06-05 04:41:28.987601', 0, 'kushal', 'Kushal', 'Bhattarai', 'kushal.bhattarai23@gmail.com', 0, 1, '2020-04-12 15:31:15.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(2, 'pbkdf2_sha256$150000$mFXoSPcpHU9q$Moq8g1yQRbjvIkkazBmZpLcRSAvD/KhKSVlgKk5vM9g=', '2020-06-05 05:10:10.515516', 0, 'dummy14', 'dummy', 'dummy', 'dummy14@gmail.com', 0, 1, '2020-04-12 16:07:41.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(3, 'pbkdf2_sha256$216000$gCxhMLu2xP0O$RqrmqOdb6LAVlmeJMGQBx6KFuAtk5etKQa767CjX1bk=', '2022-07-31 21:26:22.755935', 0, 'dummy44444', 'Dummy', 'Dummy', 'dummy1222222222224@gmail.com', 0, 1, '2020-04-12 16:52:33.288920');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(4, 'pbkdf2_sha256$150000$Oy0j28a5PsaQ$6C/MMf2bQ/g6gTdZFyeVjOZL4IKDm89t1n1tlVKe8Ig=', '2020-06-05 02:20:43.000000', 0, 'dummy422', 'dummy', 'sid', 'dummy4@gmail.com', 0, 1, '2020-04-12 16:55:15.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(5, 'pbkdf2_sha256$216000$KfmZ5CJpRmdD$pCDFwZJ1hK/pjMhPiPI4V/HNTYk8cU9nFptnF9kbHkI=', '2022-07-31 16:49:30.454507', 0, 'SAMANGHAR', 'Kushal', 'Bhattarai', 'SAMANGHAR@gmail.com', 0, 1, '2020-04-13 16:50:46.925869');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(6, 'pbkdf2_sha256$216000$0rZiTb83GZP0$2puaePkL/wBsD0fUAOvbtogcxK4+WzkQUN+n7K66gDI=', '2022-07-31 17:00:38.765744', 0, 'SAMANGHAR2', 'Dummy', 'Dummy', 'SAMANGHAR2@gmail.com', 0, 1, '2020-04-13 16:52:13.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(7, 'pbkdf2_sha256$216000$yTN85EeR3VON$tjcvy5OapIfRslSGQvAoXqsEyy5W/1B5pRx/xaPpcz0=', '2022-07-31 16:37:05.645787', 0, 'SAMANGHAR23', 'Kushal', 'Dummy', 'SAMANGHAR23@gmail.com', 0, 1, '2020-04-16 13:46:54.722167');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(8, 'pbkdf2_sha256$150000$NwMg65jaiULF$BeIwrjn+V7hzvDFFU9tbGDDhA0OExNIX6rGMKtrDiOg=', '2020-04-23 13:30:56.000000', 0, 'SAMANGHAR234', 'Dummy', 'Bhattarai', 'SAMANGHAR234@gmail.com', 0, 1, '2020-04-17 15:45:43.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(9, 'pbkdf2_sha256$150000$BBvsYSLvsKR2$XGnaYghHNDparnhLA8zmaB7G4RXhwh9SLDZzvVw/psk=', NULL, 0, 'SAMANGHAR231', 'Kushal', 'Bhattarai', 'user23@gmail.com', 0, 1, '2020-04-17 17:12:52.114713');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(10, 'pbkdf2_sha256$150000$X1Qz4J4JczOo$ZQ/+mG/k/X73EH3aOQkC2m5aaEHiDbRTOQaw8db38Fs=', '2020-06-04 12:52:28.337097', 0, 'kushal2', 'Kushal', 'Bhattarai', 'user233@gmail.com', 0, 1, '2020-04-18 08:56:39.908554');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(11, 'pbkdf2_sha256$150000$HabVzTBWxzRz$1N0uNl71K9YJYiA8PI1/dqKAAdMH4C5WHLd6m0Pmcdo=', '2020-04-23 14:02:15.000000', 0, 'SAMANGHAR2322', 'sid', 'Bhattarai', 'SAMANGHAR2322@gmail.com', 0, 1, '2020-04-23 14:02:09.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(14, 'pbkdf2_sha256$216000$1VESjVwqJv5r$6iFhqK3a6dGT5lGhWiv1A1PKVQUDB51kRiOV8cWjQn0=', '2022-07-31 21:25:50.502533', 0, '1SAMANGHAR231', 'Dummy', 'Dummy', '1SAMANGHAR2311@gmail.com', 0, 1, '2020-04-23 14:07:49.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(15, 'pbkdf2_sha256$150000$15q9UzEQqGy3$hb2IRDVBhoytQxnbeb4ah5dMh0cTixV6jejl2ZzNzfY=', NULL, 0, 'saman', 'Kushal', 'Bhattarai', 'samanghar@gmail.com', 0, 0, '2020-05-25 10:28:56.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(16, 'pbkdf2_sha256$150000$AtKDzGjnCB3j$qwhlV7F5vZYcRL84qhL3WtoROh5TO17glMySIj8j2eA=', '2020-06-05 02:21:19.013007', 0, 'SiddharthaB', 'Sid', 'Bhattarai', 'siddharthaB@gmail.com', 0, 1, '2020-06-04 12:13:04.033630');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(17, 'pbkdf2_sha256$216000$XSe2M3Hdle2I$8yetrUW0CHArJrykuCzWQUrnzb5YC/gQR+rE9Q1KEbk=', '2022-07-31 16:55:36.982743', 1, 'superadmin', 'kushal', 'bhattarai', 'np01cp4a170221@islingtoncollege.edu.np', 1, 1, '2020-06-05 02:29:35.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(18, 'pbkdf2_sha256$150000$tP4Yr5OTvTIV$DAOnTIQEdEj4xKI1Fx1VwAzYU1JyNSvXPI0kty4km3c=', NULL, 0, 'satff1', 'satff', 'number 1', 'auctionhousestaff@gmail.com', 1, 1, '2020-06-05 02:30:19.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(19, 'pbkdf2_sha256$216000$qpF8cCmU0fr7$/cKQzhNtJ+ww9+RuzqSry1izhEbDi/ZmkFRXW9L5ZZ8=', '2022-07-31 21:27:56.225224', 0, 'staff', 'staff1', 'staff1', 'staff@auctionhouse.com', 1, 1, '2020-06-05 02:34:38.000000');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(20, 'pbkdf2_sha256$216000$UraBFnnECYbm$zDXC5a5cDWE3emRn1z0C4ZIq5rpqvuWqML8ZlGpXDHU=', '2022-07-31 21:17:47.593295', 0, 'sid1234', 'sid', 'Bhattarai', 'siddharthabhattarai5@gmail.com', 0, 1, '2022-07-31 21:03:42.862540');
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES(21, 'pbkdf2_sha256$216000$l7EMJjAavAbB$e1EF1VzVjQvy//hnvSCsqRY1+yf8RDsOOf49Vn/5fhs=', '2022-07-31 21:28:07.749364', 0, 'bkushal', 'bhattarai', 'kushal', 'bhattarai23.kushal@gmail.com', 0, 1, '2022-07-31 21:08:47.341164');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `cart_id` varchar(250) NOT NULL,
  `date_added` date NOT NULL,
  `user_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `cart_id`, `date_added`, `user_id`) VALUES(26, '6', '2022-07-31', 14);
INSERT INTO `cart` (`id`, `cart_id`, `date_added`, `user_id`) VALUES(27, '6', '2022-07-31', 6);
INSERT INTO `cart` (`id`, `cart_id`, `date_added`, `user_id`) VALUES(28, '6', '2022-08-01', 20);

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `cart_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(1, '2020-04-19 02:49:51.376586', '3', 'Product object (3)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"image2\", \"image3\", \"category\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(2, '2020-04-19 02:50:47.872963', '5', 'Product object (5)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(3, '2020-04-19 02:52:02.949791', '6', 'Product object (6)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(4, '2020-04-19 02:54:15.498381', '7', 'Product object (7)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"category\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(5, '2020-04-19 02:54:52.447929', '8', 'Product object (8)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(6, '2020-04-19 02:55:12.071364', '8', 'Product object (8)', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(7, '2020-04-19 03:12:47.866068', '9', 'Product object (9)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"category\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(8, '2020-04-19 03:13:35.944536', '10', 'Product object (10)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"image2\", \"image3\", \"category\", \"description\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(9, '2020-04-19 03:15:28.679124', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\", \"description\", \"minimum_price\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(10, '2020-04-23 13:07:26.130229', '2', 'dummy14', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(11, '2020-05-25 13:43:55.926232', '19', 'Product object (19)', 2, '[{\"changed\": {\"fields\": [\"bid_end_date\"]}}]', 4, 6);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(12, '2020-05-25 13:57:16.864920', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"winner\", \"bid_end_date\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(13, '2020-05-25 13:57:59.869110', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"winner\", \"bid_end_date\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(14, '2020-05-27 11:47:26.068269', '22', 'Product object (22)', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(15, '2020-05-27 11:50:25.853207', '23', 'Product object (23)', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(16, '2020-05-27 11:51:07.628445', '23', 'Product object (23)', 2, '[{\"changed\": {\"fields\": [\"product_name\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(17, '2020-05-27 11:53:19.313339', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(18, '2020-05-27 11:55:30.135819', '13', 'Product object (13)', 2, '[{\"changed\": {\"fields\": [\"image\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(19, '2020-05-27 11:56:12.638989', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"product_name\", \"image\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(20, '2020-05-27 11:56:34.871823', '21', 'Product object (21)', 2, '[{\"changed\": {\"fields\": [\"image2\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(21, '2020-06-04 12:34:26.216974', '27', '27', 3, '', 3, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(22, '2020-06-04 12:34:49.978686', '23', 'Product object (23)', 2, '[{\"changed\": {\"fields\": [\"purchased\", \"winner\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(23, '2020-06-04 12:36:02.493838', '23', 'Product object (23)', 2, '[{\"changed\": {\"fields\": [\"stock\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(24, '2020-06-04 12:57:16.100420', '5', '83bx5adzjnjm2b9fxo8ialgt0t5zfowu', 3, '', 2, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(25, '2020-06-04 12:57:19.817534', '4', '9hnksqgj1rahzrfajzkvt0kyxjq4h0gv', 3, '', 2, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(26, '2020-06-04 12:57:23.080407', '6', 'lx2p3gfzxrr4x12veafr7yhshga5qhx2', 3, '', 2, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(27, '2020-06-04 12:57:25.935514', '8', 'aihuqy40jw4chiozdw3zxpq5ixfz2ezv', 3, '', 2, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(28, '2020-06-04 14:50:14.395994', '24', 'Product object (24)', 2, '[{\"changed\": {\"fields\": [\"category\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(29, '2020-06-05 02:02:55.945339', '20', 'Product object (20)', 2, '[{\"changed\": {\"fields\": [\"winner\"]}}]', 4, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(30, '2020-06-05 02:27:40.122301', '14', '1SAMANGHAR231', 2, '[{\"changed\": {\"fields\": [\"is_active\", \"is_staff\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(31, '2020-06-05 02:27:51.167582', '2', 'dummy14', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(32, '2020-06-05 02:28:07.903082', '4', 'dummy422', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(33, '2020-06-05 02:28:22.079304', '15', 'saman', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(34, '2020-06-05 02:28:36.498286', '6', 'SAMANGHAR2', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(35, '2020-06-05 02:28:43.790639', '11', 'SAMANGHAR2322', 2, '[{\"changed\": {\"fields\": [\"is_staff\", \"is_superuser\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(36, '2020-06-05 02:28:53.628417', '8', 'SAMANGHAR234', 2, '[{\"changed\": {\"fields\": [\"is_staff\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(37, '2020-06-05 02:31:09.554528', '18', 'satff1', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(38, '2020-06-05 02:31:34.087162', '17', 'superadmin', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 16, 1);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(39, '2020-06-05 02:32:08.908246', '1', 'kushal', 2, '[{\"changed\": {\"fields\": [\"first_name\", \"last_name\", \"is_staff\", \"is_superuser\"]}}]', 16, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(40, '2020-06-05 02:34:59.065099', '19', 'staff', 2, '[{\"changed\": {\"fields\": [\"is_active\"]}}]', 16, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(41, '2020-06-05 04:12:05.974572', '25', 'Product object (25)', 2, '[{\"changed\": {\"fields\": [\"bid_end_date\"]}}]', 4, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(42, '2020-06-05 04:16:40.794138', '36', '36', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(43, '2020-06-05 04:16:40.924882', '35', '35', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(44, '2020-06-05 04:16:41.003045', '34', '34', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(45, '2020-06-05 04:16:41.181138', '33', '33', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(46, '2020-06-05 04:16:41.212375', '32', '32', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(47, '2020-06-05 04:16:41.246911', '31', '31', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(48, '2020-06-05 04:16:41.280140', '30', '30', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(49, '2020-06-05 04:16:41.389318', '29', '29', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(50, '2020-06-05 04:16:41.457465', '28', '28', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(51, '2020-06-05 04:16:41.490646', '26', '26', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(52, '2020-06-05 04:16:41.524296', '25', '25', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(53, '2020-06-05 04:16:41.624375', '24', '24', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(54, '2020-06-05 04:16:41.729334', '23', '23', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(55, '2020-06-05 04:17:23.591022', '25', 'Product object (25)', 2, '[{\"changed\": {\"fields\": [\"expired\", \"winner\", \"bid_end_date\"]}}]', 4, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(56, '2020-06-05 04:26:15.622071', '24', 'Product object (24)', 2, '[{\"changed\": {\"fields\": [\"stock\", \"purchased\", \"winner\"]}}]', 4, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(57, '2020-06-05 04:26:25.363937', '3', 'Product object (3)', 2, '[{\"changed\": {\"fields\": [\"winner\"]}}]', 4, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(58, '2020-06-05 05:12:42.369284', '39', '39', 3, '', 3, 17);
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES(59, '2022-07-31 16:58:10.475744', '29', 'Product object (29)', 2, '[{\"changed\": {\"fields\": [\"Category\", \"Stock\"]}}]', 4, 17);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(13, 'admin', 'logentry');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(1, 'admin_interface', 'theme');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(15, 'auth', 'group');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(14, 'auth', 'permission');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(16, 'auth', 'user');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(17, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(19, 'notifications', 'notification');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(18, 'sessions', 'session');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(12, 'users', 'conversation');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(21, 'users', 'dispute');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(11, 'users', 'favourites');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(10, 'users', 'history');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(20, 'users', 'notify');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(9, 'users', 'profile');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(8, 'website', 'bidder');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(2, 'website', 'cart');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(7, 'website', 'cartitem');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(3, 'website', 'order');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(6, 'website', 'orderitem');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(4, 'website', 'product');
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES(5, 'website', 'seller');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(1, 'contenttypes', '0001_initial', '2020-04-12 14:54:55.930272');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(2, 'auth', '0001_initial', '2020-04-12 14:55:01.604683');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(3, 'admin', '0001_initial', '2020-04-12 14:55:13.806452');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(4, 'admin', '0002_logentry_remove_auto_add', '2020-04-12 14:55:18.230155');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-04-12 14:55:18.323887');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(6, 'admin_interface', '0001_initial', '2020-04-12 14:55:19.250798');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(7, 'admin_interface', '0002_add_related_modal', '2020-04-12 14:55:22.679175');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(8, 'admin_interface', '0003_add_logo_color', '2020-04-12 14:55:23.546844');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(9, 'admin_interface', '0004_rename_title_color', '2020-04-12 14:55:23.774133');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(10, 'admin_interface', '0005_add_recent_actions_visible', '2020-04-12 14:55:25.039143');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(11, 'admin_interface', '0006_bytes_to_str', '2020-04-12 14:55:25.156137');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(12, 'admin_interface', '0007_add_favicon', '2020-04-12 14:55:25.818966');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(13, 'admin_interface', '0008_change_related_modal_background_opacity_type', '2020-04-12 14:55:27.257701');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(14, 'admin_interface', '0009_add_enviroment', '2020-04-12 14:55:28.704261');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(15, 'admin_interface', '0010_add_localization', '2020-04-12 14:55:28.867353');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(16, 'admin_interface', '0011_add_environment_options', '2020-04-12 14:55:31.220253');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(17, 'admin_interface', '0012_update_verbose_names', '2020-04-12 14:55:31.367914');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(18, 'admin_interface', '0013_add_related_modal_close_button', '2020-04-12 14:55:32.164878');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(19, 'admin_interface', '0014_name_unique', '2020-04-12 14:55:32.479563');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(20, 'admin_interface', '0015_add_language_chooser_active', '2020-04-12 14:55:33.336531');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(21, 'admin_interface', '0016_add_language_chooser_display', '2020-04-12 14:55:34.302998');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(22, 'contenttypes', '0002_remove_content_type_name', '2020-04-12 14:55:36.382094');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(23, 'auth', '0002_alter_permission_name_max_length', '2020-04-12 14:55:38.103364');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(24, 'auth', '0003_alter_user_email_max_length', '2020-04-12 14:55:40.824897');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(25, 'auth', '0004_alter_user_username_opts', '2020-04-12 14:55:40.974599');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(26, 'auth', '0005_alter_user_last_login_null', '2020-04-12 14:55:41.624112');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(27, 'auth', '0006_require_contenttypes_0002', '2020-04-12 14:55:41.667681');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(28, 'auth', '0007_alter_validators_add_error_messages', '2020-04-12 14:55:41.736210');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(29, 'auth', '0008_alter_user_username_max_length', '2020-04-12 14:55:42.976743');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(30, 'auth', '0009_alter_user_last_name_max_length', '2020-04-12 14:55:44.237207');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(31, 'auth', '0010_alter_group_name_max_length', '2020-04-12 14:55:45.624142');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(32, 'auth', '0011_update_proxy_permissions', '2020-04-12 14:55:45.702241');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(33, 'notifications', '0001_initial', '2020-04-12 14:55:46.642966');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(34, 'notifications', '0002_auto_20150224_1134', '2020-04-12 14:55:54.439420');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(35, 'notifications', '0003_notification_data', '2020-04-12 14:55:55.614923');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(36, 'notifications', '0004_auto_20150826_1508', '2020-04-12 14:55:55.757704');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(37, 'notifications', '0005_auto_20160504_1520', '2020-04-12 14:55:55.841927');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(38, 'notifications', '0006_indexes', '2020-04-12 14:55:57.893296');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(39, 'notifications', '0007_add_timestamp_index', '2020-04-12 14:55:58.637647');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(40, 'notifications', '0008_index_together_recipient_unread', '2020-04-12 14:55:59.304683');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(41, 'sessions', '0001_initial', '2020-04-12 14:56:00.172166');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(42, 'website', '0001_initial', '2020-04-12 14:56:06.508118');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(43, 'users', '0001_initial', '2020-04-12 14:56:23.067022');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(44, 'users', '0002_remove_profile_image', '2020-04-13 11:33:44.866399');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(45, 'users', '0003_notify', '2020-04-16 13:22:02.679539');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(46, 'users', '0004_notify_product', '2020-04-16 17:00:36.197135');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(47, 'users', '0005_auto_20200417_1917', '2020-04-17 13:33:08.227675');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(48, 'website', '0002_auto_20200417_1923', '2020-04-17 13:39:03.806391');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(49, 'users', '0006_dispute', '2020-04-18 03:53:23.468135');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(50, 'website', '0003_cart_user', '2020-04-25 16:32:17.768721');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(51, 'users', '0007_dispute_solved', '2020-05-23 05:26:34.124193');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(52, 'auth', '0012_alter_user_first_name_max_length', '2022-07-25 16:28:19.492656');
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES(53, 'users', '0008_auto_20220725_2213', '2022-07-25 16:28:19.638523');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES('2ucs9dqrwox8bphwacpm1cbn1cqbv2dg', '.eJxVjssOgyAURP-FdUMUFK9dNd33G8i9PIRqIRFdNf33YuKi3c6ZOZk307hvQe_FrTpadmWiZZffkNDMLh3EPjFNmZuctjUSPyr8pIU_snXL_ez-CQKWUNeKFACCkgOAlU1jkIRrCToJbadUrxQNPYzegRmtdYC9JwleKuGF7wRUaXGlxJy0e2FcqpICbhuuGIXk814CLrfpQPXii32-sjpIeg:1oIGTn:ZAUKak645yrZqdOJG0gsBAVw-R-uKFMnsDCHb-NGURs', '2022-08-14 21:28:07.950909');
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES('7gbt1gf42wbs93d0znu0k9tlxt4a1gyp', '.eJxVjr0OwiAAhN-F2RDKP07WRZc66AMQCrRFW0hKOxnfXZp00PW-uy_3Btqsy6DX7GcdHDgCDg6_WWvsy8cNuKeJfYI2xWUOLdwqcKcZNsn58bx3_wSDyUNZG-YIqiTjBLWUUYqY4twqKZyvlFRYyA5JiwSTmBmKuWVYOkUYp64TiIgizT7nkKL2kwljUT7qpr5drvUdn_otKtcm8PkC1PVCvA:1oICIx:l6QZ78AR6YQiN-OMkwKm0YA2NfU_f9jkM-Wa8GLh2a0', '2022-08-14 17:00:39.142747');

-- --------------------------------------------------------

--
-- Table structure for table `notifications_notification`
--

CREATE TABLE `notifications_notification` (
  `id` int(11) NOT NULL,
  `level` varchar(20) NOT NULL,
  `unread` tinyint(1) NOT NULL,
  `actor_object_id` varchar(255) NOT NULL,
  `verb` varchar(255) NOT NULL,
  `description` longtext,
  `target_object_id` varchar(255) DEFAULT NULL,
  `action_object_object_id` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  `public` tinyint(1) NOT NULL,
  `action_object_content_type_id` int(11) DEFAULT NULL,
  `actor_content_type_id` int(11) NOT NULL,
  `recipient_id` int(11) NOT NULL,
  `target_content_type_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL,
  `emailed` tinyint(1) NOT NULL,
  `data` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `token` varchar(250) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `emailAddress` varchar(250) NOT NULL,
  `created` datetime(6) NOT NULL,
  `billingName` varchar(250) NOT NULL,
  `billingAddress1` varchar(250) NOT NULL,
  `billingCity` varchar(250) NOT NULL,
  `billingPostcode` varchar(250) NOT NULL,
  `billingCountry` varchar(250) NOT NULL,
  `shippingName` varchar(250) NOT NULL,
  `shippingAddress1` varchar(250) NOT NULL,
  `shippingCity` varchar(250) NOT NULL,
  `shippingPostcode` varchar(250) NOT NULL,
  `shippingCountry` varchar(250) NOT NULL,
  `user_name_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `token`, `total`, `emailAddress`, `created`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `shippingName`, `shippingAddress1`, `shippingCity`, `shippingPostcode`, `shippingCountry`, `user_name_id`) VALUES(37, 'u7TNmT4jJD9SkOgrHdh8hBGFpGSrYNZTsz0o1FjjB4BO2kUFsVElIz1qSqtTmTnt', '3.00', 'dummy1222222222224@gmail.com', '2020-06-05 05:00:47.645725', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 3);
INSERT INTO `order` (`id`, `token`, `total`, `emailAddress`, `created`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `shippingName`, `shippingAddress1`, `shippingCity`, `shippingPostcode`, `shippingCountry`, `user_name_id`) VALUES(38, 'GQjogqAYU4wcX4hDM9Yi5lFHw4p2zyGIEiqZVcPYMvY8FAVRxRlvwj0sZO0uXE4i', '2222222.00', 'dummy1222222222224@gmail.com', '2020-06-05 05:01:36.571407', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 3);
INSERT INTO `order` (`id`, `token`, `total`, `emailAddress`, `created`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `shippingName`, `shippingAddress1`, `shippingCity`, `shippingPostcode`, `shippingCountry`, `user_name_id`) VALUES(40, 'bG3FjgdpOH0a7TUXN17YRynN9jEu2b0O5RcVkqSr1JDlvAP6Na70sIJ9jXk5qJB0', '90000.00', 'dummy1222222222224@gmail.com', '2020-06-05 05:11:55.826948', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 3);
INSERT INTO `order` (`id`, `token`, `total`, `emailAddress`, `created`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `shippingName`, `shippingAddress1`, `shippingCity`, `shippingPostcode`, `shippingCountry`, `user_name_id`) VALUES(41, 'hzVLCRNmuLyTbpu7n8VTzHnplTSeQM3GLEZjf1PrHsj6kUHeiK8YvxwTXtXClGAL', '233.00', 'siddharthabhattarai5@gmail.com', '2022-07-31 21:20:02.545125', 'kushal bhattarai', 'mid baneshwor', 'Kathmandu', '44600', 'Nepal', 'Kushal Bhattarai', 'mid baneshwor', 'Kathmandu', '44600', 'Nepal', 20);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `order_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`id`, `product_id`, `quantity`, `price`, `order_id`) VALUES(29, 3, 1, '3.00', 37);
INSERT INTO `orderitem` (`id`, `product_id`, `quantity`, `price`, `order_id`) VALUES(30, 7, 1, '2222222.00', 38);
INSERT INTO `orderitem` (`id`, `product_id`, `quantity`, `price`, `order_id`) VALUES(32, 9, 1, '90000.00', 40);
INSERT INTO `orderitem` (`id`, `product_id`, `quantity`, `price`, `order_id`) VALUES(33, 6, 1, '233.00', 41);

-- --------------------------------------------------------

--
-- Table structure for table `users_conversation`
--

CREATE TABLE `users_conversation` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `convo` varchar(300) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_conversation`
--

INSERT INTO `users_conversation` (`id`, `created`, `convo`, `product_id_id`, `user_name_id`) VALUES(2, '2020-06-05 05:16:48.963124', 'plesase decrease  the price so that i can buy it costs too much', 15, 3);

-- --------------------------------------------------------

--
-- Table structure for table `users_dispute`
--

CREATE TABLE `users_dispute` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `dispute` varchar(1000) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL,
  `solved` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_dispute`
--

INSERT INTO `users_dispute` (`id`, `created`, `dispute`, `product_id_id`, `user_name_id`, `solved`) VALUES(1, '2020-04-27 16:37:23.107758', 'i have a dispute', 10, 7, 0);
INSERT INTO `users_dispute` (`id`, `created`, `dispute`, `product_id_id`, `user_name_id`, `solved`) VALUES(5, '2020-06-05 05:14:27.543523', 'i did not get any product', 9, 3, 0);

-- --------------------------------------------------------

--
-- Table structure for table `users_favourites`
--

CREATE TABLE `users_favourites` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_favourites`
--

INSERT INTO `users_favourites` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(1, '2020-05-23 07:05:40.226142', 7, 1);
INSERT INTO `users_favourites` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(2, '2020-06-05 04:54:09.254288', 9, 17);
INSERT INTO `users_favourites` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(3, '2021-12-26 03:39:43.063559', 7, 14);

-- --------------------------------------------------------

--
-- Table structure for table `users_history`
--

CREATE TABLE `users_history` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_history`
--

INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(1, '2020-04-27 16:51:29.309923', 3, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(5, '2020-04-27 16:11:57.294921', 5, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(6, '2020-04-27 16:11:54.716670', 6, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(11, '2020-04-22 09:06:52.355850', 3, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(12, '2020-04-22 08:25:00.715564', 6, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(13, '2020-04-23 12:58:51.487946', 5, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(14, '2020-04-23 12:37:40.589583', 10, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(17, '2020-06-05 05:10:40.968582', 9, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(18, '2020-04-15 16:35:12.831385', 12, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(21, '2020-04-17 11:44:19.871376', 10, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(22, '2020-04-17 16:43:22.614461', 7, 8);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(23, '2020-04-17 16:43:55.590093', 14, 8);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(25, '2020-04-17 16:43:36.079571', 9, 8);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(26, '2020-04-17 16:43:42.455099', 12, 8);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(27, '2020-04-17 16:43:51.154687', 13, 8);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(28, '2020-06-05 04:41:32.565702', 7, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(29, '2020-04-18 08:13:06.401473', 3, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(30, '2021-12-26 03:31:27.420314', 5, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(31, '2022-07-31 17:07:12.443746', 6, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(32, '2022-07-31 17:07:19.098750', 10, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(33, '2020-04-18 08:10:32.468268', 7, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(37, '2020-04-18 10:02:03.289471', 5, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(38, '2020-04-18 14:33:45.576398', 6, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(39, '2020-04-22 09:04:15.061013', 7, 2);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(40, '2020-04-23 17:53:21.871681', 9, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(41, '2020-04-27 16:11:49.419855', 12, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(42, '2020-04-23 17:53:14.446848', 13, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(43, '2020-04-24 10:44:59.677846', 3, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(44, '2020-04-25 14:11:22.031620', 7, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(45, '2020-04-23 18:10:47.789284', 9, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(46, '2020-04-23 18:20:03.585982', 5, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(47, '2020-04-23 18:18:22.581423', 6, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(48, '2020-04-27 16:42:04.805382', 10, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(49, '2020-04-27 16:11:46.925571', 15, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(50, '2020-04-27 16:11:44.432838', 16, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(51, '2020-06-05 04:14:29.194480', 21, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(55, '2020-04-25 16:53:49.155785', 22, 5);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(56, '2020-04-25 17:05:17.513932', 23, 5);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(57, '2020-06-04 12:34:58.267026', 23, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(58, '2020-05-27 11:57:03.760446', 21, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(59, '2020-04-27 16:11:36.373041', 19, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(60, '2020-04-27 17:02:31.978489', 18, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(61, '2020-05-25 13:59:56.375345', 17, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(62, '2020-04-27 16:42:42.001205', 18, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(64, '2020-05-23 07:10:22.243356', 22, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(67, '2020-06-04 12:37:10.928526', 23, 16);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(68, '2020-06-04 13:01:32.198843', 22, 16);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(69, '2020-06-04 14:49:24.661193', 24, 16);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(70, '2020-06-04 14:50:34.169867', 24, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(71, '2020-06-05 02:00:59.781973', 22, 1);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(72, '2020-06-05 03:51:26.596852', 22, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(73, '2020-06-05 03:51:31.678614', 24, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(74, '2020-06-05 04:12:37.061256', 25, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(75, '2020-06-05 04:17:37.774400', 25, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(76, '2021-12-20 06:56:03.126088', 7, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(77, '2020-06-05 05:02:38.991867', 7, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(78, '2020-06-05 04:30:59.233368', 12, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(79, '2020-06-05 04:37:11.696076', 3, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(80, '2020-06-05 04:54:09.367287', 9, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(81, '2020-06-05 04:57:36.335139', 14, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(82, '2020-06-05 05:14:27.834333', 9, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(83, '2020-06-05 05:09:43.284423', 12, 7);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(84, '2020-06-05 05:15:22.254431', 12, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(85, '2020-06-05 05:16:49.306231', 15, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(86, '2020-06-05 05:24:15.074832', 13, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(87, '2021-12-15 05:30:55.974148', 6, 5);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(88, '2021-12-20 06:54:31.282157', 5, 5);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(89, '2021-12-26 03:39:43.226258', 7, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(90, '2021-12-26 03:30:50.333056', 16, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(91, '2021-12-26 03:31:58.883965', 22, 6);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(92, '2021-12-26 03:37:58.445251', 10, 17);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(93, '2022-07-31 17:04:42.271746', 10, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(94, '2021-12-26 03:39:47.244889', 3, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(95, '2022-01-03 07:03:30.082484', 27, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(96, '2022-01-03 07:03:21.186702', 26, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(97, '2022-01-03 07:04:22.434221', 30, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(98, '2022-06-21 06:35:42.974553', 22, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(99, '2022-06-21 06:35:49.322086', 9, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(100, '2022-07-31 17:00:04.618747', 5, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(101, '2022-07-31 17:05:31.707744', 6, 14);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(102, '2022-07-31 21:25:35.407557', 31, 20);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(103, '2022-07-31 21:28:15.791121', 31, 21);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(104, '2022-07-31 21:19:13.570085', 6, 20);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(105, '2022-07-31 21:26:54.530119', 31, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(106, '2022-07-31 21:26:59.860468', 32, 3);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(107, '2022-07-31 21:27:33.350278', 32, 19);
INSERT INTO `users_history` (`id`, `created`, `product_id_id`, `user_name_id`) VALUES(108, '2022-07-31 21:34:02.944464', 32, 21);

-- --------------------------------------------------------

--
-- Table structure for table `users_notify`
--

CREATE TABLE `users_notify` (
  `id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `viewed` tinyint(1) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_notify`
--

INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(56, 'You have new bidder', 0, 1, 7);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(57, 'You have a new bid amount for your products', 0, 3, 7);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(58, 'You have new bidder', 0, 2, 9);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(59, 'You have a new bid amount for your products', 0, 3, 9);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(60, 'You have a new bid amount for your products', 0, 3, 9);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(61, 'You have new bidder', 0, 3, 32);
INSERT INTO `users_notify` (`id`, `message`, `viewed`, `user_id`, `product_id`) VALUES(62, 'You have a new bid amount for your products', 0, 3, 32);

-- --------------------------------------------------------

--
-- Table structure for table `users_profile`
--

CREATE TABLE `users_profile` (
  `id` int(11) NOT NULL,
  `billingName` varchar(250) NOT NULL,
  `billingAddress1` varchar(250) NOT NULL,
  `billingCity` varchar(250) NOT NULL,
  `billingPostcode` varchar(250) NOT NULL,
  `billingCountry` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users_profile`
--

INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(1, '', '', '', '', 'Nepal', 1);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(2, 'k', 'Baneshwors', 'Kathamndu', '44600', 'Nepal', 2);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(3, 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 3);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(4, '', '', '', '', 'Nepal', 4);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(5, '', '', '', '', 'Nepal', 5);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(6, 'SAMANGHAR', 'MID BANESHWOR', 'KATHMANDU', '44600', 'Nepal', 6);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(7, 'SAMANGHAR', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 7);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(8, '', '', '', '', 'Nepal', 8);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(9, '', '', '', '', 'Nepal', 9);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(10, '', '', '', '', 'Nepal', 10);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(11, '', '', '', '', 'Nepal', 11);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(14, '', '', '', '', 'Nepal', 14);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(15, '', '', '', '', 'Nepal', 15);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(16, 'Siddhartha', 'Mid Baneshwor', 'Kathamndu', '44600', 'Nepal', 16);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(17, 'Siddhartha', 'Baneshwor', 'Kathamndu', '44600', 'Nepal', 17);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(18, '', '', '', '', 'Nepal', 18);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(19, '', '', '', '', 'Nepal', 19);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(20, '', '', '', '', 'Nepal', 20);
INSERT INTO `users_profile` (`id`, `billingName`, `billingAddress1`, `billingCity`, `billingPostcode`, `billingCountry`, `user_id`) VALUES(21, '', '', '', '', 'Nepal', 21);

-- --------------------------------------------------------

--
-- Table structure for table `website_bidder`
--

CREATE TABLE `website_bidder` (
  `id` int(11) NOT NULL,
  `bid_end_date` datetime(6) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `max_amount` int(11) DEFAULT NULL,
  `bid_amount` int(11) DEFAULT NULL,
  `wining` tinyint(1) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_bidder`
--

INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(12, '2020-11-01 18:15:00.000000', '2020-04-25 14:11:55.827652', '2020-04-25 14:11:55.827652', 84, 83, 1, 21, 7);
INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(18, '2020-06-07 18:15:00.000000', '2020-06-05 04:12:35.882261', '2020-06-05 04:12:35.882261', 23334, 23333, 1, 25, 7);
INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(19, '2020-08-14 07:15:00.000000', '2020-06-05 04:35:15.403595', '2020-06-05 04:35:15.403595', 2222223, 2222222, 1, 7, 3);
INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(20, '2020-06-27 18:15:00.000000', '2020-06-05 05:03:04.293100', '2020-06-05 05:03:04.293100', 90001, 90000, 1, 9, 3);
INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(21, '2022-08-01 18:15:00.000000', '2022-07-31 21:09:19.594007', '2022-07-31 21:09:19.594007', 4501, 4500, 1, 31, 21);
INSERT INTO `website_bidder` (`id`, `bid_end_date`, `created`, `updated`, `max_amount`, `bid_amount`, `wining`, `product_id_id`, `user_name_id`) VALUES(22, '2022-08-01 18:15:00.000000', '2022-07-31 21:28:31.520521', '2022-07-31 21:28:31.520521', 2508, 2507, 1, 32, 21);

-- --------------------------------------------------------

--
-- Table structure for table `website_product`
--

CREATE TABLE `website_product` (
  `id` int(11) NOT NULL,
  `product_name` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `image2` varchar(100) DEFAULT NULL,
  `image3` varchar(100) DEFAULT NULL,
  `category` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `minimum_price` int(11) DEFAULT NULL,
  `stock` int(11) DEFAULT NULL,
  `status` varchar(32) NOT NULL,
  `purchased` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `bid_end_date` datetime(6) DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `winner_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_product`
--

INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(3, 'World War Game', 'auction_system/image_1587264591.3572724_image_1577449248.9492478_game-05.png', 'auction_system/image_1588005921.8052115_keybd_open.png', 'auction_system/image_1587264591.3671255_image_1577449248.9492478_game-05.png', 'Games', 'Call of Duty Xbox game', 3, 0, 'shop', 1, 0, NULL, '2020-04-13 04:07:40.000000', '2020-04-13 04:07:40.000000', 3);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(5, 'Air Pods', 'auction_system/image_1587264647.8062434_image_1577184352.7302911_image_1577107605.12798_OGrEQT8.jfif', 'auction_system/image_1587202228.4925938_abc_-_Copy.png', '', 'Mobile & Accessories', 'USED Air pods \r\n2nd hand item', 23, 0, 'shop', 0, 0, NULL, '2020-04-13 04:18:57.000000', '2020-04-13 04:18:57.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(6, 'Dell Laptop', 'auction_system/image_1587264722.8433104_image_1577175035.1380725_laptop-01.png', 'auction_system/image_1586753742.0523436_image_1586103777.7873244_image_1577175035.138072_JRlaZ0I.png', '', 'Computer Peripherals', '8 GB RAM \r\n1 TB HARD DRIVE \r\n1 YEAR OLD LAPTOP', 233, 0, 'shop', 1, 0, NULL, '2020-04-13 04:55:42.000000', '2020-04-13 04:55:42.000000', 20);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(7, 'PS4', 'auction_system/image_1587264855.4095106_image_1577173248.1672583_console-01.png', '', '', 'Games', 'Brand new PS4', 2222222, 0, 'auction', 1, 1, '2020-06-05 04:36:04.003775', '2020-04-13 07:08:23.000000', '2020-04-13 07:08:23.000000', 3);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(9, 'Washing machine', 'auction_system/image_1587265967.7848065_image_1582638691.8905435_washing_machine.jpg', '', '', 'Home Appliances', 'LG washing amchine', 90000, 0, 'auction', 1, 1, '2020-06-05 05:10:40.502761', '2020-04-15 10:19:28.000000', '2020-04-15 10:19:28.000000', 3);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(10, 'marvel vs capcom', 'auction_system/image_1587266015.8814292_image_1577273704.935461_game-03.png', '', '', 'Games', 'PS4 GAME', 67, 1, 'shop', 0, 0, NULL, '2020-04-15 10:20:04.000000', '2020-04-15 10:20:04.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(12, 'Lenovo phone', 'auction_system/image_1587729032.3698716_image_1577175126.9350593_image_1576840094.774234_SvP2u5v.png', '', '', 'Mobile & Accessories', 'abc', 122, 1, 'auction', 0, 1, '2020-06-15 16:35:39.991379', '2020-04-15 16:31:07.395084', '2020-04-15 16:31:07.395084', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(13, 'Monalisa (duplicate)', 'auction_system/image_1590580529.9905603_monalisa_duplicate.jpg', '', '', 'Others', 'closest monalisa  clone painting', 3434, 1, 'auction', 0, 1, '2020-12-26 18:15:00.000000', '2020-04-17 14:29:09.000000', '2020-04-17 14:29:09.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(14, 'Lenovo phone', 'auction_system/image_1591333045.1684299_image_1587729154.1867208_image_1577175126.935059_tc38aA0.png', '', '', 'Mobile & Accessories', 'sg', 232, 1, 'auction', 0, 1, '2020-06-29 18:15:00.000000', '2020-04-17 15:51:41.357011', '2020-04-17 15:51:41.357011', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(15, 'Lenovo phone', 'auction_system/image_1587729032.3698716_image_1577175126.9350593_image_1576840094.774234_SvP2u5v.png', 'auction_system/image_1587729032.434913_image_1577449594.5176756_image_1577175126.9350593_EgtrZFX.png', 'auction_system/image_1587729032.4379387_image_1576840094.7742343_55304804.png', 'Mobile & Accessories', 'Lenovo phone Second-hand phone.\r\nonly used for 1 month', 13333, 1, 'auction', 0, 1, '2020-06-24 18:15:00.000000', '2020-04-24 11:50:29.510913', '2020-04-24 11:50:29.510913', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(16, 'Lenovo phone', 'auction_system/image_1587729104.9764729_image_1577175126.9350593_image_1576840094.774234_kiqxduq.png', 'auction_system/image_1587729104.9796913_image_1577449594.5176756_image_1577175126.935059_Ls5wAhK.png', 'auction_system/image_1587729104.9836912_image_1576840094.7742343_55304804.png', 'Mobile & Accessories', 'Lenovo phone Second-hand phone.\r\nonly used for 1 month', 13333, 1, 'auction', 0, 1, '2020-06-26 23:15:00.000000', '2020-04-24 11:51:44.173635', '2020-04-24 11:51:44.173635', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(17, 'Lenovo phone', 'auction_system/image_1587729154.1867208_image_1577175126.9350593_image_1576840094.774234_mDk4qiw.png', 'auction_system/image_1587729154.192072_image_1577449594.5176756_image_1577175126.9350593_c4MuVmX.png', 'auction_system/image_1587729154.2222545_image_1576840094.7742343_55304804.png', 'Mobile & Accessories', 'Lenovo phone Second-hand phone.\r\nonly used for 1 month', 4566, 1, 'auction', 0, 1, '2020-06-24 18:15:00.000000', '2020-04-24 11:52:34.186720', '2020-04-24 11:52:34.186720', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(18, 'ps4', 'auction_system/image_1587805527.570162_image_1577175035.1380725_laptop-01.png', '', '', 'Games', 'ds', 2333, 1, 'auction', 0, 1, '2020-06-29 18:15:00.000000', '2020-04-25 09:05:25.428407', '2020-04-25 09:05:25.428407', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(19, 'ps4', 'auction_system/image_1587805667.6974916_image_1577175035.1380725_laptop-01.png', '', '', 'Games', 'ds', 2333, 1, 'auction', 0, 1, '2020-06-24 18:15:00.000000', '2020-04-25 09:07:47.000000', '2020-04-25 09:07:47.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(21, 'Garnier Men Acno Fight With Gel', 'auction_system/image_1590580572.51984_61ESp7sQUL._SY355_.jpg', 'auction_system/image_1590580594.8359604_51uGkgUBqIL.jpg', '', 'Beauty Products', 'dd', 83, 1, 'auction', 0, 1, '2020-06-25 13:59:00.000000', '2020-04-25 10:46:16.000000', '2020-04-25 10:46:16.000000', 7);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(22, 'Lenovo phone', 'auction_system/image_1590580045.1060724_lenovo.PNG', '', '', 'Mobile & Accessories', 'hggh', 566, 1, 'shop', 0, 0, NULL, '2020-04-25 16:23:50.000000', '2020-04-25 16:23:50.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(23, 'Garnier Men acno fight', 'auction_system/image_1590580225.8467543_51uGkgUBqIL.jpg', '', '', 'Beauty Products', 'sfd', 22, 1, 'shop', 0, 0, NULL, '2020-04-25 16:53:08.000000', '2020-04-25 16:53:08.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(24, 'Lenovo phone', 'auction_system/image_1591282077.9570317_image_1590580045.1060724_lenovo.PNG', '', '', 'Mobile & Accessories', 'Lenevo phone with Dobly Digital Audio and Bluetooth', 2300, 1, 'shop', 0, 0, NULL, '2020-06-04 14:47:55.000000', '2020-06-04 14:47:55.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(25, 'Bed', 'auction_system/image_1591330278.8581865_image_1587264892.4150553_image_1576839056.335476_bed.jpeg', '', '', 'Home Appliances', 'bed', 23333, 1, 'auction', 0, 1, '2020-06-08 04:12:52.000000', '2020-06-05 04:11:18.000000', '2020-06-05 04:11:18.000000', 7);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(26, 'phone', 'auction_system/image_1641187498.43077_image_1591282077.9570317_image_1590580045.1060724_lenovo.PNG', '', '', 'Mobile & Accessories', '2nd hand . 2 moths use only', 3000, 1, 'shop', 0, 0, NULL, '2022-01-03 05:24:58.429769', '2022-01-03 05:24:58.429769', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(27, 'phone', 'auction_system/image_1641191839.7111654_abc.png', '', '', 'Mobile & Accessories', '2nd hand', 30000, 1, 'auction', 0, 1, '2022-01-28 00:00:00.000000', '2022-01-03 05:58:31.590138', '2022-01-03 05:58:31.590138', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(28, 'phone', 'auction_system/image_1641191633.435234_abc.png', '', '', 'Mobile & Accessories', 'best photo quality', 23333, 1, 'shop', 0, 0, NULL, '2022-01-03 06:33:53.183231', '2022-01-03 06:33:53.183231', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(29, 'phone', 'auction_system/image_1641192292.3001754_abc.png', '', '', 'Mobile & Accessories', 'new phone', 77887, 13, 'shop', 0, 0, NULL, '2022-01-03 06:44:52.000000', '2022-01-03 06:44:52.000000', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(30, 'phone', 'auction_system/image_1641193335.0295491_abc.png', '', '', 'Mobile & Accessories', 'fgs', 2323, 1, 'auction', 0, 1, '2022-01-26 18:15:00.000000', '2022-01-03 07:02:14.615547', '2022-01-03 07:02:14.615547', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(31, 'phone', 'auction_system/image_1659301519.1278057_abc.png', '', '', 'Mobile & Accessories', 'fdhfghjfghfg', 3399, 1, 'auction', 0, 0, '2022-08-01 18:15:00.000000', '2022-07-31 21:05:16.993825', '2022-07-31 21:05:16.993825', NULL);
INSERT INTO `website_product` (`id`, `product_name`, `image`, `image2`, `image3`, `category`, `description`, `minimum_price`, `stock`, `status`, `purchased`, `expired`, `bid_end_date`, `created`, `updated`, `winner_id`) VALUES(32, 'phone', 'auction_system/image_1659302806.2221994_image_1587729104.9796913_image_1577449594.517675_u81e5W6.png', '', '', 'Mobile & Accessories', 'xczc', 2342, 1, 'auction', 0, 0, '2022-08-01 18:15:00.000000', '2022-07-31 21:26:46.061219', '2022-07-31 21:26:46.061219', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `website_seller`
--

CREATE TABLE `website_seller` (
  `id` int(11) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  `user_name_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `website_seller`
--

INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(3, '2020-04-13 04:07:41.124214', '2020-04-13 04:07:41.124214', 3, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(5, '2020-04-13 04:18:57.615535', '2020-04-13 04:18:57.615535', 5, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(6, '2020-04-13 04:55:42.337694', '2020-04-13 04:55:42.337694', 6, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(7, '2020-04-13 07:08:24.187363', '2020-04-13 07:08:24.187363', 7, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(9, '2020-04-15 10:19:28.399102', '2020-04-15 10:19:28.399102', 9, 2);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(10, '2020-04-15 10:20:04.912777', '2020-04-15 10:20:04.912777', 10, 2);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(12, '2020-04-15 16:31:08.228980', '2020-04-15 16:31:08.228980', 12, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(13, '2020-04-17 14:29:13.876608', '2020-04-17 14:29:13.876608', 13, 2);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(14, '2020-04-17 15:51:42.461538', '2020-04-17 15:51:42.461538', 14, 8);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(15, '2020-04-24 11:50:32.841505', '2020-04-24 11:50:32.841505', 15, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(16, '2020-04-24 11:51:45.079640', '2020-04-24 11:51:45.079640', 16, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(17, '2020-04-24 11:52:34.355749', '2020-04-24 11:52:34.355749', 17, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(18, '2020-04-25 09:05:27.881582', '2020-04-25 09:05:27.881582', 18, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(19, '2020-04-25 09:07:47.768538', '2020-04-25 09:07:47.768538', 19, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(21, '2020-04-25 10:46:16.469665', '2020-04-25 10:46:16.470662', 21, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(22, '2020-04-25 16:23:53.296658', '2020-04-25 16:23:53.296658', 22, 6);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(23, '2020-04-25 16:53:08.708599', '2020-04-25 16:53:08.708599', 23, 1);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(24, '2020-06-04 14:47:58.256831', '2020-06-04 14:47:58.256831', 24, 16);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(25, '2020-06-05 04:11:18.978198', '2020-06-05 04:11:18.978198', 25, 17);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(26, '2022-01-03 05:24:58.620775', '2022-01-03 05:24:58.620775', 26, 14);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(27, '2022-01-03 05:58:32.516679', '2022-01-03 05:58:32.516679', 27, 14);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(28, '2022-01-03 06:33:53.657923', '2022-01-03 06:33:53.657923', 28, 14);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(29, '2022-01-03 06:44:52.539281', '2022-01-03 06:44:52.539281', 29, 14);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(30, '2022-01-03 07:02:15.222545', '2022-01-03 07:02:15.222545', 30, 14);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(31, '2022-07-31 21:05:19.591235', '2022-07-31 21:05:19.591235', 31, 20);
INSERT INTO `website_seller` (`id`, `created`, `updated`, `product_id_id`, `user_name_id`) VALUES(32, '2022-07-31 21:26:46.345924', '2022-07-31 21:26:46.345924', 32, 3);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`);

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cart_user_id_c44ac99e_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `CartItem_cart_id_dded4aaa_fk_Cart_id` (`cart_id`),
  ADD KEY `CartItem_product_id_733636f4_fk_website_product_id` (`product_id`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `notifications_notification`
--
ALTER TABLE `notifications_notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co` (`action_object_content_type_id`),
  ADD KEY `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co` (`actor_content_type_id`),
  ADD KEY `notifications_notifi_target_content_type__ccb24d88_fk_django_co` (`target_content_type_id`),
  ADD KEY `notifications_notification_deleted_b32b69e6` (`deleted`),
  ADD KEY `notifications_notification_emailed_23a5ad81` (`emailed`),
  ADD KEY `notifications_notification_public_1bc30b1c` (`public`),
  ADD KEY `notifications_notification_unread_cce4be30` (`unread`),
  ADD KEY `notifications_notification_timestamp_6a797bad` (`timestamp`),
  ADD KEY `notifications_notification_recipient_id_unread_253aadc9_idx` (`recipient_id`,`unread`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Order_user_name_id_580ced65_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`id`),
  ADD KEY `OrderItem_order_id_d1e3f0fb_fk_Order_id` (`order_id`),
  ADD KEY `OrderItem_product_id_d7c49c04` (`product_id`);

--
-- Indexes for table `users_conversation`
--
ALTER TABLE `users_conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_conversation_product_id_id_b5555d25_fk_website_product_id` (`product_id_id`),
  ADD KEY `users_conversation_user_name_id_75d5a4ba_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `users_dispute`
--
ALTER TABLE `users_dispute`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_dispute_product_id_id_02c816e9_fk_website_product_id` (`product_id_id`),
  ADD KEY `users_dispute_user_name_id_197dffd3_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `users_favourites`
--
ALTER TABLE `users_favourites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_favourites_product_id_id_964a209b_fk_website_product_id` (`product_id_id`),
  ADD KEY `users_favourites_user_name_id_7fdc51a3_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `users_history`
--
ALTER TABLE `users_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_history_product_id_id_d534387c_fk_website_product_id` (`product_id_id`),
  ADD KEY `users_history_user_name_id_c41f8324_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `users_notify`
--
ALTER TABLE `users_notify`
  ADD PRIMARY KEY (`id`),
  ADD KEY `users_notify_user_id_2806025d_fk_auth_user_id` (`user_id`),
  ADD KEY `users_notify_product_id_90e221d2_fk_website_product_id` (`product_id`);

--
-- Indexes for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_id` (`user_id`);

--
-- Indexes for table `website_bidder`
--
ALTER TABLE `website_bidder`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_bidder_product_id_id_e22b092e_fk_website_product_id` (`product_id_id`),
  ADD KEY `website_bidder_user_name_id_45020ab5_fk_auth_user_id` (`user_name_id`);

--
-- Indexes for table `website_product`
--
ALTER TABLE `website_product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_product_winner_id_e5cfa633_fk_auth_user_id` (`winner_id`);

--
-- Indexes for table `website_seller`
--
ALTER TABLE `website_seller`
  ADD PRIMARY KEY (`id`),
  ADD KEY `website_seller_product_id_id_c5e10e60_fk_website_product_id` (`product_id_id`),
  ADD KEY `website_seller_user_name_id_3d7553cc_fk_auth_user_id` (`user_name_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_interface_theme`
--
ALTER TABLE `admin_interface_theme`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=85;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `notifications_notification`
--
ALTER TABLE `notifications_notification`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT for table `users_conversation`
--
ALTER TABLE `users_conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users_dispute`
--
ALTER TABLE `users_dispute`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users_favourites`
--
ALTER TABLE `users_favourites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users_history`
--
ALTER TABLE `users_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `users_notify`
--
ALTER TABLE `users_notify`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `users_profile`
--
ALTER TABLE `users_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `website_bidder`
--
ALTER TABLE `website_bidder`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `website_product`
--
ALTER TABLE `website_product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `website_seller`
--
ALTER TABLE `website_seller`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `Cart_user_id_c44ac99e_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `CartItem_cart_id_dded4aaa_fk_Cart_id` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `CartItem_product_id_733636f4_fk_website_product_id` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `notifications_notification`
--
ALTER TABLE `notifications_notification`
  ADD CONSTRAINT `notifications_notifi_action_object_conten_7d2b8ee9_fk_django_co` FOREIGN KEY (`action_object_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `notifications_notifi_actor_content_type_i_0c69d7b7_fk_django_co` FOREIGN KEY (`actor_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `notifications_notifi_target_content_type__ccb24d88_fk_django_co` FOREIGN KEY (`target_content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `notifications_notification_recipient_id_d055f3f0_fk_auth_user_id` FOREIGN KEY (`recipient_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `Order_user_name_id_580ced65_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `OrderItem_order_id_d1e3f0fb_fk_Order_id` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  ADD CONSTRAINT `OrderItem_product_id_d7c49c04_fk_website_product_id` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`);

--
-- Constraints for table `users_conversation`
--
ALTER TABLE `users_conversation`
  ADD CONSTRAINT `users_conversation_product_id_id_b5555d25_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `users_conversation_user_name_id_75d5a4ba_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_dispute`
--
ALTER TABLE `users_dispute`
  ADD CONSTRAINT `users_dispute_product_id_id_02c816e9_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `users_dispute_user_name_id_197dffd3_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_favourites`
--
ALTER TABLE `users_favourites`
  ADD CONSTRAINT `users_favourites_product_id_id_964a209b_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `users_favourites_user_name_id_7fdc51a3_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_history`
--
ALTER TABLE `users_history`
  ADD CONSTRAINT `users_history_product_id_id_d534387c_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `users_history_user_name_id_c41f8324_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_notify`
--
ALTER TABLE `users_notify`
  ADD CONSTRAINT `users_notify_product_id_90e221d2_fk_website_product_id` FOREIGN KEY (`product_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `users_notify_user_id_2806025d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `users_profile`
--
ALTER TABLE `users_profile`
  ADD CONSTRAINT `users_profile_user_id_2112e78d_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_bidder`
--
ALTER TABLE `website_bidder`
  ADD CONSTRAINT `website_bidder_product_id_id_e22b092e_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `website_bidder_user_name_id_45020ab5_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_product`
--
ALTER TABLE `website_product`
  ADD CONSTRAINT `website_product_winner_id_e5cfa633_fk_auth_user_id` FOREIGN KEY (`winner_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `website_seller`
--
ALTER TABLE `website_seller`
  ADD CONSTRAINT `website_seller_product_id_id_c5e10e60_fk_website_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `website_product` (`id`),
  ADD CONSTRAINT `website_seller_user_name_id_3d7553cc_fk_auth_user_id` FOREIGN KEY (`user_name_id`) REFERENCES `auth_user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

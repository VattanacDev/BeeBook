-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 18, 2017 at 04:13 AM
-- Server version: 5.7.14
-- PHP Version: 7.0.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `beebook`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `_con_id` int(10) UNSIGNED NOT NULL,
  `_con_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_kh_name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_phone` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_mail` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_web` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_latlng` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_cate` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_desc` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `_con_status` tinyint(1) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`_con_id`, `_con_name`, `_con_kh_name`, `_con_phone`, `_con_mail`, `_con_web`, `_con_latlng`, `_con_type`, `_con_cate`, `_con_desc`, `_con_status`) VALUES
(1, 'National Pediatric Hospital', 'មន្ទីរពេទ្យ​កុមារ​ជាតិ', '023884137', '', '', '11.568569, 104.896911', 'Emergency', 'Hospital', '', 1),
(2, 'Calmette Hospital', 'មន្ទីរពេទ្យ កាល់ម៉ែត្រ', '012772789', '', 'calmette.gov.kh', '11.581303, 104.915902', '', 'Hospital', '', 1),
(3, 'Ang Duong Hospital', 'មន្ទីរពេទ្យព្រះអង្គដួង', '023218867', '', '', '11.571764, 104.923002', '', 'Hospital', '', 1),
(4, 'Preah Ket Mealea Hospital', 'មន្ទីរពេទ្យព្រះកេតុមាលា', '023722246', '', 'pkmh.org', '11.579579, 104.921724', '', 'Hospital', '', 1),
(5, 'Khmer Soviet Friendship Hospital', 'មន្ទីរពេទ្យមិត្តភាពខ្មែរ សូវៀត', '023217524', '', 'khsoviethospital.com', '11.544528, 104.904521', '', 'Hospital', '', 1),
(6, 'Preah Kossamak Hospital', 'មន្ទីរពេទ្យព្រះកុសមៈ', '023883047', '', '', '11.563967, 104.890460', '', 'Hospital', '', 1),
(7, 'Royal Phnom Penh Hospital', 'មន្ទីរពេទ្យរ៉ូយ៉ាល់ភ្នំពេញ', '023991000', '', 'royalphnompenhhospital.com', '11.562542, 104.880668', '', 'Hospital', '', 1),
(8, 'Kantha Bopha I Children\'s Hospital', 'មន្ទីរពេទ្យ គន្ធបប្ផាទី១', '023428009', '', '', '11.578594, 104.920713', '', 'Hospital', '', 1),
(9, 'Kantha Bopha IV Children\'s Hospital', 'មន្ទីរពេទ្យ គន្ធបប្ផាទី៤', '023428009', '', '', '11.578256, 104.920961', '', 'Hospital', '', 1),
(10, 'Sihanouk Hospital Center of Hope', 'មន្ទីរពេទ្យ ព្រះសីហនុ មជ្ឈមណ្ឌល​នៃ​ក្តីសង្ឃឹម', '023882484', '', 'sihosp.org', '11.567445, 104.912054', '', 'Hospital', '', 1),
(11, 'Central Hospital', 'មន្ទីរពេទ្យ សង់ត្រាល់', '023214955', '', 'central-hospital.com', '11.566864, 104.922658', '', 'Hospital', '', 1),
(12, 'Smart Axiata Co.,Ltd', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តស្មាត', '010201260', '', 'smart.com.kh', '11.537614, 104.923593', '', 'Telecom', '', 1),
(13, 'Cellcard HeadOffice', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តសែលខាត', '012812812', '', 'cellcard.com.kh', '11.556259, 104.925082', '', 'Telecom', '', 1),
(14, 'Metfone Headquarter', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តមិតហ្វូន', '0979097097', '', 'metfone.com.kh', '11.550252, 104.904416', '', 'Telecom', '', 1),
(15, 'CooTel', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តខូថែល', '0387701966', '', 'cootel.com.kh', '11.565211, 104.911297', '', 'Telecom', '', 1),
(16, 'QB ', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តខ្យូប', '013300300', '', 'qbmore.com', '11.530841, 104.925357', '', 'Telecom', '', 1),
(17, 'Seatel\'s HQ', 'ក្រុមហ៊ុនទូរស័ព្ទចល័តស៊ីថែល', '0189800800', '', 'seatelgroup.com', '11.541988, 104.921352', '', 'Telecom', '', 1),
(18, 'Fire Fighter ', 'អ្នកពន្លត់អគ្គីភ័យ', '023212808', '', '', '11.547849, 104.918342', '', 'Police', '', 1),
(19, 'Phnom Penh Traffic Police', 'ប៉ុស្តប៉ូលីសចរាចរណ៏', '012855706', '', '', '11.620669, 104.888588', '', 'Police', '', 1),
(20, 'Traffic Police', 'ប៉ូលីសចរាចរណ៏', '012942484', '', '', '11.620985, 104.889028', '', 'Police', '', 1),
(21, 'Police Khan Toul Kork', 'ប៉ូលីសខណ្ឌទូលគោក', '012232425', '', 'police.gov.kh', '11.555067, 104.895441', '', 'Police', '', 1),
(22, 'Police Khan Po Sen Chey', 'ប៉ូលីសខណ្ឌពោធិ៍សែនជ័យ', '012325555', '', '', '11.564204, 104.886394', '', 'Police', '', 1),
(23, 'Ministry of Interior', 'ក្រសួង​មហាផ្ទៃ', '023721190', '', 'www.interior.gov.kh', '11.537215, 104.926842', '', 'Police', '', 1),
(24, 'ABC Cambodia 107.5 FM Radio Station', 'ស្ថានីយ៍វិទ្យុអេប៊ីស៊ី', '012231010', '', 'abccambodia.com', '11.455109, 104.909803', '', 'Social Contact', '', 1),
(25, 'TVFacebook', 'សារព័ត៌មានធីវីហ្វេសប៊ុក', '0968456670', '', 'www.tvfb.news', '11.543004, 104.870754', '', 'Social Contact', '', 1),
(26, 'Koh Santepheap Daily', 'សារព័ត៌មានកោះសន្តិភាព', '023987118', '', 'kohsantepheapdaily.com.kh', '11.537802, 104.910334', '', 'Social Contact', '', 1),
(27, 'The Phnom Penh Post', 'សារព័ត៌មានភ្នំពេញ ប៉ុស្ត៏', '023214311', '', 'phnompenhpost.com', '11.552867, 104.933613', '', 'Social Contact', '', 1),
(28, 'Fresh News', 'សារព័ត៌មាន ហ្វ្រេស ញ៊ូស', '017608006', '', 'freshnewsasia.com', '11.563550, 104.911349', '', 'Social Contact', '', 1),
(32, 'Sabay News', 'សារព័ត៌មានសប្បាយ', '0968456670', '', 'news.sabay.com.kh', '11.558068, 104.920561', '', 'Social Contact', '', 1),
(33, 'Hang Meas Radio and HDTV Station', 'ហង្សមាសពត៌មាន', '077900937', '', 'www.hangmeasdaily.com', '11.508353, 104.992758', '', 'Social Contact', '', 1),
(34, 'Cambodian Television Network', 'ស្ថានីយ៍ទូរទស្សន៍ ស៊ីធីអិន', '012999434', '', 'www.ctn.com.kh/en/', '11.616665, 104.915363', '', 'Social Contact', '', 1),
(35, 'BTV NEWs', 'ស្ថានីយ៍ទូរទស្សន៍ បាយយ័នព៌ត៍មាន', '086268214', '', 'www.facebook.com/BTVCambodia', '11.537535, 104.883960', '', 'Social Contact', '', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`_con_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `_con_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

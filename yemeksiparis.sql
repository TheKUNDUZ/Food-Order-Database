-- phpMyAdmin SQL Dump

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+03:00";

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `yemeksiparis`
--

-- --------------------------------------------------------

--
-- Tablo: `kategoriler`
--
CREATE TABLE `kategoriler` (
  `kategori_id` INT NOT NULL AUTO_INCREMENT,
  `kategori_adi` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`kategori_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`) VALUES
(1, 'Tatlılar'),
(2, 'Çorbalar'),
(3, 'İçecekler'),
(4, 'Ana Yemekler'),
(5, 'Ara Sıcaklar'),
(6, 'Salatalar');

-- --------------------------------------------------------

--
-- Tablo: `kullanicilar`
--
CREATE TABLE `kullanicilar` (
  `kullanici_id` INT NOT NULL AUTO_INCREMENT,
  `kullanici_adi` VARCHAR(50) NOT NULL,
  `kullanici_soyad` VARCHAR(50) NOT NULL,
  `dogum_tarihi` DATE NOT NULL,
  `kullanici_tel` VARCHAR(15) NOT NULL,
  `kullanici_adres` TEXT NOT NULL,
  PRIMARY KEY (`kullanici_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `kullanicilar` (`kullanici_id`, `kullanici_adi`, `kullanici_soyad`, `dogum_tarihi`, `kullanici_tel`, `kullanici_adres`) VALUES
(1, 'Emir', 'Kadal', '2003-05-23', '05370124846', 'Hekimbaşı mahallesi Hanlı caddesi İtibar sokak no:28 daire:6 ümraniye/istanbul'),
(2, 'Ahmet', 'Şahin', '2001-06-19', '05521923896', 'Camikebir mahallesi 756. sokak no-22 çiçek apartmanı daire-5 bağcılar/istanbul'),
(3, 'Ayşe', 'Şaşmaz', '1998-05-09', '05389735971', '19 Mayıs caddesi cennet sokak no-30 korkmaz apartmanı daire-3 Ataşehir/İstanbul'),
(4, 'Muhammet Ali', 'Kunduz', '2001-06-29', '05525083834', 'Kemer mahallesi 925. sokak no-24 daire-2 Atışalanı Esenler/İstanbul'),
(5, 'Yusuf', 'Taş', '2002-01-10', '05394625436', 'İmam Hatip Caddesi Kıyı sokak no-2 daire-19 Kadıköy/İstanbul'),
(6, 'Elif', 'Eylül', '1980-10-03', '05346827613', 'Kızılay Caddesi Örgü sokak no-17 daire-6 Ümraniye/İstanbul');

-- --------------------------------------------------------

--
-- Tablo: `odemeler`
--
CREATE TABLE `odemeler` (
  `odeme_id` INT NOT NULL AUTO_INCREMENT,
  `odeme_yontemi` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`odeme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `odemeler` (`odeme_id`, `odeme_yontemi`) VALUES
(1, 'Nakit'),
(2, 'Banka Kartı/Kredi Kartı'),
(3, 'Yemek Kartı'),
(4, 'Online Ödeme');

-- --------------------------------------------------------

--
-- Tablo: `restoranlar`
--
CREATE TABLE `restoranlar` (
  `restoran_id` INT NOT NULL AUTO_INCREMENT,
  `restoran_adi` VARCHAR(100) NOT NULL,
  `restoran_tel` VARCHAR(50) NOT NULL,
  `restoran_aciklama` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`restoran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `restoranlar` (`restoran_id`, `restoran_adi`, `restoran_tel`, `restoran_aciklama`) VALUES
(1, 'Boston Drink & Dessert', '5156616578', '"Boston Drink & Dessert; bir çikolata dükkanıdır. Üzerine çikolata dökülen tatlıyı ve bunların yanına yakışacak içecekleri sunar."'),
(2, 'Black Burger Pizza', '2167858984', 'İstanbulda eşsiz hamburger lezzetleri sunan bir restorant.'),
(3, 'Güneş Kahvaltı Evi', '05325739114', 'Boğaz manzarası eşliğinde serpme kahvaltı uygun fiyata.'),
(4, 'Mogaf Hatay Döner', '02125150002', 'Eşsiz ve rakipsiz hatay döneriyle hizmet veren bir restorant'),
(5, 'Çiğ Köfteci Sait', '05435253444', 'Farkımız Damak tadında Vazgecilmez Çiğköfte Markası Olmak');

-- --------------------------------------------------------

--
-- Tablo: `urunler`
--
CREATE TABLE `urunler` (
  `urun_id` INT NOT NULL AUTO_INCREMENT,
  `urun_adi` VARCHAR(100) NOT NULL,
  `kategori_id` INT NOT NULL,
  `restoran_id` INT NOT NULL,
  `urun_fiyati` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`urun_id`),
  FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  FOREIGN KEY (`restoran_id`) REFERENCES `restoranlar` (`restoran_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `urunler` (`urun_id`, `urun_adi`, `kategori_id`, `restoran_id`, `urun_fiyati`) VALUES
(1, 'İsveç Çikolatası', 1, 1, 145.00),
(2, 'Patates Kızartması', 5, 3, 135.00),
(3, 'Mercimek Çorbası', 2, 4, 85.00),
(4, 'Hatay Zurna Dürüm', 4, 4, 110.00),
(5, 'Şalgam', 3, 5, 25.00),
(6, 'Big king Menü', 4, 2, 155.00),
(7, 'Çoban Salatası', 6, 4, 40.00),
(8, 'Tulumba', 1, 1, 50.00);

-- --------------------------------------------------------

--
-- Tablo: `siparisler`
--
CREATE TABLE `siparisler` (
  `siparis_id` INT NOT NULL AUTO_INCREMENT,
  `kullanici_id` INT NOT NULL,
  `siparis_tarihi` DATETIME NOT NULL,
  `odeme_id` INT NOT NULL,
  `toplam_tutar` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`siparis_id`),
  FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`kullanici_id`),
  FOREIGN KEY (`odeme_id`) REFERENCES `odemeler` (`odeme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

--
INSERT INTO `siparisler` (`siparis_id`, `kullanici_id`, `siparis_tarihi`, `odeme_id`, `toplam_tutar`) VALUES
(1, 1, '2024-01-19 12:30:00', 2, 270.00),
(2, 4, '2024-01-13 14:15:00', 1, 330.00),
(3, 3, '2024-01-23 18:45:00', 3, 170.00),
(4, 6, '2024-01-17 19:20:00', 4, 40.00),
(5, 5, '2024-01-23 20:00:00', 1, 250.00),
(6, 2, '2024-01-10 13:00:00', 2, 155.00);

-- --------------------------------------------------------

--
-- Tablo: `siparis_detaylari`
--
CREATE TABLE `siparis_detaylari` (
  `siparis_detay_id` INT NOT NULL AUTO_INCREMENT,
  `siparis_id` INT NOT NULL,
  `urun_id` INT NOT NULL,
  `adet` INT NOT NULL,
  `birim_fiyat` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`siparis_detay_id`),
  FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`),
  FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_turkish_ci;

INSERT INTO `siparis_detaylari` (`siparis_detay_id`, `siparis_id`, `urun_id`, `adet`, `birim_fiyat`) VALUES
(1, 1, 2, 2, 135.00),
(2, 2, 4, 3, 110.00),
(3, 3, 3, 2, 85.00),
(4, 4, 7, 1, 40.00),
(5, 5, 8, 5, 50.00),
(6, 6, 6, 1, 155.00);

-- --------------------------------------------------------

--
-- Görünüm (VIEW): `siparis_iletisim_bilgileri`
--
CREATE VIEW `siparis_iletisim_bilgileri` AS
SELECT 
    s.siparis_id,
    k.kullanici_tel,
    r.restoran_tel,
    r.restoran_adi
FROM 
    siparisler s
JOIN 
    kullanicilar k ON s.kullanici_id = k.kullanici_id
JOIN 
    siparis_detaylari sd ON s.siparis_id = sd.siparis_id
JOIN 
    urunler u ON sd.urun_id = u.urun_id
JOIN 
    restoranlar r ON u.restoran_id = r.restoran_id
GROUP BY 
    s.siparis_id, k.kullanici_tel, r.restoran_tel, r.restoran_adi;

COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

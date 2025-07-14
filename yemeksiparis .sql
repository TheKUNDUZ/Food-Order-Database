-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3308
-- Üretim Zamanı: 13 Oca 2024, 23:21:02
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `yemeksiparis`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(100) NOT NULL,
  `kategori_adi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`) VALUES
(1, 'Tatlılar'),
(2, 'Çorbalar'),
(3, 'İçecekler'),
(4, 'Ana Yemekler'),
(5, 'Ara Sıcaklar'),
(6, 'Salatalar');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanicilar`
--

CREATE TABLE `kullanicilar` (
  `Kullanici_id` int(11) NOT NULL,
  `Kullanici_adi` varchar(50) NOT NULL,
  `kullanici_soyad` varchar(50) NOT NULL,
  `dogum_tarihi` date NOT NULL,
  `kullanici_tel` varchar(15) NOT NULL,
  `kullanici_adres` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `kullanicilar`
--

INSERT INTO `kullanicilar` (`Kullanici_id`, `Kullanici_adi`, `kullanici_soyad`, `dogum_tarihi`, `kullanici_tel`, `kullanici_adres`) VALUES
(1, 'Emir', 'Kadal', '2003-05-23', '05370124846', 'Hekimbaşı mahallesi Hanlı caddesi İtibar sokak no:28 daire:6 ümraniye/istanbul'),
(2, 'Ahmet', 'Şahin', '2001-06-19', '05521923896', 'Camikebir mahallesi 756. sokak no-22 çiçek apartmanı daire-5 bağcılar/istanbul'),
(3, 'Ayşe', 'Şaşmaz', '1998-05-09', '05389735971', '19 Mayıs caddesi cennet sokak no-30 korkmaz apartmanı daire-3 Ataşehir/İstanbul'),
(4, 'Muhammet Ali', 'Kunduz', '2001-06-29', '05525083834', 'Kemer mahallesi 925. sokak no-24 daire-2 Atışalanı Esenler/İstanbul'),
(5, 'Yusuf', 'Taş', '2002-01-10', '05394625436', 'İmam Hatip Caddesi Kıyı sokak no-2 daire-19 Kadıköy/İstanbul'),
(6, 'Elif', 'Eylül', '1980-10-03', '05346827613', 'Kızılay Caddesi Örgü sokak no-17 daire-6 Ümraniye/İstanbul');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `odeme_table`
--

CREATE TABLE `odeme_table` (
  `odeme_id` int(11) NOT NULL,
  `odem_yontemi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `odeme_table`
--

INSERT INTO `odeme_table` (`odeme_id`, `odem_yontemi`) VALUES
(1, 'Nakit'),
(2, 'Banka Kartı/Kredi Kartı'),
(3, 'Yemek Kartı'),
(4, 'Online Ödeme');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `restorantlar`
--

CREATE TABLE `restorantlar` (
  `restorant_id` int(11) NOT NULL,
  `restorant_adi` varchar(100) NOT NULL,
  `restorant_tel` varchar(50) NOT NULL,
  `restorant_aciklama` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `restorantlar`
--

INSERT INTO `restorantlar` (`restorant_id`, `restorant_adi`, `restorant_tel`, `restorant_aciklama`) VALUES
(1, 'Boston Drink & Dessert', '5156616578', '\"Boston Drink & Dessert; bir çikolata dükkanıdır. Üzerine çikolata dökülen tatlıyı ve bunların yanına yakışacak içecekleri sunar.\"'),
(2, 'Black Burger Pizza', '2167858984', 'İstanbulda eşsiz hamburger lezzetleri sunan bir restorant.'),
(3, 'Güneş Kahvaltı Evi', '05325739114', 'Boğaz manzarası eşliğinde serpme kahvaltı uygun fiyata.'),
(4, 'Mogaf Hatay Döner', '02125150002', 'Eşsiz ve rakipsiz hatay döneriyle hizmet veren bir restorant'),
(5, 'Çiğ Köfteci Sait', '05435253444', 'Farkımız Damak tadında Vazgecilmez Çiğköfte Markası Olmak');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `siparis_id` int(11) NOT NULL,
  `urun_id` int(11) NOT NULL,
  `adet` int(11) NOT NULL,
  `kullanici_id` int(11) NOT NULL,
  `siparis_tarihi` date NOT NULL,
  `odeme_id` int(11) NOT NULL,
  `siparis_tutari` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `urun_id`, `adet`, `kullanici_id`, `siparis_tarihi`, `odeme_id`, `siparis_tutari`) VALUES
(1, 2, 2, 1, '2024-01-19', 2, 270),
(2, 4, 3, 4, '2024-01-13', 1, 330),
(3, 3, 2, 3, '2024-01-23', 3, 170),
(4, 7, 1, 6, '2024-01-17', 4, 40),
(5, 8, 5, 5, '2024-01-23', 1, 250),
(6, 6, 1, 2, '2024-01-10', 2, 155);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(11) NOT NULL,
  `Urun_adı` varchar(100) NOT NULL,
  `kategori_id` int(11) NOT NULL,
  `restorant_id` int(11) NOT NULL,
  `urun_fiyat` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `Urun_adı`, `kategori_id`, `restorant_id`, `urun_fiyat`) VALUES
(1, 'İsveç Çikolatası', 1, 1, 145),
(2, 'Patates Kızartması', 5, 3, 135),
(3, 'Mercimek Çorbası', 2, 4, 85),
(4, 'Hatay Zurna Dürüm', 4, 4, 110),
(5, 'Şalgam', 3, 5, 25),
(6, 'Big king Menü', 4, 2, 155),
(7, 'Çoban Salatası', 6, 4, 40),
(8, 'Tulumba', 1, 1, 50);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yetkililer`
--

CREATE TABLE `yetkililer` (
  `siparis_bilgi_id` int(11) NOT NULL,
  `restorant_tel` varchar(20) NOT NULL,
  `siparis_id` int(11) NOT NULL,
  `kullanici_tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_turkish_ci;

--
-- Tablo döküm verisi `yetkililer`
--

INSERT INTO `yetkililer` (`siparis_bilgi_id`, `restorant_tel`, `siparis_id`, `kullanici_tel`) VALUES
(1, '02125150002', 3, '05389735971'),
(2, '02125150002', 2, '05525083834'),
(3, '05156616578', 5, '05394625436'),
(4, '02125150002', 4, '05346827613');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`),
  ADD KEY `kategori_id` (`kategori_id`,`kategori_adi`);

--
-- Tablo için indeksler `kullanicilar`
--
ALTER TABLE `kullanicilar`
  ADD PRIMARY KEY (`Kullanici_id`),
  ADD KEY `Kullanici_id` (`Kullanici_id`),
  ADD KEY `Kullanici_id_2` (`Kullanici_id`);

--
-- Tablo için indeksler `odeme_table`
--
ALTER TABLE `odeme_table`
  ADD PRIMARY KEY (`odeme_id`),
  ADD KEY `odeme_id` (`odeme_id`,`odem_yontemi`);

--
-- Tablo için indeksler `restorantlar`
--
ALTER TABLE `restorantlar`
  ADD PRIMARY KEY (`restorant_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`siparis_id`),
  ADD KEY `kullanici_id` (`kullanici_id`),
  ADD KEY `urun_id` (`urun_id`),
  ADD KEY `siparis_id` (`siparis_id`,`urun_id`,`kullanici_id`,`siparis_tarihi`),
  ADD KEY `odeme_id` (`odeme_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`),
  ADD KEY `urun_id` (`urun_id`),
  ADD KEY `urun_id_2` (`urun_id`,`kategori_id`,`restorant_id`),
  ADD KEY `restorant_id` (`restorant_id`),
  ADD KEY `kategori_id` (`kategori_id`);

--
-- Tablo için indeksler `yetkililer`
--
ALTER TABLE `yetkililer`
  ADD PRIMARY KEY (`siparis_bilgi_id`),
  ADD KEY `restorant_id` (`restorant_tel`),
  ADD KEY `yetkili_id` (`siparis_bilgi_id`,`restorant_tel`,`siparis_id`,`kullanici_tel`),
  ADD KEY `siparis_id` (`siparis_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `kullanicilar`
--
ALTER TABLE `kullanicilar`
  MODIFY `Kullanici_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `odeme_table`
--
ALTER TABLE `odeme_table`
  MODIFY `odeme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Tablo için AUTO_INCREMENT değeri `restorantlar`
--
ALTER TABLE `restorantlar`
  MODIFY `restorant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `siparis_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `yetkililer`
--
ALTER TABLE `yetkililer`
  MODIFY `siparis_bilgi_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`kullanici_id`) REFERENCES `kullanicilar` (`Kullanici_id`),
  ADD CONSTRAINT `siparisler_ibfk_2` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`),
  ADD CONSTRAINT `siparisler_ibfk_3` FOREIGN KEY (`odeme_id`) REFERENCES `odeme_table` (`odeme_id`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`restorant_id`) REFERENCES `restorantlar` (`restorant_id`),
  ADD CONSTRAINT `urunler_ibfk_2` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`);

--
-- Tablo kısıtlamaları `yetkililer`
--
ALTER TABLE `yetkililer`
  ADD CONSTRAINT `yetkililer_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

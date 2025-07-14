			Yemek Siparişi Veritabanı Projesi

Ilişkilerin görsel hali database.png adlı dosyadır.
Tablolar ve ilişkiler:


Kullanıcılar:
Öznitelikler: kullanıcı_id (PK),  kullanıcı_adı , kullanıcı_soyadı,  kullanıcı_tel,  dogum_tarihi, kullanici_adres 
	
Restorantlar:
Öznitelikler:  restorant_id (PK), restoran_adı, restoran_tel, restoran_açıklama 

Sipariş:
Öznitelikler: siparis_id (PK),  kullanici_id , urun_id (FK) , adet , sipariş_tarihi , odeme_id  (FK), sipariş_tutari 

Kategoriler:
Öznitelikler: kategori_id (PK), kategori_adi 

Urunler:
Öznitelikler: urun_id(PK) , urun_adı , kategori_id (FK) , restoran_id (FK) , urun_fiyati  

Odeme_table:
Öznitelikler: odeme_id (PK), odeme_yontemi 

Yetkililer:
Öznitelikler:  sipariş_bilgi_id (PK), restoran_tel , sipariş_id (FK), kullanici _tel 

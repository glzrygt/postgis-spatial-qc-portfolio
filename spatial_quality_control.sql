-- PostgreSQL / PostGIS ile Mekansal Veri Kalite Kontrolü (QC) ve Analiz

--verilerin geometrik doğruluğu ve temizlenmesi
SELECT id, name, ST_IsValidReason(geom) as geometri_durumu
FROM poi_veri
WHERE NOT ST_IsValid(geom);

UPDATE poi_veri
SET geom = ST_MakeValid(geom)
WHERE NOT ST_IsValid(geom);

--veri kalite kontrolü (QC), eksik ve tekrarlayan kayıtlar
SELECT id, category, 'İsim bilgisi eksik' as hata_tipi
FROM poi_veri
WHERE name IS NULL OR TRIM(name) = '';

SELECT a.id AS id_1, b.id AS id_2, 'Tekrarlayan POI' AS hata_tipi
FROM poi_veri a, poi_veri b
WHERE a.id < b.id 
  AND ST_DWithin(a.geom::geography, b.geom::geography, 1.0);

--mekansal analizler ve raporlama
SELECT p.id, p.name, ST_Distance(p.geom::geography, r.geom::geography) AS mesafe_metre
FROM poi_veri p, ana_yollar r
WHERE r.yol_adi = 'Ankara Bulvari' 
  AND ST_DWithin(p.geom::geography, r.geom::geography, 500.0);

SELECT ilce_adi, COUNT(p.id) AS toplam_poi_sayisi
FROM ilce_sinirlari i
LEFT JOIN poi_veri p ON ST_Contains(i.geom, p.geom)
GROUP BY ilce_adi
ORDER BY toplam_poi_sayisi DESC;
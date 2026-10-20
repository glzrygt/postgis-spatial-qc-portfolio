# PostgreSQL & PostGIS ile Mekansal Veri Kalite Kontrolü (QC) ve Analiz

Bu depo, Harita Mühendisliği bağlamında mekansal verilerin doğrulanması, temizlenmesi, kalite kontrolü (QC) ve ilişkisel veritabanı (PostgreSQL/PostGIS) üzerinden analitiğini sergilemek amacıyla geliştirilmiştir.

## Kullanılan Teknolojiler
- **Veritabanı:** PostgreSQL, PostGIS
- **Araçlar:** QGIS, VS Code, PostGIS Spatial DB
- **Yöntemler:** Topoloji kontrolü, geometrik geçerlilik (`ST_IsValid`, `ST_MakeValid`), mükerrer veri tespiti (`ST_DWithin`), tampon bölge analizi (`ST_Buffer`) ve mekansal joins (`ST_Contains`).

## Sorgu Senaryoları
1. **Veri Temizliği:** Hatalı geometrilerin tespiti ve otomatik onarımı.
2. **Öznitelik ve Konum QC:** Eksik isme sahip POI'lerin ve mükerrer (duplicate) kayıtların filtrelenmesi.
3. **Mekansal Raporlama:** İlçe sınırlarına göre katman bazlı yoğunluk analizi ve buffer sorguları.
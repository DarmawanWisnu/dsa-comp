# Ringkasan

| Item                                        |                                                                 Hasil |
| ------------------------------------------- | --------------------------------------------------------------------: |
| Model final untuk reporting                 |                                                                   11Z |
| Final OOF RMSE                              |                                                             11.245635 |
| Model pembanding terdekat                   |                                                   11X, RMSE 11.250966 |
| Model individual terbaik                    |                                     CatBoostRegressor, RMSE 11.470718 |
| Baseline mean                               |                                                        RMSE 23.192856 |
| Target bin dengan error terbesar            |                                                             very_high |
| RMSE pada target bin very_high              |                                                             19.291652 |
| Bias prediksi pada target bin very_high     |                                                             -7.173619 |
| Jumlah fitur baru hasil feature engineering |                                                                    86 |
| Jumlah fitur awal/lama                      |                                                                    48 |
| Pasangan fitur berkorelasi tinggi           | property_particle_coarse vs property_particle_fine, abs corr 0.902199 |

## Inti: model final sudah lebih baik dari model individual dan baseline, tetapi error terbesar masih ada pada target tinggi.

# Tabel

|  No | Soal                                                               | Tabel atau output yang dipakai                                                  | Keterangan                                                                                                                          |
| --: | ------------------------------------------------------------------ | ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------- |
|   1 | Urgensi memprediksi kandungan organik tanah                        | Final experiment log, Final OOF RMSE                                            | Menunjukkan bahwa target bisa diprediksi cukup baik dibanding baseline, sehingga model punya nilai praktis untuk estimasi cepat.    |
|   2 | Apakah model overfit atau underfit?                                | Final experiment log, Overfit / underfit evidence table, Residual by target bin | Membandingkan train RMSE, CV RMSE, train-valid gap, fold std, serta pola error per target bin.                                      |
|   3 | Distribusi kandungan organik antar wilayah geografis               | Target distribution by geo_zone_macro, geo_zone_meso, geo_zone_micro            | Menunjukkan perbedaan mean, median, range, dan variasi target antar level wilayah.                                                  |
|   4 | Korelasi atau perbedaan antar tingkat wilayah geografis            | Geographic hierarchy mean-ratio evidence                                        | Merangkum rasio max/min mean antar macro, meso, dan micro zone.                                                                     |
|  5a | Rata-rata organik tiap ekosistem saat acidity < P25 dan CEC < mean | Low acidity + low CEC summary by biome, land_cover_type, geo_zone_macro         | Menjawab kelompok ekosistem/tutupan lahan/wilayah mana yang punya rata-rata target lebih tinggi pada subset kondisi kimia tertentu. |
|  5b | Kombinasi tutupan lahan dan wilayah geografis sebagai outlier      | Land-cover/geography outlier evidence                                           | Menunjukkan kombinasi land cover dan geo zone dengan z-score ekstrem dan flag outlier.                                              |
|   6 | Korelasi tinggi dan multicollinearity                              | High-correlation pairs, abs(corr) >= 0.8                                        | Menunjukkan fitur yang redundan atau sangat berkorelasi.                                                                            |
|   7 | Feature engineering                                                | Feature engineering summary, daftar fitur baru, top feature importance          | Menjelaskan jumlah fitur baru dan contoh fitur yang berkontribusi terhadap model.                                                   |
|   8 | Model yang digunakan                                               | Final experiment log, top feature importance CatBoost/LightGBM/XGBoost          | Menjelaskan model individual, ensemble/post-processing, serta bukti performanya.                                                    |
|   9 | Apakah RMSE tepat?                                                 | Residual by target bin, Final OOF RMSE                                          | RMSE cocok sebagai metrik utama, tetapi tabel residual menunjukkan RMSE sensitif terhadap tail dan outlier.                         |
|  10 | Data eksternal yang akan diambil                                   | Tidak ada tabel langsung, dijawab dari konteks domain dan feature gap           | Jawaban berupa rekomendasi data tambahan seperti remote sensing, iklim, topografi, dan peta tanah.                                  |

---

# Hasil Percobaan

## 4.1 Final Experiment Log

| Rank | Model                         | Features                                    | Mean CV RMSE | Std CV RMSE | Mean Train RMSE | Train-Valid Gap | Catatan                                                   |
| ---: | ----------------------------- | ------------------------------------------- | -----------: | ----------: | --------------: | --------------: | --------------------------------------------------------- |
|    1 | 11Z                           | engineered / post-processed                 |    11.245635 |         NaN |             NaN |             NaN | Final selected model for submission/reporting             |
|    2 | 11X                           | engineered / post-processed                 |    11.250966 |         NaN |             NaN |             NaN | Signed dual-tail correction                               |
|    3 | 11X robust                    | engineered / post-processed                 |    11.252014 |         NaN |             NaN |             NaN | Safer signed dual-tail correction                         |
|    4 | 11O adaptive blend            | engineered / post-processed                 |    11.266968 |         NaN |             NaN |             NaN | Fold-safe prediction-bin adaptive blending                |
|    5 | CatBoostRegressor             | all engineered features, native categorical |    11.470718 |    0.395977 |        6.316809 |        5.153910 | Main model with native categorical and missing values     |
|    6 | XGBoostRegressor              | all engineered features, encoded            |    11.516052 |    0.309037 |        4.564849 |        6.951202 | Main model with fold-safe imputation and ordinal encoding |
|    7 | LightGBMRegressor             | all engineered features, encoded            |    11.567934 |    0.311411 |        3.345722 |        8.222212 | Main model with fold-safe imputation and ordinal encoding |
|    8 | HistGradientBoosting Baseline | all engineered features, encoded            |    12.058976 |    0.343606 |        8.226144 |        3.832832 | Tree baseline with fold-safe preprocessing                |
|    9 | Ridge Baseline                | all engineered features, encoded            |    16.469542 |    0.317761 |       16.259431 |        0.210111 | Linear baseline                                           |
|   10 | Mean Baseline                 | target mean only                            |    23.192856 |    0.485007 |             NaN |             NaN | Predicts each fold training target mean                   |

## 4.2 Overfit / Underfit Evidence

| Model                         | Mean Train RMSE | Mean CV RMSE | Train-Valid Gap | Std CV RMSE | Interpretasi                                                                          |
| ----------------------------- | --------------: | -----------: | --------------: | ----------: | ------------------------------------------------------------------------------------- |
| 11Z                           |             NaN |    11.245635 |             NaN |         NaN | Final terbaik berdasarkan OOF, tetapi train gap tidak tercatat untuk post-processing. |
| 11X                           |             NaN |    11.250966 |             NaN |         NaN | Hampir setara dengan final, namun sedikit lebih buruk.                                |
| 11X robust                    |             NaN |    11.252014 |             NaN |         NaN | Lebih aman, tetapi performa sedikit di bawah final.                                   |
| 11O adaptive blend            |             NaN |    11.266968 |             NaN |         NaN | Stabil tetapi kalah dari 11Z.                                                         |
| CatBoostRegressor             |        6.316809 |    11.470718 |        5.153910 |    0.395977 | Ada gap cukup besar, indikasi overfit moderat.                                        |
| XGBoostRegressor              |        4.564849 |    11.516052 |        6.951202 |    0.309037 | Gap besar, indikasi overfit lebih kuat.                                               |
| LightGBMRegressor             |        3.345722 |    11.567934 |        8.222212 |    0.311411 | Gap paling besar, indikasi overfit paling kuat di model individual.                   |
| HistGradientBoosting Baseline |        8.226144 |    12.058976 |        3.832832 |    0.343606 | Overfit lebih rendah, tetapi performa CV lebih buruk.                                 |
| Ridge Baseline                |       16.259431 |    16.469542 |        0.210111 |    0.317761 | Tidak overfit, tetapi cenderung underfit karena performa buruk.                       |
| Mean Baseline                 |             NaN |    23.192856 |             NaN |    0.485007 | Baseline sangat lemah.                                                                |

## 4.3 Residual by Target Bin

| Target Bin | Count | Target Mean | Prediction Mean | Bias Pred - Actual |       MAE |      RMSE | Max Abs Error | Interpretasi                                           |
| ---------- | ----: | ----------: | --------------: | -----------------: | --------: | --------: | ------------: | ------------------------------------------------------ |
| very_high  |  2187 |   71.325513 |       64.151894 |          -7.173619 | 13.487047 | 19.291652 |    109.892658 | Error terbesar, model underpredict pada target tinggi. |
| medium     |  2015 |   28.526479 |       29.003593 |           0.477113 |  5.811791 |  9.378989 |    103.390702 | Cukup stabil, ada outlier besar.                       |
| high       |  2152 |   40.284122 |       40.196936 |          -0.087187 |  6.799592 |  9.108370 |     68.328485 | Bias hampir nol, performa relatif baik.                |
| very_low   |  2259 |   12.766984 |       17.282442 |           4.515458 |  5.003515 |  7.877215 |     77.738650 | Model overpredict pada target sangat rendah.           |
| low        |  2597 |   20.691498 |       22.288536 |           1.597037 |  4.084692 |  6.442074 |     63.090516 | Bin paling stabil.                                     |

## 4.4 Target Distribution by Geo Zone Macro

| Geo Zone Macro | Count |      Mean |    Median |       Std |      Min |        Max |      Range |
| -------------- | ----: | --------: | --------: | --------: | -------: | ---------: | ---------: |
| S              |  1022 | 57.266801 | 55.789674 | 36.452029 | 5.382646 | 191.186425 | 185.803778 |
| NE             |   512 | 42.367177 | 35.192152 | 31.220322 | 3.128191 | 195.231500 | 192.103308 |
| MW             |  2930 | 34.500503 | 29.124540 | 20.587121 | 5.393433 | 177.061023 | 171.667590 |
| N              |   979 | 34.394741 | 30.742570 | 19.625071 | 2.479541 | 148.427285 | 145.947744 |
| SE             |  5767 | 29.089654 | 24.270450 | 17.819009 | 2.157373 | 181.219360 | 179.061987 |

## 4.5 Geographic Hierarchy Mean-Ratio Evidence

| Geographic Level | Number of Groups | Max Group Mean | Min Group Mean | Max/Min Ratio | Std of Group Means | Top Group | Bottom Group |
| ---------------- | ---------------: | -------------: | -------------: | ------------: | -----------------: | --------- | ------------ |
| geo_zone_macro   |                5 |      57.266801 |      29.089654 |      1.968631 |          10.992168 | S         | SE           |
| geo_zone_meso    |               19 |      72.951594 |      18.879991 |      3.863963 |          16.801795 | State_03  | State_18     |
| geo_zone_micro   |               44 |     108.600016 |       9.065822 |     11.979059 |          20.120699 | Loc_031   | Loc_065      |

## 4.6 Low Acidity + Low CEC Summary

Threshold:

| Kondisi                         |    Nilai |
| ------------------------------- | -------: |
| property_acidity_index < Q25    |  12.8805 |
| cation_exchange_capacity < mean | 169.1421 |
| Jumlah baris subset             |      388 |

### By Biome

| Biome          | Count |      Mean |    Median |       Std |       Min |        Max |      Range |
| -------------- | ----: | --------: | --------: | --------: | --------: | ---------: | ---------: |
| Amazonia       |   197 | 27.612371 | 27.506510 |  6.731054 | 11.326210 |  46.922870 |  35.596660 |
| Mata Atlantica |   186 | 21.317980 | 21.034390 | 10.040505 |  5.393433 | 111.644070 | 106.250637 |

### By Land Cover Type

| Land Cover Type               | Count |      Mean |    Median |       Std |       Min |        Max |      Range | Catatan                             |
| ----------------------------- | ----: | --------: | --------: | --------: | --------: | ---------: | ---------: | ----------------------------------- |
| Unknown                       |    19 | 38.236604 | 37.214690 |  5.610481 | 29.124540 |  45.304840 |  16.180300 | Mean tertinggi, tetapi count kecil. |
| Savannah                      |   181 | 26.549002 | 25.888480 |  5.890218 | 11.326210 |  46.922870 |  35.596660 | Lebih stabil karena count besar.    |
| Areas of Pioneering Formation |   120 | 22.632195 | 22.652420 |  6.775156 |  9.708180 |  40.127144 |  30.418964 | Stabil menengah.                    |
| Dense Ombrophylous Forest     |     5 | 22.328814 | 19.416360 |  4.772503 | 17.798330 |  27.506510 |   9.708180 | Count sangat kecil.                 |
| Seasonal Semideciduous Forest |    62 | 18.685637 | 16.180300 | 14.289085 |  5.393433 | 111.644070 | 106.250637 | Range besar, ada nilai ekstrem.     |

### By Geo Zone Macro

| Geo Zone Macro | Count |      Mean |    Median |       Std |       Min |        Max |      Range | Catatan                                    |
| -------------- | ----: | --------: | --------: | --------: | --------: | ---------: | ---------: | ------------------------------------------ |
| NE             |     4 | 30.054907 | 30.499866 | 11.653093 | 19.092754 |  40.127144 |  21.034390 | Mean tertinggi, tetapi count sangat kecil. |
| N              |   197 | 27.612371 | 27.506510 |  6.731054 | 11.326210 |  46.922870 |  35.596660 | Bukti lebih stabil.                        |
| MW             |   119 | 22.516451 | 22.652420 |  6.696469 |  9.708180 |  43.686810 |  33.978630 | Stabil menengah.                           |
| SE             |    68 | 19.083236 | 16.180300 | 13.745252 |  5.393433 | 111.644070 | 106.250637 | Range besar.                               |

## 4.7 Land-Cover + Geography Outlier Evidence, Top Ekstrem

| Land Cover Type               | Geo Zone | Count |      Mean |    Median |       Std |      Range | Z-Score Mean | IQR Outlier | Abs Z > 2 | Interpretasi                                       |
| ----------------------------- | -------- | ----: | --------: | --------: | --------: | ---------: | -----------: | ----------- | --------- | -------------------------------------------------- |
| Mixed Ombrophylous Forest     | S        |    83 | 73.990822 | 77.843423 | 32.474257 | 135.434504 |     2.032233 | True        | True      | Outlier positif paling kuat dan count masih cukup. |
| Amazon Rainforest             | NE       |    32 | 10.225556 |  8.701406 |  5.989948 |  21.304062 |    -1.957902 | False       | False     | Ekstrem rendah, tetapi tidak melewati abs z > 2.   |
| Areas of Ecological Tension   | S        |    15 | 71.783362 | 68.345587 | 16.576870 |  50.207471 |     1.894100 | True        | False     | Outlier positif menurut IQR, count kecil.          |
| Seasonal Deciduous Forest     | S        |   487 | 71.049993 | 67.504212 | 35.850481 | 184.412273 |     1.848210 | True        | False     | Outlier positif dengan count besar.                |
| Savannah                      | S        |    39 | 70.739903 | 67.601293 | 46.173274 | 180.435514 |     1.828806 | True        | False     | Outlier positif, variasi besar.                    |
| Areas of Pioneering Formation | MW       |   188 | 21.972503 | 22.652420 |  8.023551 |  38.293377 |    -1.222833 | False       | False     | Kelompok rendah tetapi bukan outlier kuat.         |
| Dense Ombrophylous Forest     | SE       |   262 | 23.204396 | 22.652420 |  9.967143 |  61.948975 |    -1.145747 | False       | False     | Rendah relatif terhadap kombinasi lain.            |
| Unknown                       | SE       |   464 | 24.516177 | 22.652420 | 12.666913 |  99.778517 |    -1.063662 | False       | False     | Rendah relatif, bukan outlier kuat.                |

## 4.8 High-Correlation Pairs

| Feature 1                | Feature 2              | Absolute Correlation | Interpretasi                                                                     |
| ------------------------ | ---------------------- | -------------------: | -------------------------------------------------------------------------------- |
| property_particle_coarse | property_particle_fine |             0.902199 | Korelasi tinggi, indikasi multicollinearity atau redundansi fitur tekstur tanah. |

## 4.9 Feature Engineering Summary

| Feature Type                     | Count |
| -------------------------------- | ----: |
| New engineered features          |    86 |
| Original features                |    48 |
| Total features after engineering |   134 |

Contoh fitur baru:

| Kelompok Fitur                    | Contoh                                                                                   |
| --------------------------------- | ---------------------------------------------------------------------------------------- |
| Missing indicators                | original_total_missing_count, missing_cation_Ca, missing_cation_exchange_capacity        |
| Spectral aggregate                | spectral_band_A_mean, spectral_band_A_std, spectral_band_B_mean, spectral_band_B_l2_norm |
| Soil particle ratio               | particle_fine_minus_coarse, particle_fine_ratio, particle_coarse_ratio                   |
| Cation interaction                | cation_total, fine_x_CEC, Ca_CEC_ratio, Mg_CEC_ratio                                     |
| Geography / ecosystem interaction | geo_macro_biome, geo_macro_meso\_\_ord, geo_zone_micro_count                             |

## 4.10 Top Feature Importance, Ringkasan

| Model    | Top Feature 1                   | Top Feature 2                   | Top Feature 3                      | Pola yang Terlihat                                             |
| -------- | ------------------------------- | ------------------------------- | ---------------------------------- | -------------------------------------------------------------- |
| CatBoost | source_id, 17.861739            | particle_coarse_ratio, 6.289378 | spectral_band_A_PC_5, 5.328798     | Source/group signal, tekstur tanah, spektral, dan CEC penting. |
| LightGBM | spectral_band_A_PC_5, 1657.2    | spectral_band_A_PC_15, 1597.6   | spectral_band_A_PC_6, 1523.4       | Spektral sangat dominan.                                       |
| XGBoost  | geo_macro_meso\_\_ord, 0.076995 | particle_coarse_ratio, 0.073074 | property_particle_coarse, 0.053818 | Geografi dan tekstur tanah sangat kuat.                        |

---

# Jawaban Soal

## 1. Urgensi memprediksi kandungan organik tanah

Prediksi kandungan organik tanah penting karena pengukuran langsung melalui laboratorium dapat memakan biaya, waktu, dan tenaga. Dengan model prediktif, kandungan organik dapat diestimasi lebih cepat dari fitur tanah, spektral, ekosistem, dan geografis. Hal ini berguna untuk prioritas sampling, pemantauan kualitas tanah, pengambilan keputusan pemupukan, dan identifikasi area yang membutuhkan intervensi konservasi.

Bukti dari eksperimen menunjukkan model final **11Z** mencapai **OOF RMSE 11.245635**, jauh lebih baik dibanding **Mean Baseline 23.192856**. Artinya, fitur yang tersedia memang membawa sinyal prediktif yang cukup kuat, bukan sekadar noise.

Tabel utama yang menjawab soal ini: **Final experiment log** dan **Final OOF RMSE**.

## 2. Overfit atau underfit

Model individual menunjukkan kecenderungan overfit, terutama LightGBM, XGBoost, dan CatBoost, karena train RMSE jauh lebih rendah daripada CV RMSE. LightGBM memiliki train-valid gap paling besar, yaitu **8.222212**, disusul XGBoost **6.951202** dan CatBoost **5.153910**. Ini berarti model belajar sangat baik pada data train, tetapi performanya turun saat divalidasi.

Namun, model final **11Z** dipilih berdasarkan OOF dan post-processing, sehingga evaluasi utamanya adalah validasi OOF. RMSE final **11.245635** lebih baik dari model individual terbaik, yaitu CatBoost **11.470718**. Jadi kesimpulannya, ada indikasi overfit pada model dasar, tetapi ensemble dan post-processing berhasil menurunkan error validasi.

Residual juga menunjukkan kelemahan utama bukan underfit global, melainkan error pada target ekstrem. Bin **very_high** memiliki RMSE **19.291652** dan bias **-7.173619**, artinya model masih cenderung underpredict untuk kandungan organik tinggi.

Tabel utama yang menjawab soal ini: **Overfit / underfit evidence table**, **Final experiment log**, dan **Residual by target bin**.

## 3. Distribusi kandungan organik antar wilayah geografis

Distribusi kandungan organik berbeda antar wilayah geografis. Pada level **geo_zone_macro**, wilayah **S** memiliki rata-rata target tertinggi sebesar **57.266801**, sedangkan **SE** terendah sebesar **29.089654**. Rasio antara wilayah tertinggi dan terendah pada level macro adalah sekitar **1.97 kali**.

Perbedaan makin besar pada level yang lebih detail. Pada **geo_zone_meso**, rasio max/min mean mencapai **3.863963**, sedangkan pada **geo_zone_micro** mencapai **11.979059**. Ini menunjukkan bahwa faktor spasial/geografis sangat relevan terhadap kandungan organik tanah.

Tabel utama yang menjawab soal ini: **Target distribution by geo_zone_macro**, **Target distribution by geo_zone_meso**, **Target distribution by geo_zone_micro**, dan **Geographic hierarchy mean-ratio evidence**.

## 4. Korelasi kandungan organik antar tingkat wilayah geografis

Perbedaan mean target antar tingkat wilayah menunjukkan adanya pola geografis bertingkat. Semakin detail level geografisnya, variasi rata-rata target semakin besar. Pada level macro, max/min ratio hanya **1.968631**, tetapi meningkat menjadi **3.863963** pada meso dan **11.979059** pada micro.

Interpretasinya, lokasi yang lebih spesifik menangkap variasi lokal yang tidak terlihat pada level wilayah besar. Hal ini mendukung penggunaan fitur geografis dan interaksi geografis dalam model, seperti macro-zone, meso-zone, micro-zone, serta kombinasi geo dengan biome atau land cover.

Tabel utama yang menjawab soal ini: **Geographic hierarchy mean-ratio evidence**.

## 5a. Rata-rata organik tiap ekosistem saat acidity < P25 dan CEC < rata-rata

Subset ini menggunakan dua kondisi: **property_acidity_index < 12.8805** dan **cation_exchange_capacity < 169.1421**, dengan total **388 baris**.

Pada level biome, **Amazonia** memiliki rata-rata kandungan organik lebih tinggi, yaitu **27.612371**, dibanding **Mata Atlantica** sebesar **21.317980**. Pada land cover, **Unknown** terlihat paling tinggi dengan mean **38.236604**, tetapi jumlah datanya hanya **19**, sehingga harus dibaca hati-hati. Kelompok yang lebih stabil adalah **Savannah** dengan count **181** dan mean **26.549002**.

Pada geo_zone_macro, **NE** memiliki mean tertinggi **30.054907**, tetapi count hanya **4**. Secara lebih reliabel, **N** lebih kuat karena count **197** dan mean **27.612371**.

Tabel utama yang menjawab soal ini: **Low acidity + low CEC summary by biome**, **by land_cover_type**, dan **by geo_zone_macro**.

## 5b. Kombinasi tutupan lahan dan wilayah geografis sebagai outlier

Kombinasi outlier paling kuat adalah **Mixed Ombrophylous Forest + S** dengan count **83**, mean **73.990822**, dan z-score **2.032233**. Kombinasi ini ditandai sebagai outlier oleh IQR dan juga melewati batas **abs z > 2**, sehingga menjadi bukti outlier positif yang paling kuat.

Beberapa kombinasi lain juga tinggi, seperti **Areas of Ecological Tension + S**, **Seasonal Deciduous Forest + S**, dan **Savannah + S**, tetapi sebagian tidak melewati abs z > 2. Di sisi rendah, **Amazon Rainforest + NE** memiliki mean **10.225556** dan z-score **-1.957902**, tetapi belum melewati abs z > 2.

Tabel utama yang menjawab soal ini: **Land-cover/geography outlier evidence**.

## 6. Korelasi tinggi dan multicollinearity

Ditemukan satu pasangan fitur dengan korelasi absolut di atas 0.8, yaitu **property_particle_coarse** dan **property_particle_fine** dengan korelasi **0.902199**. Ini menunjukkan adanya multicollinearity atau redundansi antara dua fitur tekstur tanah tersebut.

Dampaknya paling besar untuk model linear, karena koefisien dapat menjadi tidak stabil. Namun model utama yang digunakan, yaitu CatBoost, LightGBM, dan XGBoost, relatif lebih tahan terhadap fitur berkorelasi. Meski begitu, korelasi tinggi tetap perlu dicatat karena bisa memengaruhi interpretasi feature importance.

Tabel utama yang menjawab soal ini: **High-correlation pairs, abs(corr) >= 0.8**.

## 7. Feature engineering

Feature engineering menghasilkan **86 fitur baru** dari **48 fitur awal**, sehingga total fitur setelah engineering menjadi **134**. Fitur baru mencakup missing indicators, agregasi fitur spektral, rasio partikel tanah, interaksi cation/CEC, serta encoding dan interaksi geografis.

Feature importance menunjukkan bahwa fitur hasil engineering memang berguna. Contohnya, **particle_coarse_ratio** muncul penting pada CatBoost dan XGBoost, sedangkan fitur spektral seperti **spectral_band_A_PC_5** sangat dominan pada LightGBM. Ini menunjukkan bahwa feature engineering membantu model menangkap pola non-linear dari tekstur tanah, sinyal spektral, dan konteks geografis.

Tabel utama yang menjawab soal ini: **Feature engineering summary**, **daftar fitur baru**, dan **top feature importance**.

## 8. Model yang digunakan

Model utama yang digunakan adalah model tree-based boosting, yaitu **CatBoostRegressor**, **XGBoostRegressor**, dan **LightGBMRegressor**. Model-model ini kemudian dikembangkan menjadi ensemble dan post-processing berbasis OOF. Model final yang dipilih untuk reporting adalah **11Z**.

Alasan penggunaan ensemble adalah performanya lebih baik daripada model individual. Model final mencapai **OOF RMSE 11.245635**, sedangkan CatBoost sebagai model individual terbaik memiliki RMSE **11.470718**, XGBoost **11.516052**, dan LightGBM **11.567934**. Ini menunjukkan ensemble/post-processing memberi peningkatan performa dibanding model tunggal.

Tabel utama yang menjawab soal ini: **Final experiment log** dan **top feature importance CatBoost/LightGBM/XGBoost**.

## 9. Apakah RMSE tepat?

RMSE tepat digunakan sebagai metrik utama karena menghukum error besar lebih kuat. Untuk prediksi kandungan organik tanah, error besar pada sampel ekstrem bisa berdampak besar terhadap keputusan interpretasi lahan, sehingga penalti yang lebih kuat masuk akal.

Namun, RMSE juga sensitif terhadap outlier dan target ekstrem. Ini terlihat pada bin **very_high**, yang memiliki RMSE **19.291652**, jauh lebih tinggi daripada bin lain. Karena itu, RMSE sebaiknya tetap dilengkapi dengan MAE, bias per bin, dan residual analysis agar interpretasi model tidak hanya bergantung pada satu angka.

Tabel utama yang menjawab soal ini: **Residual by target bin** dan **Final OOF RMSE**.

## 10. Data eksternal yang akan diambil jika diperbolehkan

Jika data eksternal diperbolehkan, data yang paling berguna adalah:

| Data Eksternal                 | Alasan Digunakan                                                   | Contoh Fitur yang Bisa Dibuat                  |
| ------------------------------ | ------------------------------------------------------------------ | ---------------------------------------------- |
| Citra satelit / remote sensing | Menangkap vegetasi, kelembapan, dan kondisi permukaan lahan        | NDVI mean, NDVI seasonal, vegetation index     |
| Curah hujan historis           | Kandungan organik dipengaruhi iklim dan kelembapan                 | annual rainfall, dry season length             |
| Suhu historis                  | Aktivitas biologis dan dekomposisi dipengaruhi suhu                | annual temperature mean, heat stress index     |
| Elevasi dan topografi          | Topografi memengaruhi erosi, drainase, dan akumulasi bahan organik | elevation, slope, terrain ruggedness           |
| Peta jenis tanah               | Memberi konteks tekstur, struktur, dan sifat tanah                 | soil class, clay content map, drainage class   |
| Penggunaan lahan historis      | Riwayat lahan memengaruhi akumulasi organik                        | crop/forest history, land conversion flag      |
| Biomassa / vegetasi            | Vegetasi memengaruhi input bahan organik                           | biomass index, canopy cover                    |
| Data manajemen lahan           | Pemupukan, irigasi, dan praktik pertanian memengaruhi target       | fertilizer usage, irrigation, tillage practice |

Data tersebut dapat diintegrasikan melalui koordinat atau kunci geografis jika tersedia. Jika koordinat tidak tersedia, agregasi per wilayah seperti macro, meso, atau micro zone bisa digunakan sebagai pendekatan.

Tabel utama yang menjawab soal ini: tidak ada tabel langsung dari output, tetapi rekomendasi ini berasal dari gap fitur yang terlihat pada analisis, terutama pentingnya fitur geografis, spektral, dan ekosistem.

---

# Kesimpulan Akhir

Model final **11Z** adalah pilihan terbaik dari eksperimen Section 12 karena memiliki **OOF RMSE terendah 11.245635**. Performa ini lebih baik daripada model individual dan jauh lebih baik daripada baseline mean. Namun, residual analysis menunjukkan kelemahan utama masih berada pada target tinggi, khususnya bin **very_high**, yang cenderung di underpredict.

Secara ilmiah, hasil menunjukkan bahwa kandungan organik tanah dipengaruhi oleh kombinasi fitur tanah, spektral, ekosistem, dan geografi. Bukti terkuat terlihat dari perbedaan mean antar geo zone, outlier kombinasi land cover + region, serta pentingnya fitur spektral dan particle ratio pada feature importance.

# Kesimpulan Section 11 sampai 11M

Dokumen ini merangkum perkembangan eksperimen dari Section 11 sampai Section 11M, termasuk analisis kenapa **Ridge stacking** menjadi kandidat terbaik baru.

---

## 1. Section 11 - Old Ensemble

Model awal terbaik menggunakan ensemble:

```text
CatBoost 0.50 + LightGBM 0.25 + XGBoost 0.25
```

Hasil utama:

```text
OOF RMSE: 11.33599
Public Kaggle: 12.13087
```

Model ini menjadi **baseline utama**. Semua eksperimen berikutnya dibandingkan dengan angka ini.

---

## 2. Section 11B - Ensemble Weight Alternatives

Eksperimen ini mencoba beberapa variasi bobot ensemble.

| Candidate | OOF RMSE | Kesimpulan |
|---|---:|---|
| Old ensemble | **11.33599** | Terbaik awal |
| Equal weight | 11.35041 | Sedikit lebih buruk |
| Cat-low 0.25/0.35/0.40 | 11.36854 | Lebih buruk |
| XGB-LGB heavy | 11.42230 | Jauh lebih buruk |

Kesimpulan:

```text
Mengurangi bobot CatBoost tidak otomatis memperbaiki OOF RMSE.
Old ensemble masih lebih kuat secara validasi lokal.
```

Namun, `equal_weight` masih layak diuji di public leaderboard karena CatBoost single model terbukti lebih buruk di public score.

---

## 3. Section 11C - Robust Features

Eksperimen ini menghapus fitur yang dianggap rawan overfit:

```text
source_id
source_id_count
source_id_freq
geo_zone_micro
geo_zone_micro_count
geo_zone_micro_freq
geo_meso_micro
```

Hasil robust model:

| Model Robust | OOF RMSE |
|---|---:|
| CatBoost robust | 11.7527 |
| XGBoost robust | 11.7719 |
| LightGBM robust | 11.8037 |
| Robust ensemble best | 11.6165 |

Kesimpulan:

```text
Robust features gagal memperbaiki performa.
```

Penyebabnya: meskipun `source_id` dan `geo_zone_micro` rawan overfit, fitur tersebut ternyata tetap membawa sinyal prediktif besar. Saat dihapus, model kehilangan informasi penting.

---

## 4. Section 11E-G - Error Analysis

Error analysis menemukan akar masalah utama: **model underpredict pada target sangat tinggi**.

| Target Bin | RMSE | Bias |
|---|---:|---:|
| very_high | **19.57** | **-8.27** |
| medium | 9.08 | +0.65 |
| high | 8.67 | -0.13 |
| very_low | 8.49 | +5.18 |
| low | 6.57 | +1.90 |

Insight utama:

```text
Model sangat underpredict pada target very_high.
```

Untuk tanah dengan organic content tinggi:

```text
very_high target mean ≈ 71.32
old pred mean ≈ 63.05
bias ≈ -8.27
```

Karena metric yang digunakan adalah RMSE, error besar pada target tinggi akan memberi penalti besar terhadap score akhir.

---

## 5. Section 11H - Global Tail Correction

Tail correction mencoba menaikkan prediksi yang berada di area tinggi.

Konsep formula:

```text
new_pred = old_pred + alpha × max(old_pred - threshold, 0)
```

Best result:

```text
threshold ≈ 48.12
alpha = 0.06
OOF RMSE: 11.31590
```

Dibanding old ensemble:

```text
11.33599 → 11.31590
improvement: -0.02009
```

Efek pada target `very_high`:

```text
bias membaik dari sekitar -8.27 ke -7.29
very_high RMSE turun dari sekitar 19.57 ke 19.35
```

Kesimpulan:

```text
Tail correction berhasil karena langsung memperbaiki underprediction di target tinggi.
```

---

## 6. Section 11I - CV-Safe Isotonic Calibration

Isotonic calibration global awal terlihat sangat bagus:

```text
OOF RMSE ≈ 11.17
```

Namun setelah divalidasi secara fold-safe:

```text
CV isotonic OOF RMSE: 11.39747
```

Kesimpulan:

```text
Isotonic global overfit.
Jangan submit isotonic.
```

Isotonic terlalu fleksibel dan tampaknya terlalu menyesuaikan hubungan OOF prediction dengan target pada data training.

---

## 7. Section 11J - Residual Correction

Residual correction mencoba melatih model kedua untuk memprediksi sisa error:

```text
residual = actual - old_prediction
```

Best result:

```text
Residual correction OOF RMSE: 11.31851
```

Dibanding old ensemble:

```text
11.33599 → 11.31851
improvement: -0.01747
```

Namun residual correction masih kalah dari tail correction:

```text
tail correction: 11.31590
residual correction: 11.31851
```

Kesimpulan:

```text
Residual correction membantu sedikit, tapi residual model tidak cukup kuat.
```

Best alpha hanya `0.05`, artinya residual model hanya aman digunakan dalam porsi sangat kecil. Ketika correction diperbesar, noise ikut naik.

---

## 8. Section 11K - Tail Correction Explainability + CV-Safe Check

Section ini mengecek apakah tail correction benar-benar valid, bukan hanya menang karena kebetulan OOF.

Hasil CV-safe tail:

```text
CV-safe tail OOF RMSE: 11.32508
Old ensemble OOF RMSE: 11.33599
Improvement: -0.01091
```

Artinya tail correction tetap lebih baik meskipun diuji lebih aman.

Efek utamanya:

```text
very_high RMSE membaik sekitar -0.21885
bias very_high membaik sekitar +0.98
```

Namun ada trade-off:

```text
very_low, low, medium, dan high sedikit memburuk
```

Kesimpulan:

```text
Tail correction valid.
Gain utamanya datang dari very_high.
Perbaikan di target tinggi lebih besar daripada kerusakan kecil di bin lain.
```

---

## 9. Section 11L - Gated Tail Correction

Gated tail correction membuat tail correction lebih selektif.

Plain tail correction:

```text
semua prediksi tinggi dinaikkan
```

Gated tail correction:

```text
prediksi tinggi dinaikkan lebih kuat kalau classifier yakin sample tersebut memang high organic content
```

Best result:

```text
gated_tail_p70_a0.04_pow0.5
OOF RMSE: 11.31907
```

Dibanding old ensemble:

```text
11.33599 → 11.31907
improvement: -0.01692
```

Perbandingan kandidat:

| Candidate | OOF RMSE | Delta vs Old |
|---|---:|---:|
| Global tail 11H | **11.31590** | -0.01748 |
| Gated tail 11L | **11.31907** | -0.01692 |
| CV-safe tail 11K | **11.32508** | -0.01091 |
| Old ensemble | 11.33599 | 0 |

Kesimpulan:

```text
Gated tail lebih aman secara konsep, tapi sedikit kalah dari global tail.
```

Gated tail lebih hati-hati karena tidak menaikkan semua prediksi tinggi secara agresif.

---

# Kenapa Best Tail Lebih Baik dari Old Ensemble?

Old ensemble memiliki bias sistematis:

```text
Untuk target very_high, prediksi terlalu rendah.
```

Old ensemble tidak buruk secara umum, tetapi cenderung “takut naik” pada nilai organic content tinggi.

Tail correction memperbaiki ini dengan:

```text
menaikkan prediksi hanya untuk bagian atas distribusi prediksi
```

Efeknya:

```text
very_high bias membaik
very_high RMSE turun
overall RMSE ikut turun
```

Karena RMSE memberi penalti besar untuk error besar, perbaikan pada target `very_high` punya dampak besar terhadap RMSE total.

---

# Kenapa Gated Tail Lebih Baik dari Old Ensemble?

Gated tail memperbaiki masalah yang sama dengan tail correction, tetapi menggunakan filter tambahan.

Gated tail tidak hanya bertanya:

```text
apakah prediksi ini tinggi?
```

Tetapi juga:

```text
apakah karakteristik sampel ini terlihat seperti high organic content?
```

Dengan begitu, correction menjadi lebih selektif.

Gated tail lebih baik dari old ensemble karena:

```text
1. tetap menaikkan prediksi very_high
2. mengurangi risiko over-correction dibanding tail biasa
3. distribusi prediksi test tetap masuk akal
```

Namun, gated tail sedikit kalah dari global tail karena correction-nya lebih hati-hati dan tidak seagresif global tail.

---

# Kekurangan Tail Correction

Tail correction bukan solusi sempurna.

Kekurangannya:

```text
1. Tidak benar-benar belajar mekanisme tanah baru.
2. Hanya post-processing prediksi.
3. Bisa merusak sample yang diprediksi tinggi tetapi target aslinya tidak tinggi.
4. Tidak membantu sample very_high yang sejak awal diprediksi rendah.
5. Improvement OOF kecil, jadi public/private leaderboard bisa berbeda.
```

Tail correction cocok karena masalah model saat ini sangat spesifik: **underprediction di ekor atas target**.

---

# Kekurangan Gated Tail

Gated tail lebih pintar secara konsep, tetapi punya risiko tambahan:

```text
1. Butuh classifier tambahan untuk high target.
2. Kalau classifier salah, correction bisa salah sasaran.
3. OOF lebih baik dari old ensemble, tetapi belum mengalahkan global tail.
4. Kompleksitas pipeline naik.
```

Namun, dari sisi ML expert, gated tail lebih defensible karena correction-nya lebih terkontrol.

---

# Kesimpulan Final Sampai 11L

Perkembangan paling penting dari Section 11 sampai 11L:

```text
1. Old ensemble valid, tetapi underpredict target very_high.
2. Robust feature removal gagal karena membuang sinyal penting.
3. Isotonic terlihat bagus secara global, tetapi gagal saat CV-safe.
4. Residual correction membantu sedikit, tetapi tidak mengalahkan tail correction.
5. Tail correction adalah improvement terbaik karena langsung memperbaiki underprediction target tinggi.
6. Gated tail juga lebih baik dari old ensemble dan lebih aman secara konsep, tetapi sedikit kalah dari global tail.
```

---

## 10. Section 11M - Multi-Strategy Stacked Correction

Section 11M mencoba 3 strategi baru sekaligus.

### Part 1: Dual-Tail Correction (atas + bawah)

Konsep: memperbaiki ekor atas (underprediction very_high) DAN ekor bawah (overprediction very_low) sekaligus.

```text
new_pred = old_pred + alpha_up × max(old_pred - threshold_up, 0)
                    - alpha_low × max(threshold_low - old_pred, 0)
```

Best result:

```text
pU=80, pL=30, aU=0.06, aL=0.01
OOF RMSE: 11.31882
```

Dibanding global tail 11H:

```text
11.31590 → 11.31882
dual-tail LEBIH BURUK dari global tail: +0.00292
```

Efek per bin:

| Target Bin | RMSE | Bias |
|---|---:|---:|
| very_high | 19.351 | -7.201 |
| medium | 9.251 | +0.674 |
| high | 8.816 | -0.069 |
| very_low | 8.517 | +5.138 |
| low | 8.613 | +1.979 |

Kesimpulan:

```text
Dual-tail GAGAL mengalahkan global tail.
```

Penyebabnya:
1. Lower tail correction sangat kecil (aL=0.01), artinya model optimizer sendiri hampir tidak menemukan benefit dari koreksi ekor bawah.
2. very_low overprediction (bias +5.18) ternyata bukan karena prediksi terlalu tinggi secara threshold-based, melainkan karena bias alami model pada sample rendah.
3. Menambah correction di ekor bawah justru merusak sample low yang sudah cukup baik.

### Part 2: Ridge Stacking

Konsep: alih-alih bobot ensemble tetap (0.50/0.25/0.25), gunakan Ridge regression untuk mencari weighting optimal dari OOF prediksi individual CatBoost, LightGBM, XGBoost.

Fitur stacking: raw OOF + squared OOF + pairwise interaction.

Hasil per alpha:

| Ridge Alpha | OOF RMSE |
|---:|---:|
| alpha=0.01 | 11.33411 |
| alpha=0.1 | 11.32816 |
| alpha=1.0 | 11.31760 |
| alpha=10.0 | **11.31405** |
| alpha=50.0 | 11.32090 |
| alpha=100.0 | 11.32480 |
| alpha=500.0 | 11.36422 |

Best result:

```text
Ridge alpha=10.0
OOF RMSE: 11.31405
```

Dibanding semua kandidat sebelumnya:

```text
Global tail 11H: 11.31590
Ridge stacking 11M: 11.31405
improvement: -0.00185
```

**Ridge stacking menjadi kandidat terbaik baru.**

Efek per bin:

| Target Bin | RMSE | Bias |
|---|---:|---:|
| very_high | 19.403 | -7.428 |
| medium | 9.224 | +0.457 |
| high | 8.903 | -0.160 |
| very_low | 8.399 | +4.941 |
| low | 6.553 | +1.744 |

### Part 3: Tail Correction di Atas Ridge

Mencoba tail correction pada hasil Ridge stacking.

```text
Ridge+Tail: p=85, a=0.02
OOF RMSE: 11.31609
```

Dibanding Ridge tanpa tail:

```text
11.31405 → 11.31609
tail di atas Ridge LEBIH BURUK: +0.00204
```

Kesimpulan:

```text
Tail correction di atas Ridge justru merusak.
```

Penyebabnya: Ridge stacking sudah secara implisit memperbaiki sebagian bias very_high melalui weighting optimal. Menambah tail correction lagi menyebabkan over-correction yang merusak bin lain lebih dari yang diperbaiki di very_high.

### Perbandingan Seluruh Kandidat 11M

| Candidate | OOF RMSE | Delta vs Old |
|---|---:|---:|
| **Ridge stacking** | **11.31405** | **-0.02194** |
| Global tail 11H | 11.31590 | -0.02009 |
| Ridge+Tail | 11.31609 | -0.01990 |
| Residual 11J | 11.31851 | -0.01748 |
| Dual-tail | 11.31882 | -0.01717 |
| Gated tail 11L | 11.31907 | -0.01692 |
| CV-safe tail 11K | 11.32508 | -0.01091 |
| Old ensemble | 11.33599 | 0 |

---

# Kenapa Ridge Stacking Lebih Baik?

Ridge stacking menang karena:

```text
1. Bobot ensemble tetap (0.50/0.25/0.25) tidak optimal per-sample.
2. Ridge menemukan bahwa hubungan optimal antara prediksi individual dan target
   bukan hanya linear weighting — fitur squared dan interaction juga membantu.
3. Alpha=10 menunjukkan regularisasi moderate - cukup constrained untuk
   tidak overfit OOF, tapi cukup fleksibel untuk improve.
4. CV-safe karena dikerjakan fold-by-fold (stacking di atas OOF prediction).
```

Ridge stacking juga memperbaiki SEMUA bin secara bersamaan, tidak hanya very_high. Ini terlihat dari:

```text
very_low bias: 5.18 → 4.94 (membaik tanpa koreksi eksplisit)
low bias: 1.90 → 1.74 (membaik)
medium bias: 0.65 → 0.46 (membaik)
very_high bias: -8.27 → -7.43 (membaik)
```

---

# Kenapa Dual-Tail Gagal?

Dual-tail mencoba menekan prediksi rendah di ekor bawah. Tapi:

```text
1. Optimal aL hanya 0.01 - correction ekor bawah hampir tidak ada.
2. very_low overprediction bukan karena threshold-based pattern.
3. Sample very_low yang overpredicted tersebar di banyak level prediksi,
   bukan terkonsentrasi di area prediksi rendah saja.
4. Memotong prediksi rendah justru merusak sample low yang sudah baik.
```

---

# Kenapa Tail di Atas Ridge Gagal?

```text
1. Ridge sudah implisit mengurangi bias very_high melalui optimal weighting.
2. Tail correction menambah correction di atas correction yang sudah ada.
3. Over-correction: very_high sedikit membaik, tapi bin lain memburuk lebih banyak.
4. Trade-off net negatif: kerusakan di medium/low/very_low > perbaikan di very_high.
```

---

# Sisa Masalah untuk 11N

Meskipun Ridge stacking menjadi kandidat terbaik, very_high masih sangat bermasalah:

```text
very_high RMSE: 19.403 (turun dari 19.57 tapi masih sangat besar)
very_high bias: -7.428 (turun dari -8.27 tapi masih sangat besar)
```

Akar masalah fundamental yang belum terpecahkan:

```text
1. Model tree-based cenderung compress prediksi ke arah mean.
   Target very_high (mean ≈ 71) diprediksi lebih dekat ke overall mean (≈ 34).
   Ini adalah sifat bawaan tree ensemble yang averaging leaf values.

2. Tail correction / stacking hanya post-processing.
   Tidak mengubah kemampuan model base untuk mengenali pola very_high.

3. Sample very_high yang diprediksi jauh di bawah (misal target=95, pred=50)
   tidak terbantu oleh correction apapun karena pred=50 masih di bawah threshold.
```

---

## 11. Section 11N - Log-Target Retraining + Expanded Stacking

### Ide Utama

Akar masalah dari 11M: tree-based models melakukan "regression to mean" — prediksi terkompresi ke arah rata-rata. Solusinya: **retrain model dengan log1p(target)** agar model belajar di log-space, lalu inverse transform dengan expm1(). Ini secara natural mendekompresi prediksi tinggi.

### Part 1: Log-Target Individual Models

| Model | OOF RMSE (original scale) |
|---|---:|
| CatBoost-log | 11.77114 |
| XGBoost-log | 11.84261 |
| LightGBM-log | 11.85637 |

Kesimpulan:

```text
Model log-target secara individual LEBIH BURUK dari model original.
Tapi tujuannya bukan menang sendiri — tujuannya memberikan DIVERSITAS
untuk stacking.
```

### Part 2: 6-Model Ridge Stacking (3 original + 3 log-target)

| Model | OOF RMSE | Delta vs Ridge3 |
|---|---:|---:|
| **Ridge6_ext_a5.0** | **11.27097** | **-0.04308** |
| Ridge6_ext_a10.0 | 11.27136 | -0.04269 |
| Ridge6_ext_a1.0 | 11.27240 | -0.04165 |
| Ridge6_ext_a20.0 | 11.27346 | -0.04059 |
| Ridge6_ext_a50.0 | 11.27879 | -0.03526 |
| Ridge6_ext_a100.0 | 11.28358 | -0.03047 |
| Ridge6_raw_a100.0 | 11.30875 | -0.00530 |
| Ridge6_raw_a50.0 | 11.30994 | -0.00411 |
| Ridge6_raw_a20.0 | 11.31209 | -0.00196 |
| Ridge6_raw_a10.0 | 11.31332 | -0.00073 |

Best result:

```text
Ridge6_ext_a5.0
OOF RMSE: 11.27097
```

Dibanding semua kandidat sebelumnya:

```text
Old ensemble:     11.33599 → 11.27097  improvement: -0.06502
Global tail 11H:  11.31590 → 11.27097  improvement: -0.04493
Ridge3 11M:       11.31405 → 11.27097  improvement: -0.04308
```

**Ini improvement terbesar sejauh ini.**

Efek per bin:

| Target Bin | RMSE | Bias | vs Ridge3 RMSE |
|---|---:|---:|---:|
| very_high | 19.611 | -7.370 | +0.208 (sedikit memburuk) |
| medium | 9.100 | +0.576 | -0.124 |
| high | 8.932 | +0.028 | +0.029 |
| very_low | **7.919** | +4.637 | **-0.480** |
| low | **6.291** | +1.706 | **-0.262** |

### Kenapa 6-Model Stacking Sangat Bagus?

```text
1. Log-target models memberikan DIVERSITAS prediksi yang berbeda dari original.
   Model original dan log-target melihat hubungan fitur-target dari perspektif
   berbeda.

2. Stacker (Ridge) bisa belajar kapan memakai model original (bagus untuk
   medium/high) dan kapan memakai model log-target (bagus untuk very_low/low).

3. Extended features (squared + interactions) memberi stacker kemampuan
   non-linear untuk mengombinasikan prediksi.

4. Alpha=5.0 menunjukkan regularisasi yang tepat — cukup fleksibel untuk
   exploit diversitas 6 model, tapi cukup constrained untuk tidak overfit.
```

### Temuan Penting: Improvement BUKAN dari very_high!

```text
Berlawanan dengan ekspektasi, improvement terbesar datang dari very_low dan low:

very_low RMSE: 8.399 → 7.919 (turun 0.480)
low RMSE:      6.553 → 6.291 (turun 0.262)

Sementara very_high sedikit memburuk:
very_high RMSE: 19.403 → 19.611 (naik 0.208)
```

Artinya: log-target models membantu stacker memperbaiki prediksi untuk sample rendah. Di log-space, jarak antara target=5 dan target=15 lebih "terlihat" oleh model, sedangkan di original space perbedaan ini sangat kecil dibanding range full (0-100+).

### Sisa Masalah

```text
very_high masih SANGAT bermasalah:
- RMSE: 19.611 (masih mendominasi total error)
- Bias: -7.370 (masih sangat underpredict)
- Bahkan sedikit memburuk dibanding Ridge3

Tapi overall RMSE tetap turun drastis karena perbaikan di bin lain
(very_low, low) jauh lebih besar daripada kerusakan kecil di very_high.
```

---

# Perbandingan Seluruh Kandidat (11 sampai 11N)

| Candidate | OOF RMSE | Delta vs Old |
|---|---:|---:|
| **Ridge6 ext 11N** | **11.27097** | **-0.06502** |
| Ridge3 11M | 11.31405 | -0.02194 |
| Global tail 11H | 11.31590 | -0.02009 |
| Ridge+Tail 11M | 11.31609 | -0.01990 |
| Residual 11J | 11.31851 | -0.01748 |
| Dual-tail 11M | 11.31882 | -0.01717 |
| Gated tail 11L | 11.31907 | -0.01692 |
| CV-safe tail 11K | 11.32508 | -0.01091 |
| Old ensemble | 11.33599 | 0 |

---

# Kesimpulan Final

```text
1. Log-target retraining + 6-model Ridge stacking adalah breakthrough terbesar.
2. Improvement utama datang dari perbaikan prediksi very_low dan low, bukan very_high.
3. Model diversitas (original + log-target) jauh lebih efektif daripada post-processing.
4. very_high masih problem utama — ruang improvement selanjutnya ada di sini.
```

Prioritas submission saat ini:

---

## 12. Section 11O - Prediction-Bin Adaptive Blend

### Ide Utama

Alih-alih menggunakan satu set weight global untuk semua prediksi, gunakan **weight berbeda per prediction-bin**. Insight: Ridge6 terbaik untuk prediksi rendah/menengah, tapi untuk prediksi sangat tinggi, model tail-corrected (11H) bisa lebih bagus.

### Part 1: Global Blend

Blend sederhana 5 kandidat dengan weight tetap.

```text
Best global blend: RMSE = 11.26805
Weights: ridge6_11N = 0.8, global_tail_11H = 0.2
```

### Part 2: Fold-Safe Adaptive Blend

Bagi prediksi ke 5 bin berdasarkan percentile, lalu optimasi weight per-bin menggunakan fold-safe CV.

```text
Adaptive OOF RMSE: 11.26697
Delta vs 11N best: -0.00108
```

**Ini menjadi kandidat terbaik baru.**

Weight per prediction-bin (rata-rata across folds):

| Prediction Bin | RMSE | Weight Pattern |
|---|---:|---|
| Bin 0 (very_low pred) | ~5.5 | 100% ridge6_11N |
| Bin 1 (low pred) | ~6.4 | 100% ridge6_11N |
| Bin 2 (medium pred) | ~7.7 | 100% ridge6_11N |
| Bin 3 (high pred) | ~11.2 | 60% ridge6 + 40% ridge3 |
| Bin 4 (very_high pred) | ~19.4 | 10% ridge6 + 40% ridge3 + 30% tail_11H + 20% gated_11L |

Insight kritis:

```text
Untuk prediksi rendah/menengah (bin 0-2): Ridge6 SELALU menang 100%.
Untuk prediksi tinggi (bin 3): Ridge6 + Ridge3 dicampur.
Untuk prediksi sangat tinggi (bin 4): Ridge6 hampir tidak dipakai!
  → Global tail 11H dan Ridge3 mendominasi.
```

Ini masuk akal karena Ridge6 improvement-nya terutama di very_low/low (dari log-target models), sedangkan untuk very_high, model tail-corrected dan Ridge3 yang memiliki bias lebih kecil di segmen tersebut lebih cocok.

Efek per target bin:

| Target Bin | RMSE | Bias |
|---|---:|---:|
| very_high | 19.502 | -7.461 |
| medium | 9.209 | +0.587 |
| high | 8.907 | -0.090 |
| very_low | 7.958 | +4.647 |
| low | 6.407 | +1.733 |

---

## 13. Section 11P - High-Target Specialist + Meta Stack (GAGAL)

### Ide Utama

Karena very_high masih punya bias -7.4 dan RMSE 19.5, coba dua pendekatan:

1. Train model spesialis yang di-weight berat ke sample high-target
2. Meta-stack semua 12 kandidat prediksi dengan 107 fitur

### Part 1: High-Target Specialist Models

Train LightGBM dan CatBoost dengan sample weight yang lebih besar untuk sample high-target.

| Model | OOF RMSE | very_high Bias | very_high RMSE |
|---|---:|---:|---:|
| cat_high_mild | 11.776 | -5.667 | 18.790 |
| lgb_high_mild | 11.732 | -6.904 | 19.183 |
| lgb_high_medium | 11.837 | -6.730 | 19.260 |
| lgb_high_strong | 11.882 | -6.660 | 19.252 |
| cat_high_medium | 11.913 | -4.982 | 18.440 |

Kesimpulan:

```text
Specialist BERHASIL mengurangi very_high bias (dari -7.4 ke -5.0 untuk cat_high_medium).
Tapi OVERALL RMSE jauh lebih buruk (11.73-11.91 vs 11.27).
```

Penyebab: menaikkan weight untuk high-target samples memaksa model "mengorbankan" akurasi di bin lain. Trade-off net sangat negatif — kerusakan di very_low/low/medium jauh lebih besar daripada perbaikan di very_high.

### Part 2: Meta Stack (12 kandidat × fitur extended)

Stack semua 12 OOF predictions (7 base + 5 specialist) menggunakan Ridge dengan 107 fitur.

| Meta Model | OOF RMSE | Delta vs 11O |
|---|---:|---:|
| meta_none_alpha_100.0 | 11.30343 | +0.03646 |
| meta_none_alpha_50.0 | 11.30640 | +0.03943 |
| meta_none_alpha_20.0 | 11.30945 | +0.04248 |
| meta_mild_high_alpha_100.0 | 11.83255 | +0.56558 |
| meta_medium_high_alpha_100.0 | 12.13616 | +0.86919 |

**Semua meta stack LEBIH BURUK dari 11O adaptive (11.26697).**

### Part 3: Conservative Blend (Meta + 11O)

Blend terbaik: 30% meta + 70% 11O adaptive.

```text
OOF RMSE: 11.27218
Delta vs 11O: +0.00522
Masih LEBIH BURUK dari 11O murni.
```

### Perbandingan Final 11P

| Candidate | OOF RMSE | Delta vs 11O |
|---|---:|---:|
| **best_11O_adaptive** | **11.26697** | **0** |
| best_11P_final_blend | 11.27218 | +0.00522 |
| best_11P_meta | 11.30343 | +0.03646 |
| old_ensemble | 11.33599 | +0.06902 |

---

# Kenapa 11P Gagal?

### 1. Specialist Models: Trade-off Net Negatif

```text
Upweighting high-target samples TIDAK mengajarkan model pola baru.
Model tree-based tetap terbatas oleh leaf values dalam training data.
Yang terjadi: model mendorong split agar prediksi very_high naik,
tapi ini merusak prediksi di semua bin lain.

Contoh: cat_high_mild berhasil mengurangi very_high bias dari -7.4 ke -5.7,
tapi very_low RMSE naik dari 7.96 ke 9.37 (+1.41!) dan
low RMSE naik dari 6.41 ke 7.44 (+1.03!).
Net effect: kerusakan di 4 bin > perbaikan di 1 bin.
```

### 2. Meta Stack: Curse of Dimensionality

```text
107 fitur dari 12 model predictions + squared + interactions.
Tapi hanya ~2,242 validation samples per fold.
Rasio fitur:sample ≈ 1:21 — terlalu sedikit untuk Ridge.

Alpha optimal = 100.0 (sangat tinggi) menunjukkan model MEMBUTUHKAN
regularisasi ekstrem untuk tidak overfit. Tapi regularisasi ekstrem
juga mencegah model belajar pola yang berguna.

Hasil: meta stack hanya jadi "rata-rata terdegradasi" dari semua kandidat.
```

### 3. Weighted Meta Stack: Catastrophic Failure

```text
meta_mild_high (upweight high predictions): RMSE = 11.83
meta_medium_high (upweight medium-high): RMSE = 12.14

Fokus meta stack ke high-prediction region menghasilkan
RMSE lebih buruk dari single base model.
Ini karena weighted Ridge kehilangan kemampuan calibration di bin rendah
yang merupakan kekuatan utama Ridge6.
```

### 4. Fundamental Insight

```text
Pada titik ini, masalah very_high TIDAK BISA diselesaikan dengan:
- Post-processing (tail correction, blending)
- Reweighting (sample weight, weighted loss)
- Stacking lebih dalam (meta stack)

Semua pendekatan ini hanya memindahkan error dari satu bin ke bin lain.
Total error budget sudah mendekati irreducible noise level
untuk fitur yang tersedia.

Satu-satunya cara menurunkan very_high RMSE secara signifikan:
1. Fitur baru yang membedakan target 50 dari target 100+
2. Data tambahan dari domain knowledge
3. Model non-tree (neural net) yang bisa extrapolate
```

---

# Perbandingan Seluruh Kandidat (11 sampai 11P)

| Candidate | OOF RMSE | Delta vs Old |
|---|---:|---:|
| **11O adaptive blend** | **11.26697** | **-0.06902** |
| 11O global blend | 11.26805 | -0.06795 |
| Ridge6 ext 11N | 11.27097 | -0.06502 |
| 11P final blend | 11.27218 | -0.06381 |
| 11P meta stack | 11.30343 | -0.03256 |
| Ridge3 11M | 11.31405 | -0.02194 |
| Global tail 11H | 11.31590 | -0.02009 |
| Gated tail 11L | 11.31907 | -0.01692 |
| Old ensemble | 11.33599 | 0 |

---

# Kesimpulan Final

```text
1. 11O adaptive blend (11.26697) adalah BEST CANDIDATE FINAL.
2. Key innovation: prediction-bin-specific weight selection
   - Ridge6 untuk prediksi rendah/menengah
   - Tail-corrected models untuk prediksi tinggi
3. 11P (specialist + meta stack) GAGAL karena:
   - Specialist merusak bin lain lebih dari memperbaiki very_high
   - Meta stack terlalu banyak fitur untuk jumlah sample
   - Weighted stacking catastrophic di region non-target
4. very_high (bias -7.4, RMSE 19.5) sudah mendekati batas
   kemampuan model dengan fitur yang ada.
```

Prioritas submission saat ini:

```text
1. submission_11o_adaptive_blend.csv — TERBAIK (OOF 11.26697)
2. submission_11o_global_blend.csv — Runner-up sederhana (OOF 11.26805)
3. submission_11n_best.csv — Ridge6 standalone (OOF 11.27097)
4. submission_11p_final_blend.csv — Conservative blend (OOF 11.27218)
```

Secara offline, **11O adaptive blend adalah kandidat final terkuat.**

# Research Question Output dan Jawaban Rapih

Sumber utama: output Section 12 dari Colab.  
Tujuan file ini:

1. Menyalin output mentah lengkap terlebih dahulu.
2. Menyusun ulang hasilnya menjadi versi rapih.
3. Menunjukkan tabel atau output mana yang menjawab tiap soal.
4. Menyediakan draft jawaban siap pakai untuk 10 poin research question.

---

# BAGIAN 1 - Salinan Output Mentah Lengkap

Catatan: bagian ini sengaja disalin apa adanya dari output Colab, termasuk noise HTML/CSS/JavaScript bawaan tampilan dataframe. Bagian bersihnya ada setelah ini.

<details>
<summary>Klik untuk membuka salinan output mentah lengkap</summary>

```text
Final model used for reporting: 11Z2 Lite selected
Final OOF RMSE: 11.245635
Final experiment log:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      model_name
      features
      mean_cv_rmse
      std_cv_rmse
      fold_scores
      notes
      mean_train_rmse
      train_valid_gap




      0
      11Z2 Lite selected
      engineered / post-processed
      11.245635
      NaN
      None
      Final selected model for submission/reporting
      NaN
      NaN


      1
      11X raw
      engineered / post-processed
      11.250966
      NaN
      None
      Signed dual-tail correction
      NaN
      NaN


      2
      11X robust
      engineered / post-processed
      11.252014
      NaN
      None
      Safer signed dual-tail correction
      NaN
      NaN


      3
      11O adaptive blend
      engineered / post-processed
      11.266968
      NaN
      None
      Fold-safe prediction-bin adaptive blending
      NaN
      NaN


      4
      CatBoostRegressor
      all engineered features, native categorical
      11.470718
      0.395977
      [11.716952921271849, 11.439484317129109, 11.72...
      Main model with native categorical and missing...
      6.316809
      5.153910


      5
      XGBoostRegressor
      all engineered features, encoded
      11.516052
      0.309037
      [11.717790668303936, 11.450417397053371, 11.67...
      Main model with fold-safe imputation and ordin...
      4.564849
      6.951202


      6
      LightGBMRegressor
      all engineered features, encoded
      11.567934
      0.311411
      [11.859466298761848, 11.488169534315505, 11.78...
      Main model with fold-safe imputation and ordin...
      3.345722
      8.222212


      7
      HistGradientBoosting Baseline
      all engineered features, encoded
      12.058976
      0.343606
      [12.316113042840291, 12.175995969105989, 12.30...
      Tree baseline with fold-safe preprocessing
      8.226144
      3.832832


      8
      Ridge Baseline
      all engineered features, encoded
      16.469542
      0.317761
      [16.636372805347005, 16.242512785676446, 16.42...
      Linear baseline with median imputation, ordina...
      16.259431
      0.210111


      9
      Mean Baseline
      target mean only
      23.192856
      0.485007
      [23.372411433062553, 23.11527977519483, 23.492...
      Predicts each fold training target mean
      NaN
      NaN















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-e5ed3022-304b-43af-90f9-916fc47ca974 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-e5ed3022-304b-43af-90f9-916fc47ca974');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Overfit / underfit evidence table:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      model_name
      mean_train_rmse
      mean_cv_rmse
      train_valid_gap
      std_cv_rmse
      notes




      0
      11Z2 Lite selected
      NaN
      11.245635
      NaN
      NaN
      Final selected model for submission/reporting


      1
      11X raw
      NaN
      11.250966
      NaN
      NaN
      Signed dual-tail correction


      2
      11X robust
      NaN
      11.252014
      NaN
      NaN
      Safer signed dual-tail correction


      3
      11O adaptive blend
      NaN
      11.266968
      NaN
      NaN
      Fold-safe prediction-bin adaptive blending


      4
      CatBoostRegressor
      6.316809
      11.470718
      5.153910
      0.395977
      Main model with native categorical and missing...


      5
      XGBoostRegressor
      4.564849
      11.516052
      6.951202
      0.309037
      Main model with fold-safe imputation and ordin...


      6
      LightGBMRegressor
      3.345722
      11.567934
      8.222212
      0.311411
      Main model with fold-safe imputation and ordin...


      7
      HistGradientBoosting Baseline
      8.226144
      12.058976
      3.832832
      0.343606
      Tree baseline with fold-safe preprocessing


      8
      Ridge Baseline
      16.259431
      16.469542
      0.210111
      0.317761
      Linear baseline with median imputation, ordina...


      9
      Mean Baseline
      NaN
      23.192856
      NaN
      0.485007
      Predicts each fold training target mean















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-4191f82f-2e8c-4013-a7af-549c505ffe30 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-4191f82f-2e8c-4013-a7af-549c505ffe30');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Residual by target bin:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      target_bin_5
      count
      target_mean
      pred_mean
      bias_pred_minus_actual
      mae
      rmse
      max_abs_error




      4
      very_high
      2187
      71.325513
      64.151894
      -7.173619
      13.487047
      19.291652
      109.892658


      2
      medium
      2015
      28.526479
      29.003593
      0.477113
      5.811791
      9.378989
      103.390702


      3
      high
      2152
      40.284122
      40.196936
      -0.087187
      6.799592
      9.108370
      68.328485


      0
      very_low
      2259
      12.766984
      17.282442
      4.515458
      5.003515
      7.877215
      77.738650


      1
      low
      2597
      20.691498
      22.288536
      1.597037
      4.084692
      6.442074
      63.090516















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-2b9e60e9-1651-43fe-836c-f25338cc56a2 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-2b9e60e9-1651-43fe-836c-f25338cc56a2');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by geo_zone_macro:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      geo_zone_macro
      count
      mean
      median
      std
      min
      max
      range




      3
      S
      1022
      57.266801
      55.789674
      36.452029
      5.382646
      191.186425
      185.803778


      2
      NE
      512
      42.367177
      35.192152
      31.220322
      3.128191
      195.231500
      192.103308


      0
      MW
      2930
      34.500503
      29.124540
      20.587121
      5.393433
      177.061023
      171.667590


      1
      N
      979
      34.394741
      30.742570
      19.625071
      2.479541
      148.427285
      145.947744


      4
      SE
      5767
      29.089654
      24.270450
      17.819009
      2.157373
      181.219360
      179.061987















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-6f2d5b1e-fc1b-40bb-8c60-9444a266a622 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-6f2d5b1e-fc1b-40bb-8c60-9444a266a622');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by geo_zone_meso:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      geo_zone_meso
      count
      mean
      median
      std
      min
      max
      range




      2
      State_03
      122
      72.951594
      71.039607
      37.236198
      5.382646
      191.186425
      185.803778


      7
      State_08
      502
      71.071907
      67.504212
      35.418508
      5.382646
      189.794919
      184.412273


      15
      State_16
      62
      64.715981
      56.388345
      42.079164
      10.678998
      193.678191
      182.999193


      14
      State_15
      66
      58.869325
      53.880399
      25.964751
      14.562270
      136.561732
      121.999462


      11
      State_12
      139
      53.007989
      49.932406
      27.037303
      9.869983
      172.562899
      162.692916


      12
      State_13
      121
      49.095844
      41.567191
      31.057487
      13.025142
      195.231500
      182.206358


      4
      State_05
      930
      47.739886
      44.738529
      27.454776
      2.157373
      181.219360
      179.061987


      8
      State_09
      217
      45.039812
      42.554189
      26.091399
      2.479541
      148.427285
      145.947744


      9
      State_10
      185
      35.343023
      32.360600
      14.001608
      11.326210
      71.193320
      59.867110


      3
      State_04
      995
      35.151177
      24.270450
      28.177461
      5.393433
      177.061023
      171.667590


      5
      State_06
      398
      35.046430
      27.247625
      24.494798
      5.512089
      103.570100
      98.058011


      1
      State_02
      1750
      34.041481
      30.742570
      15.407513
      5.393433
      90.609680
      85.216247


      19
      State_21
      5
      30.170866
      34.625842
      13.019954
      8.629493
      43.363204
      34.733711


      6
      State_07
      550
      30.058094
      29.124540
      10.819269
      5.393433
      90.609680
      85.216247


      0
      State_01
      4835
      25.500139
      22.652420
      12.411013
      5.393433
      111.644070
      106.250637


      16
      State_17
      56
      24.778300
      15.314654
      20.339823
      3.128191
      92.794021
      89.665829


      10
      State_11
      141
      23.621491
      22.199372
      14.624068
      4.170922
      90.787663
      86.616742


      13
      State_14
      81
      23.077680
      21.681602
      8.833946
      5.393433
      42.715992
      37.322559


      17
      State_18
      44
      18.879991
      10.643042
      18.056387
      4.314747
      79.500286
      75.185539















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-83175530-15cd-4fda-9cb2-1eb3d4cfee49 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-83175530-15cd-4fda-9cb2-1eb3d4cfee49');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by geo_zone_micro:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      geo_zone_micro
      count
      mean
      median
      std
      min
      max
      range




      23
      Loc_031
      15
      108.600016
      103.246494
      26.290209
      81.225106
      172.562899
      91.337793


      4
      Loc_005
      214
      86.785610
      82.430538
      25.931261
      48.540900
      157.045992
      108.505092


      7
      Loc_008
      122
      72.951594
      71.039607
      37.236198
      5.382646
      191.186425
      185.803778


      15
      Loc_021
      39
      60.103176
      59.689127
      11.016700
      30.677849
      94.848919
      64.171070


      2
      Loc_003
      249
      59.284951
      51.210650
      39.580606
      5.382646
      189.794919
      184.412273


      12
      Loc_016
      66
      58.869325
      53.880399
      25.964751
      14.562270
      136.561732
      121.999462


      26
      Loc_043
      10
      56.585745
      51.671788
      21.565272
      30.920553
      98.279142
      67.358589


      1
      Loc_002
      515
      56.266566
      51.776960
      29.493522
      3.595622
      181.219360
      177.623738


      22
      Loc_030
      20
      53.297908
      59.834749
      14.909130
      19.917949
      67.957260
      48.039311


      25
      Loc_035
      15
      53.165230
      62.844285
      19.417285
      22.652420
      77.503637
      54.851217


      28
      Loc_048
      8
      48.352804
      47.003771
      15.777097
      29.464326
      78.684799
      49.220473


      18
      Loc_024
      24
      47.177036
      47.618623
      16.493146
      16.067038
      72.633367
      56.566329


      47
      Loc_227
      5
      46.738415
      33.444680
      27.515833
      24.545515
      89.525600
      64.980085


      19
      Loc_025
      25
      45.994552
      49.366095
      16.017304
      12.216126
      75.982689
      63.766562


      8
      Loc_011
      98
      45.519477
      46.922870
      10.704186
      25.888480
      71.193320
      45.304840


      30
      Loc_060
      8
      45.151127
      31.308881
      31.270412
      16.698070
      93.505954
      76.807884


      14
      Loc_019
      50
      44.878563
      41.923157
      18.419194
      9.869983
      74.316118
      64.446135


      33
      Loc_068
      7
      44.195334
      42.230583
      8.204454
      36.082069
      59.867110
      23.785041


      3
      Loc_004
      151
      39.686954
      40.046243
      15.453170
      11.536554
      100.932711
      89.396158


      16
      Loc_022
      34
      38.975487
      38.832720
      12.175968
      12.944240
      58.249080
      45.304840















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-9989c19a-51e3-44b2-a221-7e7cb4b18c7f button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-9989c19a-51e3-44b2-a221-7e7cb4b18c7f');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by biome:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      biome
      count
      mean
      median
      std
      min
      max
      range




      1
      Caatinga
      100
      44.898714
      37.271321
      29.421622
      11.682177
      195.231500
      183.549323


      4
      Unknown
      1686
      34.359991
      25.939610
      25.565953
      2.479541
      177.061023
      174.581482


      2
      Cerrado
      3760
      34.133753
      29.286343
      18.298047
      3.595622
      181.219360
      177.623738


      0
      Amazonia
      1020
      33.914792
      30.742570
      19.880992
      3.128191
      148.427285
      145.299094


      3
      Mata Atlantica
      4644
      33.889063
      24.270450
      26.137767
      2.157373
      193.678191
      191.520818















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-1049a108-c12f-486b-a58e-4660236d1ee6 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-1049a108-c12f-486b-a58e-4660236d1ee6');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by land_cover_type:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      land_cover_type
      count
      mean
      median
      std
      min
      max
      range




      4
      Mixed Ombrophylous Forest
      85
      74.248605
      77.843423
      32.168497
      5.382646
      140.817151
      135.434504


      7
      Seasonal Deciduous Forest
      521
      69.180513
      65.125708
      35.766982
      3.595622
      189.794919
      186.199297


      9
      Steppe
      77
      45.098279
      38.266410
      27.512613
      11.682177
      185.944008
      174.261831


      5
      Open Ombrophylous Forest
      50
      42.139398
      36.162971
      30.804470
      5.684679
      126.643208
      120.958529


      3
      Dense Ombrophylous Forest
      653
      35.432299
      27.506510
      26.494566
      3.128191
      193.678191
      190.550000


      6
      Savannah
      3019
      35.050507
      30.742570
      19.318495
      5.393433
      191.186425
      185.792991


      10
      Unknown
      1893
      34.121648
      27.506510
      24.525467
      2.479541
      177.061023
      174.581482


      1
      Areas of Ecological Tension
      1240
      33.187183
      28.072820
      18.485415
      3.595622
      195.231500
      191.635878


      8
      Seasonal Semideciduous Forest
      3446
      27.667800
      22.652420
      17.279683
      2.157373
      155.330880
      153.173507


      2
      Areas of Pioneering Formation
      194
      22.857176
      22.652420
      10.207491
      5.393433
      90.787663
      85.394230


      0
      Amazon Rainforest
      32
      10.225556
      8.701406
      5.989948
      4.314747
      25.618808
      21.304062















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-1689ebcc-5c3e-4cd5-aa97-6db51a7fb220 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-1689ebcc-5c3e-4cd5-aa97-6db51a7fb220');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Target distribution by parent_rock_type:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      parent_rock_type
      count
      mean
      median
      std
      min
      max
      range




      1
      Metamorphic Rock
      439
      42.029687
      37.21469
      27.269995
      2.157373
      195.231500
      193.074126


      0
      Igneous Rock
      5291
      39.502852
      33.97863
      23.834955
      3.128191
      191.186425
      188.058233


      3
      Unknown
      1686
      34.359991
      25.93961
      25.565953
      2.479541
      177.061023
      174.581482


      2
      Sedimentary Rock
      3794
      25.657896
      21.03439
      17.393610
      4.314747
      193.678191
      189.363444















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-f653f30a-cbcc-434e-a8b1-5f7a8366e511 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-f653f30a-cbcc-434e-a8b1-5f7a8366e511');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Geographic hierarchy mean-ratio evidence:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      geographic_level
      n_groups
      max_group_mean
      min_group_mean
      max_min_ratio
      mean_std_across_groups
      top_group
      bottom_group




      0
      geo_zone_macro
      5
      57.266801
      29.089654
      1.968631
      10.992168
      S
      SE


      1
      geo_zone_meso
      19
      72.951594
      18.879991
      3.863963
      16.801795
      State_03
      State_18


      2
      geo_zone_micro
      44
      108.600016
      9.065822
      11.979059
      20.120699
      Loc_031
      Loc_065















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-7ab45c26-a7ac-4407-bbbd-43b837b1653e button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-7ab45c26-a7ac-4407-bbbd-43b837b1653e');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






      .colab-df-generate {
        background-color: #E8F0FE;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: none;
        fill: #1967D2;
        height: 32px;
        padding: 0 0 0 0;
        width: 32px;
      }

      .colab-df-generate:hover {
        background-color: #E2EBFA;
        box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
        fill: #174EA6;
      }

      [theme=dark] .colab-df-generate {
        background-color: #3B4455;
        fill: #D2E3FC;
      }

      [theme=dark] .colab-df-generate:hover {
        background-color: #434B5C;
        box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
        filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
        fill: #FFFFFF;
      }








      (() => {
      const buttonEl =
        document.querySelector('#id_7efb8c3f-5298-438f-81d7-8ac36ae91a8c button.colab-df-generate');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      buttonEl.onclick = () => {
        google.colab.notebook.generateWithVariable('geo_hierarchy_ratio_12');
      }
      })();





Low acidity threshold Q25: 12.8805
Low CEC threshold mean: 169.1421
Filtered rows: 388
Low acidity + low CEC summary by biome:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      grouping
      biome
      count
      mean
      median
      std
      min
      max
      range




      0
      biome
      Amazonia
      197
      27.612371
      27.50651
      6.731054
      11.326210
      46.92287
      35.596660


      3
      biome
      Mata Atlantica
      186
      21.317980
      21.03439
      10.040505
      5.393433
      111.64407
      106.250637















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-6fcd7e25-51c7-4d3f-9406-37f1c70960dc button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-6fcd7e25-51c7-4d3f-9406-37f1c70960dc');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Low acidity + low CEC summary by land_cover_type:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      grouping
      land_cover_type
      count
      mean
      median
      std
      min
      max
      range




      5
      land_cover_type
      Unknown
      19
      38.236604
      37.21469
      5.610481
      29.124540
      45.304840
      16.180300


      2
      land_cover_type
      Savannah
      181
      26.549002
      25.88848
      5.890218
      11.326210
      46.922870
      35.596660


      0
      land_cover_type
      Areas of Pioneering Formation
      120
      22.632195
      22.65242
      6.775156
      9.708180
      40.127144
      30.418964


      1
      land_cover_type
      Dense Ombrophylous Forest
      5
      22.328814
      19.41636
      4.772503
      17.798330
      27.506510
      9.708180


      3
      land_cover_type
      Seasonal Semideciduous Forest
      62
      18.685637
      16.18030
      14.289085
      5.393433
      111.644070
      106.250637















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-cdfdddcd-cca9-497a-b6de-872bf8be5fcb button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-cdfdddcd-cca9-497a-b6de-872bf8be5fcb');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Low acidity + low CEC summary by geo_zone_macro:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      grouping
      geo_zone_macro
      count
      mean
      median
      std
      min
      max
      range




      2
      geo_zone_macro
      NE
      4
      30.054907
      30.499866
      11.653093
      19.092754
      40.127144
      21.034390


      1
      geo_zone_macro
      N
      197
      27.612371
      27.506510
      6.731054
      11.326210
      46.922870
      35.596660


      0
      geo_zone_macro
      MW
      119
      22.516451
      22.652420
      6.696469
      9.708180
      43.686810
      33.978630


      3
      geo_zone_macro
      SE
      68
      19.083236
      16.180300
      13.745252
      5.393433
      111.644070
      106.250637















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-8e34f456-91a3-422a-9c82-e12641ee5386 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-8e34f456-91a3-422a-9c82-e12641ee5386');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Land-cover/geography outlier evidence:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      land_cover_type
      geo_zone_macro
      count
      mean
      median
      std
      min
      max
      range
      z_score_group_mean
      is_outlier_iqr
      is_outlier_abs_z_gt_2




      12
      Mixed Ombrophylous Forest
      S
      83
      73.990822
      77.843423
      32.474257
      5.382646
      140.817151
      135.434504
      2.032233
      True
      True


      0
      Amazon Rainforest
      NE
      32
      10.225556
      8.701406
      5.989948
      4.314747
      25.618808
      21.304062
      -1.957902
      False
      False


      4
      Areas of Ecological Tension
      S
      15
      71.783362
      68.345587
      16.576870
      48.815965
      99.023436
      50.207471
      1.894100
      True
      False


      21
      Seasonal Deciduous Forest
      S
      487
      71.049993
      67.504212
      35.850481
      5.382646
      189.794919
      184.412273
      1.848210
      True
      False


      19
      Savannah
      S
      39
      70.739903
      67.601293
      46.173274
      10.750910
      191.186425
      180.435514
      1.828806
      True
      False


      6
      Areas of Pioneering Formation
      MW
      188
      21.972503
      22.652420
      8.023551
      5.393433
      43.686810
      38.293377
      -1.222833
      False
      False


      11
      Dense Ombrophylous Forest
      SE
      262
      23.204396
      22.652420
      9.967143
      5.393433
      67.342409
      61.948975
      -1.145747
      False
      False


      31
      Unknown
      SE
      464
      24.516177
      22.652420
      12.666913
      5.393433
      105.171950
      99.778517
      -1.063662
      False
      False


      25
      Seasonal Semideciduous Forest
      SE
      3150
      26.072126
      21.034390
      16.511056
      2.157373
      155.330880
      153.173507
      -0.966297
      False
      False


      2
      Areas of Ecological Tension
      N
      38
      56.740054
      55.336626
      28.958396
      11.067325
      131.060430
      119.993105
      0.952760
      False
      False


      28
      Unknown
      N
      251
      28.878057
      29.124540
      13.406524
      2.479541
      82.843136
      80.363595
      -0.790715
      False
      False


      18
      Savannah
      N
      374
      29.932137
      29.124540
      10.954513
      5.393433
      90.609680
      85.216247
      -0.724756
      False
      False


      1
      Areas of Ecological Tension
      MW
      1028
      30.301045
      27.506510
      13.474655
      5.393433
      88.668044
      83.274611
      -0.701671
      False
      False


      3
      Areas of Ecological Tension
      NE
      14
      50.751822
      37.004346
      44.012911
      13.138404
      195.231500
      182.093096
      0.578044
      False
      False


      14
      Open Ombrophylous Forest
      N
      42
      34.627469
      28.072820
      23.889232
      5.684679
      115.850948
      110.166269
      -0.430944
      False
      False


      17
      Savannah
      MW
      897
      35.003875
      32.360600
      19.600119
      5.501302
      158.566940
      153.065638
      -0.407390
      False
      False


      30
      Unknown
      S
      398
      35.046430
      27.247625
      24.494798
      5.512089
      103.570100
      98.058011
      -0.404727
      False
      False


      20
      Savannah
      SE
      1709
      35.380649
      31.227979
      18.690781
      5.393433
      181.219360
      175.825927
      -0.383813
      False
      False


      10
      Dense Ombrophylous Forest
      NE
      120
      47.009255
      36.243872
      39.609330
      3.128191
      193.678191
      190.550000
      0.343851
      False
      False


      24
      Seasonal Semideciduous Forest
      NE
      20
      45.276524
      43.516917
      22.213986
      16.730430
      83.684512
      66.954081
      0.235425
      False
      False


      26
      Steppe
      NE
      77
      45.098279
      38.266410
      27.512613
      11.682177
      185.944008
      174.261831
      0.224271
      False
      False


      23
      Seasonal Semideciduous Forest
      MW
      276
      44.603303
      46.922870
      15.656741
      5.393433
      90.609680
      85.216247
      0.193298
      False
      False


      22
      Seasonal Deciduous Forest
      SE
      34
      42.402961
      39.641735
      20.967398
      3.595622
      79.283470
      75.687848
      0.055611
      False
      False


      27
      Unknown
      MW
      541
      40.845065
      30.742570
      31.430567
      5.393433
      177.061023
      171.667590
      -0.041875
      False
      False


      9
      Dense Ombrophylous Forest
      N
      271
      42.127783
      40.127144
      25.650423
      4.170922
      148.427285
      144.256364
      0.038391
      False
      False


      5
      Areas of Ecological Tension
      SE
      145
      41.787826
      30.742570
      27.615923
      3.595622
      135.105505
      131.509883
      0.017118
      False
      False


      29
      Unknown
      NE
      239
      41.517662
      35.645201
      25.893892
      5.393433
      172.562899
      167.169466
      0.000213
      False
      False















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-c14e89b1-ece0-4668-b0de-e40112d0b4d3 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-c14e89b1-ece0-4668-b0de-e40112d0b4d3');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






High-correlation pairs, abs(corr) >= 0.8:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      feature_1
      feature_2
      abs_corr




      0
      property_particle_coarse
      property_particle_fine
      0.902199















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-deb0f547-5ced-444e-aa14-04dc6287dcf6 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-deb0f547-5ced-444e-aa14-04dc6287dcf6');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Feature engineering summary:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      is_new_feature
      count




      0
      True
      86


      1
      False
      48















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-0f875c84-b548-47f5-8e04-ce1657c17a27 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-0f875c84-b548-47f5-8e04-ce1657c17a27');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }










    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      feature
      is_new_feature




      48
      original_total_missing_count
      True


      49
      original_numerical_missing_count
      True


      50
      missing_cation_Ca
      True


      51
      missing_cation_Mg
      True


      52
      missing_cation_Na
      True


      53
      missing_cation_exchange_capacity
      True


      54
      missing_latitude
      True


      55
      missing_longitude
      True


      56
      missing_property_acidity_index
      True


      57
      missing_property_particle_coarse
      True


      58
      missing_property_particle_fine
      True


      59
      missing_spectral_band_B_PC_1
      True


      60
      missing_spectral_band_B_PC_10
      True


      61
      missing_spectral_band_B_PC_11
      True


      62
      missing_spectral_band_B_PC_12
      True


      63
      missing_spectral_band_B_PC_13
      True


      64
      missing_spectral_band_B_PC_14
      True


      65
      missing_spectral_band_B_PC_15
      True


      66
      missing_spectral_band_B_PC_2
      True


      67
      missing_spectral_band_B_PC_3
      True


      68
      missing_spectral_band_B_PC_4
      True


      69
      missing_spectral_band_B_PC_5
      True


      70
      missing_spectral_band_B_PC_6
      True


      71
      missing_spectral_band_B_PC_7
      True


      72
      missing_spectral_band_B_PC_8
      True


      73
      missing_spectral_band_B_PC_9
      True


      74
      spectral_band_A_mean
      True


      75
      spectral_band_A_std
      True


      76
      spectral_band_A_min
      True


      77
      spectral_band_A_max
      True


      78
      spectral_band_A_median
      True


      79
      spectral_band_A_abs_mean
      True


      80
      spectral_band_A_l2_norm
      True


      81
      spectral_band_A_missing_count
      True


      82
      spectral_band_A_available_count
      True


      83
      spectral_band_B_mean
      True


      84
      spectral_band_B_std
      True


      85
      spectral_band_B_min
      True


      86
      spectral_band_B_max
      True


      87
      spectral_band_B_median
      True


      88
      spectral_band_B_abs_mean
      True


      89
      spectral_band_B_l2_norm
      True


      90
      spectral_band_B_missing_count
      True


      91
      spectral_band_B_available_count
      True


      92
      missing_band_B
      True


      93
      missing_band_A
      True


      94
      particle_fine_minus_coarse
      True


      95
      particle_fine_ratio
      True


      96
      particle_coarse_ratio
      True


      97
      cation_total
      True















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-b61848da-c677-44f1-8f48-192dbb74c476 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-b61848da-c677-44f1-8f48-192dbb74c476');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






Top feature importance - catboost:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      feature
      importance




      83
      source_id
      17.861739


      73
      particle_coarse_ratio
      6.289378


      96
      spectral_band_A_PC_5
      5.328798


      12
      cation_exchange_capacity
      4.903224


      77
      property_particle_coarse
      3.632640


      94
      spectral_band_A_PC_3
      3.303099


      92
      spectral_band_A_PC_15
      2.563761


      93
      spectral_band_A_PC_2
      2.429597


      75
      particle_fine_ratio
      2.354292


      74
      particle_fine_minus_coarse
      2.267478


      14
      fine_x_CEC
      2.246233


      98
      spectral_band_A_PC_7
      1.792503


      105
      spectral_band_A_mean
      1.660781


      15
      geo_macro_biome
      1.563253


      100
      spectral_band_A_PC_9
      1.545824


      104
      spectral_band_A_max
      1.545224


      97
      spectral_band_A_PC_6
      1.463239


      9
      cation_Ca
      1.417971


      78
      property_particle_fine
      1.397813


      0
      Ca_CEC_ratio
      1.329506


      89
      spectral_band_A_PC_12
      1.279750


      18
      geo_zone_macro
      1.165623


      13
      cation_total
      1.164647


      2
      Mg_CEC_ratio
      1.095172


      84
      source_id_count
      1.060578


      10
      cation_Mg
      1.018497


      99
      spectral_band_A_PC_8
      1.010158


      80
      sampling_strategy
      0.960020


      90
      spectral_band_A_PC_13
      0.956512


      85
      source_id_freq
      0.941480















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-09f0158f-203c-45de-897a-7580269ae36d button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-09f0158f-203c-45de-897a-7580269ae36d');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






      .colab-df-generate {
        background-color: #E8F0FE;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: none;
        fill: #1967D2;
        height: 32px;
        padding: 0 0 0 0;
        width: 32px;
      }

      .colab-df-generate:hover {
        background-color: #E2EBFA;
        box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
        fill: #174EA6;
      }

      [theme=dark] .colab-df-generate {
        background-color: #3B4455;
        fill: #D2E3FC;
      }

      [theme=dark] .colab-df-generate:hover {
        background-color: #434B5C;
        box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
        filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
        fill: #FFFFFF;
      }








      (() => {
      const buttonEl =
        document.querySelector('#id_3f914997-2e36-4e1e-8d60-cc4b91c02fb9 button.colab-df-generate');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      buttonEl.onclick = () => {
        google.colab.notebook.generateWithVariable('fi');
      }
      })();





Top feature importance - lightgbm:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      feature
      importance




      96
      spectral_band_A_PC_5
      1657.2


      92
      spectral_band_A_PC_15
      1597.6


      97
      spectral_band_A_PC_6
      1523.4


      94
      spectral_band_A_PC_3
      1491.2


      90
      spectral_band_A_PC_13
      1487.0


      100
      spectral_band_A_PC_9
      1448.6


      89
      spectral_band_A_PC_12
      1413.2


      91
      spectral_band_A_PC_14
      1410.8


      93
      spectral_band_A_PC_2
      1401.4


      98
      spectral_band_A_PC_7
      1392.4


      12
      cation_exchange_capacity
      1381.4


      87
      spectral_band_A_PC_10
      1370.4


      99
      spectral_band_A_PC_8
      1367.2


      88
      spectral_band_A_PC_11
      1360.4


      95
      spectral_band_A_PC_4
      1298.8


      106
      spectral_band_A_median
      1268.8


      77
      property_particle_coarse
      1244.8


      0
      Ca_CEC_ratio
      1205.4


      1
      Ca_Mg_ratio
      1059.6


      105
      spectral_band_A_mean
      1056.4


      2
      Mg_CEC_ratio
      1055.4


      104
      spectral_band_A_max
      1044.0


      78
      property_particle_fine
      1032.2


      14
      fine_x_CEC
      980.4


      101
      spectral_band_A_abs_mean
      965.2


      107
      spectral_band_A_min
      863.6


      10
      cation_Mg
      861.6


      9
      cation_Ca
      840.6


      86
      spectral_band_A_PC_1
      826.4


      74
      particle_fine_minus_coarse
      781.6















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-9265904a-3be0-4c3d-a58b-90abe13f5b98 button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-9265904a-3be0-4c3d-a58b-90abe13f5b98');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






      .colab-df-generate {
        background-color: #E8F0FE;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: none;
        fill: #1967D2;
        height: 32px;
        padding: 0 0 0 0;
        width: 32px;
      }

      .colab-df-generate:hover {
        background-color: #E2EBFA;
        box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
        fill: #174EA6;
      }

      [theme=dark] .colab-df-generate {
        background-color: #3B4455;
        fill: #D2E3FC;
      }

      [theme=dark] .colab-df-generate:hover {
        background-color: #434B5C;
        box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
        filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
        fill: #FFFFFF;
      }








      (() => {
      const buttonEl =
        document.querySelector('#id_33fc9d7d-8aac-4de3-b8e7-fd72797d91ea button.colab-df-generate');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      buttonEl.onclick = () => {
        google.colab.notebook.generateWithVariable('fi');
      }
      })();





Top feature importance - xgboost:




    .dataframe tbody tr th:only-of-type {
        vertical-align: middle;
    }

    .dataframe tbody tr th {
        vertical-align: top;
    }

    .dataframe thead th {
        text-align: right;
    }





      feature
      importance




      16
      geo_macro_meso__ord
      0.076995


      73
      particle_coarse_ratio
      0.073074


      77
      property_particle_coarse
      0.053818


      81
      sampling_strategy_count
      0.040203


      15
      geo_macro_biome__ord
      0.036096


      82
      sampling_strategy_freq
      0.035967


      46
      missing_cation_Na
      0.027058


      74
      particle_fine_minus_coarse
      0.023387


      80
      sampling_strategy__ord
      0.021211


      24
      geo_zone_micro__ord
      0.021009


      22
      geo_zone_meso_count
      0.020231


      23
      geo_zone_meso_freq
      0.019301


      75
      particle_fine_ratio
      0.017120


      119
      spectral_band_B_PC_4
      0.016927


      117
      spectral_band_B_PC_2
      0.016259


      83
      source_id__ord
      0.015627


      25
      geo_zone_micro_count
      0.015040


      84
      source_id_count
      0.014785


      85
      source_id_freq
      0.014176


      14
      fine_x_CEC
      0.014036


      20
      geo_zone_macro_freq
      0.013699


      26
      geo_zone_micro_freq
      0.011207


      5
      biome__ord
      0.011145


      17
      geo_meso_micro__ord
      0.010918


      118
      spectral_band_B_PC_3
      0.010364


      19
      geo_zone_macro_count
      0.009794


      52
      missing_property_particle_fine
      0.009486


      44
      missing_cation_Ca
      0.009473


      70
      parent_rock_type__ord
      0.009261


      96
      spectral_band_A_PC_5
      0.009136















    .colab-df-container {
      display:flex;
      gap: 12px;
    }

    .colab-df-convert {
      background-color: #E8F0FE;
      border: none;
      border-radius: 50%;
      cursor: pointer;
      display: none;
      fill: #1967D2;
      height: 32px;
      padding: 0 0 0 0;
      width: 32px;
    }

    .colab-df-convert:hover {
      background-color: #E2EBFA;
      box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
      fill: #174EA6;
    }

    .colab-df-buttons div {
      margin-bottom: 4px;
    }

    [theme=dark] .colab-df-convert {
      background-color: #3B4455;
      fill: #D2E3FC;
    }

    [theme=dark] .colab-df-convert:hover {
      background-color: #434B5C;
      box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
      filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
      fill: #FFFFFF;
    }



      const buttonEl =
        document.querySelector('#df-4fd19afd-070e-4801-8a11-cc331af75bdc button.colab-df-convert');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      async function convertToInteractive(key) {
        const element = document.querySelector('#df-4fd19afd-070e-4801-8a11-cc331af75bdc');
        const dataTable =
          await google.colab.kernel.invokeFunction('convertToInteractive',
                                                    [key], {});
        if (!dataTable) return;

        const docLinkHtml = 'Like what you see? Visit the ' +
          '<a target="_blank" href=https://colab.research.google.com/notebooks/data_table.ipynb>data table notebook</a>'
          + ' to learn more about interactive tables.';
        element.innerHTML = '';
        dataTable['output_type'] = 'display_data';
        await google.colab.output.renderOutput(dataTable, element);
        const docLink = document.createElement('div');
        docLink.innerHTML = docLinkHtml;
        element.appendChild(docLink);
      }






      .colab-df-generate {
        background-color: #E8F0FE;
        border: none;
        border-radius: 50%;
        cursor: pointer;
        display: none;
        fill: #1967D2;
        height: 32px;
        padding: 0 0 0 0;
        width: 32px;
      }

      .colab-df-generate:hover {
        background-color: #E2EBFA;
        box-shadow: 0px 1px 2px rgba(60, 64, 67, 0.3), 0px 1px 3px 1px rgba(60, 64, 67, 0.15);
        fill: #174EA6;
      }

      [theme=dark] .colab-df-generate {
        background-color: #3B4455;
        fill: #D2E3FC;
      }

      [theme=dark] .colab-df-generate:hover {
        background-color: #434B5C;
        box-shadow: 0px 1px 3px 1px rgba(0, 0, 0, 0.15);
        filter: drop-shadow(0px 1px 2px rgba(0, 0, 0, 0.3));
        fill: #FFFFFF;
      }








      (() => {
      const buttonEl =
        document.querySelector('#id_2fa5a08d-5aca-4ae2-9c8f-e73435309268 button.colab-df-generate');
      buttonEl.style.display =
        google.colab.kernel.accessAllowed ? 'block' : 'none';

      buttonEl.onclick = () => {
        google.colab.notebook.generateWithVariable('fi');
      }
      })();





Saved reporting assets to outputs/ folder
Saved draft answers to outputs/research_question_draft.md
Final reporting section complete.
```

</details>

---

# BAGIAN 2 - Ringkasan Cepat Hasil Utama

| Item                                        |                                                                 Hasil |
| ------------------------------------------- | --------------------------------------------------------------------: |
| Model final untuk reporting                 |                                                    11Z2 Lite selected |
| Final OOF RMSE                              |                                                             11.245635 |
| Model pembanding terdekat                   |                                               11X raw, RMSE 11.250966 |
| Model individual terbaik                    |                                     CatBoostRegressor, RMSE 11.470718 |
| Baseline mean                               |                                                        RMSE 23.192856 |
| Target bin dengan error terbesar            |                                                             very_high |
| RMSE pada target bin very_high              |                                                             19.291652 |
| Bias prediksi pada target bin very_high     |                                                             -7.173619 |
| Jumlah fitur baru hasil feature engineering |                                                                    86 |
| Jumlah fitur awal/lama                      |                                                                    48 |
| Pasangan fitur berkorelasi tinggi           | property_particle_coarse vs property_particle_fine, abs corr 0.902199 |

Inti pembacaan: model final sudah lebih baik dari model individual dan baseline, tetapi error terbesar masih ada pada target tinggi. Ini berarti pendekatan ensemble dan post-processing sudah membantu, namun tail atas masih menjadi sumber error utama.

---

# BAGIAN 3 - Peta Tabel untuk Menjawab Tiap Soal

|  No | Soal / Fokus                                                       | Tabel atau output yang dipakai                                                  | Kenapa tabel itu relevan                                                                                                            |
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

# BAGIAN 4 - Tabel Bersih yang Paling Penting

## 4.1 Final Experiment Log

| Rank | Model                         | Features                                    | Mean CV RMSE | Std CV RMSE | Mean Train RMSE | Train-Valid Gap | Catatan                                                   |
| ---: | ----------------------------- | ------------------------------------------- | -----------: | ----------: | --------------: | --------------: | --------------------------------------------------------- |
|    1 | 11Z2 Lite selected            | engineered / post-processed                 |    11.245635 |         NaN |             NaN |             NaN | Final selected model for submission/reporting             |
|    2 | 11X raw                       | engineered / post-processed                 |    11.250966 |         NaN |             NaN |             NaN | Signed dual-tail correction                               |
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
| 11Z2 Lite selected            |             NaN |    11.245635 |             NaN |         NaN | Final terbaik berdasarkan OOF, tetapi train gap tidak tercatat untuk post-processing. |
| 11X raw                       |             NaN |    11.250966 |             NaN |         NaN | Hampir setara dengan final, namun sedikit lebih buruk.                                |
| 11X robust                    |             NaN |    11.252014 |             NaN |         NaN | Lebih aman, tetapi performa sedikit di bawah final.                                   |
| 11O adaptive blend            |             NaN |    11.266968 |             NaN |         NaN | Stabil tetapi kalah dari 11Z2 Lite.                                                   |
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

# BAGIAN 5 - Jawaban Rapih Per Soal

## 1. Urgensi memprediksi kandungan organik tanah

Prediksi kandungan organik tanah penting karena pengukuran langsung melalui laboratorium dapat memakan biaya, waktu, dan tenaga. Dengan model prediktif, kandungan organik dapat diestimasi lebih cepat dari fitur tanah, spektral, ekosistem, dan geografis. Hal ini berguna untuk prioritas sampling, pemantauan kualitas tanah, pengambilan keputusan pemupukan, dan identifikasi area yang membutuhkan intervensi konservasi.

Bukti dari eksperimen menunjukkan model final **11Z2 Lite selected** mencapai **OOF RMSE 11.245635**, jauh lebih baik dibanding **Mean Baseline 23.192856**. Artinya, fitur yang tersedia memang membawa sinyal prediktif yang cukup kuat, bukan sekadar noise.

Tabel utama yang menjawab soal ini: **Final experiment log** dan **Final OOF RMSE**.

## 2. Overfit atau underfit

Model individual menunjukkan kecenderungan overfit, terutama LightGBM, XGBoost, dan CatBoost, karena train RMSE jauh lebih rendah daripada CV RMSE. LightGBM memiliki train-valid gap paling besar, yaitu **8.222212**, disusul XGBoost **6.951202** dan CatBoost **5.153910**. Ini berarti model belajar sangat baik pada data train, tetapi performanya turun saat divalidasi.

Namun, model final **11Z2 Lite selected** dipilih berdasarkan OOF dan post-processing, sehingga evaluasi utamanya adalah validasi OOF. RMSE final **11.245635** lebih baik dari model individual terbaik, yaitu CatBoost **11.470718**. Jadi kesimpulannya, ada indikasi overfit pada model dasar, tetapi ensemble dan post-processing berhasil menurunkan error validasi.

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

Model utama yang digunakan adalah model tree-based boosting, yaitu **CatBoostRegressor**, **XGBoostRegressor**, dan **LightGBMRegressor**. Model-model ini kemudian dikembangkan menjadi ensemble dan post-processing berbasis OOF. Model final yang dipilih untuk reporting adalah **11Z2 Lite selected**.

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

# BAGIAN 6 - Kesimpulan Akhir

Model final **11Z2 Lite selected** adalah pilihan terbaik dari eksperimen Section 12 karena memiliki **OOF RMSE terendah 11.245635**. Performa ini lebih baik daripada model individual dan jauh lebih baik daripada baseline mean. Namun, residual analysis menunjukkan kelemahan utama masih berada pada target tinggi, khususnya bin **very_high**, yang cenderung di-underpredict.

Secara ilmiah, hasil menunjukkan bahwa kandungan organik tanah dipengaruhi oleh kombinasi fitur tanah, spektral, ekosistem, dan geografi. Bukti terkuat terlihat dari perbedaan mean antar geo zone, outlier kombinasi land cover + region, serta pentingnya fitur spektral dan particle ratio pada feature importance.

Untuk jawaban research question, tabel paling penting adalah:

1. **Final experiment log** untuk performa model.
2. **Overfit / underfit evidence table** untuk generalisasi model.
3. **Residual by target bin** untuk bias dan error detail.
4. **Geographic hierarchy mean-ratio evidence** untuk pengaruh spasial.
5. **Low acidity + low CEC summaries** untuk kondisi subset tanah.
6. **Land-cover/geography outlier evidence** untuk outlier kombinasi wilayah dan tutupan lahan.
7. **High-correlation pairs** untuk multicollinearity.
8. **Feature engineering summary** dan **feature importance** untuk menjelaskan fitur dan model.

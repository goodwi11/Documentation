Подключение к API
=================

Главное
-------

| Для работы с API подается GET-запрос. Основной URL для использования API становится доступен после оформлении PRO-тарифа: https://api.comsign.io/v2?.
| Для авторизации API ключа в запрос добавляется следующий заголовок - headers: {'Authorization': 'Basic EnXSA1m3p3L0E0EHXVAzmWpzlkeyE1X6amm2P0LCEDg6’} 
| Заголовок Authorization можно найти в личном кабинете на сайте Adspect.

GET-параметры
-------------

* keywords – ключевые слова для интеграции в вайт, прописывать через запятую

* domain – доменное имя для интеграции в tos&privacy, прописывать в формате https://example.com или example.com

* lang – выбор необходимого языка для генерации. Прописывать в формате: язык_СТРАНА

* product – выбор необходимого генератора для генерации: sf – Trust Page gen., gp – Google Play gen., ap – App Store gen., wp – Word Press (HTML) gen., wp&php=1 – Word Press (PHP) gen., sc – Page Scraper

* seed – номер генерации шаблона, случайный набор букв или цифр. Если значение параметра будет пустым, то seed сформируется автоматически

* target – выбор необходимой темы для генерации. Необходимо прописать тему, выбрав её из существующего списка или вписать собственную. Для инструментов Google Play, App Store gen. или Page Scraper используется URL-ссылка

* zip=true – параметр для скачивания архива. Если параметра «zip» нет, то вместо файла будет отдано превью. При «zip=true» списывается лимит генераций / средства с баланса

* sid – параметр необходимый для интеграции потока с клоакой. При создании потока через Adspect появится ключ stream_id, его значение необходимо подставить в данный параметр, тем самым получая интеграцию вайта с клоакой. Данный параметр используется только при работе с клоакой

Пример релевантной URL-ссылки для работы с API:

*https://api.comsign.io/v2?aid=2e2bbf52-adnc-5819-963c-8e0d48b26e9&keywords=Elon Musk,Spaceship&domain=elonmusk.com&lang=en_US&product=wp&sid=&target=food&zip=true*

===================================
Коды доступных языков для генерации
===================================

Afrikaans - af_ZA  
Albanian - sq_AL  
Amharic - am_ET  
Arabian - ar_SA  
Armenian - hy_AM  
Azerbaijanian - az_AZ  
Belarusian - be_BY  
Bengal - bn_BD  
Bulgarian - bg_BG  
Burmese - my_MM  
Chinese - zh_CH  
Croatian - hr_HR  
Czech - cs_CZ  
Danish - da_DK  
Dutch - nl_NL  
English - en_US  
Estonian - et_EE  
Faroese - fo_FO  
Finnish - fi_FI  
French - fr_FR  
Georgian - ka_GE  
German - de_DE  
Greek - el_GR  
Guarani - gn_PY  
Hebrew - he_IL 
Hindi - hi_IN  
Hungarian - hu_HU  
Icelandic - is_IS  
Indonesian - id_ID  
Irish - ga_IE  
Italian - it_IT  
Japanese - ja_JP  
Kazakh - kk_KZ  
Khmer - km_KH  
Korean - ko_KR  
Kyrgyz - ky_KG  
Lao - lo_LA  
Latvian - lv_LV  
Lithuanian - lt_LT  
Luxembourgish - lb_LU  
Macedonian - mk_MK  
Malay - ms_MY  
Maltese - mt_MT  
Mongolian - mn_MN  
Norwegian - no_NO  
Persian - fa_IR  
Polish - pl_PL  
Portuguese - pt_PT  
Punjabi - pa_IN  
Romanian - ro_RO  
Russian - ru_RU  
Serbian - sr_RS  
Slovenian - sl_SL  
Spanish - es_ES  
wahili - sw_KE  
wati - ss_SZ  
Swedish - sv_SE  
Telugu - te_IN  
Thai - th_TH  
Turkish - tr_TR  
Turkmen - tk_TM  
Ukrainian - uk_UA  
Urdu - ur_PK  
Uzbek - uz_UZ  
Vietnamese - vi_VN 
Zulu - zu_ZA
===================================

Подключение к API
=================

Главное про API
---------------

Для аутентификации в API используется HTTP-аутентификация типа Basic, где ключ API передается в качестве имени пользователя, а пароль оставляется пустым. То есть каждый запрос к API должен содержать обязательный заголовок Authorization вида:

Authorization: Basic <authKey>

Поле <authKey> в заголовке Authorization формируется путем base64-кодирования строки, составленной из ключа API и добавленного в конце двоеточия.

.. admonition:: Важно!
 Вы можете найти ключ API в вашем профиле на сайте Adspect. 

| Некоторые HTTP-клиенты имеют нативную поддержку аутентификации HTTP Basic и самостоятельно добавляют заголовок Authorization.
| Например, Python Requests предоставляет класс requests.auth.HTTPBasicAuth. В этом случае укажите ваш ключ API в качестве имени пользователя и оставьте пароль пустым.

.. | Для работы с API подается GET-запрос. Основной URL для использования API становится доступен после оформлении PRO-тарифа: https://api.comsign.io/v2?.
.. | Для авторизации API ключа в запрос добавляется следующий заголовок - headers: {'Authorization': 'Basic EnXSA1m3p3L0E0EHXVAzmWpzlkeyE1X6amm2P0LCEDg6’} 
.. | Заголовок Authorization можно найти в личном кабинете на сайте Adspect.

GET-параметры
-------------

Для генерации вайта (предпросмотра или ZIP-архива) нужно отправить HTTP GET-запрос на URL https://api.comsign.io/v2, указав настройки для генерации в URL-параметрах.

| * product – выбор генератора:
| sf – SafePage gen., 
| gp – GooglePlay gen., 
| ap – AppStore gen., 
| wp – Word Press (HTML) gen.,
| wp&php=1 – Word Press (PHP) gen.

| * keywords – ключевые слова для интеграции в вайт, прописывать через запятую

| * domain – доменное имя для интеграции в tos&privacy, прописывать в формате *https://example.com* или *example.com*

| * lang – выбор необходимого языка для генерации. Прописывать в формате: язык_СТРАНА

| * seed – номер генерации шаблона, случайный набор букв или цифр. Если значение параметра будет пустым, то seed сформируется автоматически

| * target – тема или URL для наполнения вайта контентом. Для генераторов WP и SF необходимо прописать одну из доступных тем. Для генераторов Google Play и App Store используется URL-ссылка.

| * zip=true – будет отдан ZIP-файл с вайтом. При активном параметре будет списываться лимит скаичваний. Если параметра «zip» нет, то вместо файла будет отдано превью.
| Если параметра «zip» нет, то вместо файла будет отдано PNG превью. 

| * sid – параметр необходимый для интеграции потока с клоакой. Вытягивает фильтрационный файл filter.php и записывает index.php.
| Для активации параметра необходимо подставить ключ stream_id из потока Adspect.

Пример релевантной URL-ссылки для работы с API:

Block in condensed syntax::

 https://api.comsign.io/v2?aid=2e2bbf52-adnc-5819-963c-8e0d48b26e9&keywords=Elon Musk,Spaceship&domain=elonmusk.com&lang=en_US&product=wp&sid=&target=food&zip=true

Коды доступных языков для генерации:

| Albanian - sq_AL  
| Amharic - am_ET  
| Arabian - ar_SA  
| Armenian - hy_AM  
| Azerbaijanian - az_AZ  
| Belarusian - be_BY  
| Bengal - bn_BD  
| Bulgarian - bg_BG  
| Burmese - my_MM  
| Chinese - zh_CH  
| Croatian - hr_HR  
| Czech - cs_CZ  
| Danish - da_DK  
| Dutch - nl_NL  
| English - en_US  
| Estonian - et_EE  
| Faroese - fo_FO  
| Finnish - fi_FI  
| French - fr_FR  
| Georgian - ka_GE  
| German - de_DE  
| Greek - el_GR  
| Guarani - gn_PY  
| Hebrew - he_IL 
| Hindi - hi_IN  
| Hungarian - hu_HU  
| Icelandic - is_IS  
| Indonesian - id_ID  
| Irish - ga_IE  
| Italian - it_IT  
| Japanese - ja_JP  
| Kazakh - kk_KZ  
| Khmer - km_KH  
| Korean - ko_KR  
| Kyrgyz - ky_KG  
| Lao - lo_LA  
| Latvian - lv_LV  
| Lithuanian - lt_LT  
| Luxembourgish - lb_LU  
| Macedonian - mk_MK  
| Malay - ms_MY  
| Maltese - mt_MT  
| Mongolian - mn_MN  
| Norwegian - no_NO  
| Persian - fa_IR  
| Polish - pl_PL  
| Portuguese - pt_PT  
| Punjabi - pa_IN  
| Romanian - ro_RO  
| Russian - ru_RU  
| Serbian - sr_RS  
| Slovenian - sl_SL  
| Spanish - es_ES  
| wahili - sw_KE  
| wati - ss_SZ  
| Swedish - sv_SE  
| Telugu - te_IN  
| Thai - th_TH  
| Turkish - tr_TR  
| Turkmen - tk_TM  
| Ukrainian - uk_UA  
| Urdu - ur_PK  
| Uzbek - uz_UZ  
| Vietnamese - vi_VN 
| Zulu - zu_ZA










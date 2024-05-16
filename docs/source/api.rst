Подключение к API
=================

Главное
-------

Для работы с API подается GET-запрос. Основной URL для использования API становится доступен после оформлении PRO-тарифа: https://api.comsign.io/v2?.
Для авторизации API ключа в запрос добавляется следующий заголовок - headers: {'Authorization': 'Basic EnXSA1m3p3L0E0EHXVAzmWpzlkeyE1X6amm2P0LCEDg6’} Заголовок Authorization можно найти в личном кабинете на сайте Adspect.

GET-параметры
-------------

keywords – ключевые слова для интеграции в вайт, прописывать через запятую

domain – доменное имя для интеграции в tos&privacy, прописывать в формате https://example.com или example.com

lang – выбор необходимого языка для генерации. Прописывать в формате: язык_СТРАНА

product – выбор необходимого генератора для генерации: sf – Trust Page gen., gp – Google Play gen., ap – App Store gen., wp – Word Press (HTML) gen., wp&php=1 – Word Press (PHP) gen., sc – Page Scraper

seed – номер генерации шаблона, случайный набор букв или цифр. Если значение параметра будет пустым, то seed сформируется автоматически

target – выбор необходимой темы для генерации. Необходимо прописать тему, выбрав её из существующего списка или вписать собственную. Для инструментов Google Play, App Store gen. или Page Scraper используется URL-ссылка

zip=true – параметр для скачивания архива. Если параметра «zip» нет, то вместо файла будет отдано превью. При «zip=true» списывается лимит генераций / средства с баланса

sid – параметр необходимый для интеграции потока с клоакой. При создании потока через Adspect появится ключ stream_id, его значение необходимо подставить в данный параметр, тем самым получая интеграцию вайта с клоакой. Данный параметр используется только при работе с клоакой

Пример релевантной URL-ссылки для работы с API:

https://api.comsign.io/v2?aid=2e2bbf52-adnc-5819-963c-8e0d48b26e9&keywords=Elon Musk,Spaceship&domain=elonmusk.com&lang=en_US&product=wp&sid=&target=food&zip=true

Коды основных языков для генерации:

vi_VN, th_TH, sl_SL, sk_SK, sr_RS, ro_RO, mn_MN, ms_MY, mk_MK, lt_LT, lv_LV, ko_KR, kk_KZ, ja_JP, ga_IE, id_ID, is_IS, hu_HU, he_IL, el_GR, nl_NL, hr_HR, zh_CH, be_BY, az_AZ, hy_AM, ka_GE, cs_CZ, bg_BG, ar_SA, af_ZA, uk_UA, it_IT, ru_RU, en_US, de_DE, es_ES, pl_PL, sv_SE, fi_FI, fr_FR, pt_PT, tr_TR, hi_IN, et_EE, da_DK, no_NO, bn_BD

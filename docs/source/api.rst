Подключение к API
=================

Главное про API
---------------

Для аутентификации в API используется HTTP-аутентификация типа Basic, где ключ API передается в качестве имени пользователя, а пароль оставляется пустым. То есть каждый запрос к API должен содержать обязательный заголовок Authorization вида:

``Authorization: Basic <authKey>``

Поле <authKey> в заголовке Authorization формируется путем base64-кодирования строки, составленной из ключа API и добавленного в конце двоеточия.

.. note::
    Вы можете найти ключ API в вашем профиле на сайте `Adspect <https://clients.adspect.ai/profile>`_.  

| Некоторые HTTP-клиенты имеют нативную поддержку аутентификации HTTP Basic и самостоятельно добавляют заголовок Authorization.
| Например, Python Requests предоставляет класс requests.auth.HTTPBasicAuth. В этом случае укажите ваш ключ API в качестве имени пользователя и оставьте пароль пустым.

.. | Для работы с API подается GET-запрос. Основной URL для использования API становится доступен после оформлении PRO-тарифа: https://api.comsign.io/v2?.
.. | Для авторизации API ключа в запрос добавляется следующий заголовок - headers: {'Authorization': 'Basic EnXSA1m3p3L0E0EHXVAzmWpzlkeyE1X6amm2P0LCEDg6’} 
.. | Заголовок Authorization можно найти в личном кабинете на сайте Adspect.

GET-параметры
-------------

Для генерации вайта (предпросмотра или ZIP-архива) необходимо отправить HTTP GET-запрос на URL: *https://api.comsign.io/v2*, указав настройки для генерации в URL-параметрах. 

.. list-table:: Основные параметры для работы с API
   :header-rows: 1
   :stub-columns: 1

   * - Обязательно
     - Параметр
     - Для чего
   * - Да
     - ``product``
     -  | Выбор генератора:
        | ``sf`` – SafePage генератор.
        | ``sf_v2`` – SafePage v2.0 генератор.
        | ``gp`` – GooglePage генератор.
        | ``gp_v2`` – GooglePage v2.0 генератор.
        | ``ms`` – MicrosoftPage генератор.
        | ``ap`` – ApplePage генератор.
        | ``as`` – AmazonPage генератор. 
        | ``wp`` – Word Press (HTML) генератор.
        | ``wp&php=1`` – Word Press (PHP) генератор.
   * - Да
     - ``target``
     -  | Тема или URL для наполнения вайта контентом. 
        | Для генераторов WordPress и SafePage необходимо прописать одну из доступных тем.
        | Для генераторов GooglePage, ApplePage, AmazonPage и MicrosoftPage используется URL-ссылка на приложение или товар (для генератора GooglePage v2 также доступны темы).
        | Список доступных тем с кодами представлен ниже.
   * - Да
     - ``lang``
     - | Выбор необходимого языка для перевода вайта. Прописывать в формате: язык_СТРАНА.
       | Список доступных языков с кодами представлен ниже.     
   * - Нет
     - ``keywords``
     - | Ключевые слова для интеграции в вайт, прописывать через запятую.
   * - Нет
     - ``domain``
     - | Доменное имя для интеграции в TOS&Privacy, прописывать в формате: *https://example.com* или *example.com*.
   * - Нет
     - ``sid``
     - | Обратная PHP-интеграция c клоакой Adspect.
       | Для активации необходимо подставить ключ *stream_id* из потока Adspect.
   * - Нет
     - ``zip=true``
     - | Будет отдан ZIP-файл с вайтом. При активном параметре списывается лимит скачиваний.
       | Если параметра нет, то вместо файла будет отдано JPG превью.    
   * - Нет
     - ``seed``
     - | Номер генерации шаблона, случайный набор символов.
       | Если значение будет пустым, то ``seed`` сформируется автоматически.
       | Если значение не менять, то шаблон вайта сгенерируется повторно.  

.. list-table:: Дополнительные параметры для работы с API
   :header-rows: 1
   :stub-columns: 0

   * - Параметр
     - Для чего
   * - ``keywords``
     - | Ключевые слова для интеграции в вайт, прописывать через запятую.
       | Пример: *key,keys,keywords*
   * - ``domain``
     - | Доменное имя для интеграции в TOS&Privacy.
       | Пример: *https://example.com* или *example.com*
   * - ``company``
     - | Название компании для интеграции в TOS&Privacy. 
       | Пример: *Stratton Oakmont*
   * - ``phone``
     - | Номер телефона для интеграции в TOS&Privacy.
       | Пример: *1 800 999-99*
   * - ``email``
     - | Электронная почта для интеграции в TOS&Privacy. 
       | Пример: *stratton.oak@mail.com* 
   * - ``title``
     - | Изменение заголовка вайта.
       | Пример: *ExampleTitle*
   * - ``index``
     - | Изменение названия index файла.
       | Пример: *stratton*
   * - ``ext``
     - | Формат расширения index файла, по умолчанию будет html.
       | Пример: *html* или *php*
   * - ``redirect``
     - | Ссылка для переадресации с кнопок или формы.
       | Пример: *https://exampleredirect.com*
   * - ``redirect_form``
     - | Переадресация с формы.
       | Для активации необходимо прописать: 1 
   * - ``redirect_button``
     - | Переадресация с кнопок.
       | Для активации необходимо прописать: 1
   * - ``pixel``
     - | Параметр для размещения пикселя на странице вайта.
   * - ``head``
     - | Параметр для размещения кода на страницу вайта.
   * - ``body_start``
     - | Параметр для размещения кода на страницу вайта после <body>.
   * - ``body_end``
     - | Параметр для размещения кода на страницу вайта перед <body>.

.. important:: 
 При вставке кода через параметры ``head`` или ``pixel``, необходимо использовать URL кодирование. 



Пример релевантной URL-ссылки для работы с API::

 https://api.comsign.io/v2?aid=2e2bbf52-adnc-5819-963c-8e0d48b26e9&keywords=example,keys&domain=example.com&lang=en_US&product=wp&sid=3eb2a9d3-9k93-3etc-ci88-ac1f6f92a854&target=food&zip=true

Коды доступных языков
---------------------

.. | Albanian - sq_AL  
.. | Amharic - am_ET  
.. | Arabian - ar_SA  
.. | Armenian - hy_AM  
.. | Azerbaijanian - az_AZ  
.. | Belarusian - be_BY  
.. | Bengal - bn_BD  
.. | Bulgarian - bg_BG  
.. | Burmese - my_MM  
.. | Chinese - zh_CH  
.. | Croatian - hr_HR  
.. | Czech - cs_CZ  
.. | Danish - da_DK  
.. | Dutch - nl_NL  
.. | English - en_US  
.. | Estonian - et_EE  
.. | Faroese - fo_FO  
.. | Finnish - fi_FI  
.. | French - fr_FR  
.. | Georgian - ka_GE  
.. | German - de_DE  
.. | Greek - el_GR  
.. | Guarani - gn_PY  
.. | Hebrew - he_IL 
.. | Hindi - hi_IN  
.. | Hungarian - hu_HU  
.. | Icelandic - is_IS  
.. | Indonesian - id_ID  
.. | Irish - ga_IE  
.. | Italian - it_IT  
.. | Japanese - ja_JP  
.. | Kazakh - kk_KZ  
.. | Khmer - km_KH  
.. | Korean - ko_KR  
.. | Kyrgyz - ky_KG  
.. | Lao - lo_LA  
.. | Latvian - lv_LV  
.. | Lithuanian - lt_LT  
.. | Luxembourgish - lb_LU  
.. | Macedonian - mk_MK  
.. | Malay - ms_MY  
.. | Maltese - mt_MT  
.. | Mongolian - mn_MN  
.. | Norwegian - no_NO  
.. | Persian - fa_IR  
.. | Polish - pl_PL  
.. | Portuguese - pt_PT  
.. | Punjabi - pa_IN  
.. | Romanian - ro_RO  
.. | Russian - ru_RU  
.. | Serbian - sr_RS  
.. | Slovenian - sl_SL  
.. | Spanish - es_ES  
.. | wahili - sw_KE  
.. | wati - ss_SZ  
.. | Swedish - sv_SE  
.. | Telugu - te_IN  
.. | Thai - th_TH  
.. | Turkish - tr_TR  
.. | Turkmen - tk_TM  
.. | Ukrainian - uk_UA  
.. | Urdu - ur_PK  
.. | Uzbek - uz_UZ  
.. | Vietnamese - vi_VN 
.. | Zulu - zu_ZA

===================================   =========

Язык                                  Код

===================================   =========
Английский                            ``en_US``
Арабский                              ``ar_SA``
Армянский                             ``hy_AM``
Азербайджанский                       ``az_AZ``
Белорусский                           ``be_BY``
Бенгальский                           ``bn_BD``
Болгарский                            ``bg_BG``
Венгерский                            ``hu_HU``
Вьетнамский                           ``vi_VN``
Голландский                           ``nl_NL``
Греческий                             ``el_GR``
Грузинский                            ``ka_GE``
Датский                               ``da_DK``
Иврит                                 ``he_IL``
Исландский                            ``is_IS``
Испанский                             ``es_ES``
Итальянский                           ``it_IT``
Ирландский                            ``ga_IE``
Казахский                             ``kk_KZ``
Китайский                             ``zh_CH``
Корейский                             ``ko_KR``
Латышский                             ``lv_LV``
Литовский                             ``lt_LT``
Македонский                           ``mk_MK``
Малайский                             ``ms_MY``
Монгольский                           ``mn_MN``
Немецкий                              ``de_DE``
Норвежский                            ``no_NO``
Польский                              ``pl_PL``
Португальский                         ``pt_PT``
Румынский                             ``ro_RO``
Русский                               ``ru_RU``
Сербский                              ``sr_RS``
Словенский                            ``sl_SL``
Тайский                               ``th_TH``
Турецкий                              ``tr_TR``
Украинский                            ``uk_UA``
Финский                               ``fi_FI``
Французский                           ``fr_FR``
Хинди                                 ``hi_IN``
Хорватский                            ``hr_HR``
Чешский                               ``cs_CZ``
Шведский                              ``sv_SE``
Эстонский                             ``et_EE``
Японский                              ``ja_JP``
===================================   =========

Коды доступных тем
------------------

.. ===================================  

.. Коды тем для WordPress и SafePage                      

.. ===================================  
.. beauty                               
.. travel                              
.. music                                
.. food                                 
.. science                                                            
.. gaming                                                       
.. energy                                                         
.. news                                                          
.. sport                                
.. tech                                 
.. world                                
.. finance                              
.. politics                             
.. business                             
.. economics                            
.. entertainment                        
.. =================================== 

.. ===================================  

.. Коды тем для SafePage v2                                

.. ===================================   
.. travel
.. sport
.. beauty
.. finance
.. dating
.. games
.. cars
.. technologies
.. fashion
.. music
.. activities
.. entertainment
.. health
.. food
.. education
.. estate
.. fitness
.. commerce                  
.. ===================================  

.. csv-table:: 
   :header: "Коды для WordPress и SafePage", "Коды для SafePage v2", "Коды для GooglePage v2"
   :width: 15%
   :align: center

   "``beauty``", ``travel``, ``Auto_Vehicles``
   "``travel``", ``sport``, ``Business``
   "``music``", ``beauty``, ``Video_Players``
   "``food``", ``finance``, ``Food_Drink``
   "``science``", ``dating``, ``House_Home``
   "``gaming``", ``games``, ``Health_Fitness``
   "``energy``", ``cars``, ``Dating``
   "``news``", ``technologies``, ``Game``
   "``sport``", ``fashion``, ``Game_Arcade``
   "``tech``", ``music``, ``Game_Casual``
   "``world``", ``activities``, ``Game_Card``
   "``finance``", ``entertainment``, ``Game_Music``
   "``politics``", ``health``, ``Game_Board``
   "``business``", ``food``, ``Game_Puzzle``
   "``economics``", ``education``, ``Game_Adventure``
   "``entertainment``", ``estate``, ``Game_Sports``
                  , ``fitness``, ``Game_Action``
                  , ``commerce``, ``Tools``
                  , , ``Art_Design``
                  , , ``Maps_Navigation``
                  , , ``Comics``
                  , , ``Beauty``
                  , , ``Medical``
                  , , ``Events``
                  , , ``Music_Audio``
                  , , ``News_Magazines``
                  , , ``Education``
                  , , ``Personalization``
                  , , ``Weather``
                  , , ``Productivity``
                  , , ``Travel_Local``
                  , , ``Entertainment``
                  , , ``Communication``
                  , , ``Social``
                  , , ``Sports``
                  , , ``Finance``
                  , , ``Photography``
                  , , ``Shopping``


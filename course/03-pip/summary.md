# Конспект: Модуль 3 — pip и управление пакетами

> Краткий справочник для повторения. Подходит для печати.

## Ключевые понятия

| Понятие | Суть (1 предложение) |
|---------|---------------------|
| **pip** | Стандартный менеджер пакетов Python — устанавливает, удаляет и обновляет библиотеки. |
| **PyPI** | Репозиторий Python-пакетов, откуда pip по умолчанию скачивает пакеты. |
| **Индекс пакетов** | Сервер, предоставляющий каталог пакетов и метаданные для pip. |
| **requirements.txt** | Файл со списком пакетов и версий в формате `package==version` для воспроизведения окружения. |

## Важно запомнить

- pip привязан к конкретному интерпретатору Python — используйте `python -m pip` для явного указания.
- pip и apt — разные инструменты: pip для Python-пакетов, apt для системных пакетов.
- `pip list` — все установленные пакеты; `pip freeze` — формат для requirements (с зависимостями).
- `pip freeze > requirements.txt` фиксирует окружение; `pip install -r requirements.txt` воспроизводит его.
- PyPI — дефолтный индекс; можно использовать альтернативные (`--index-url`) и кеш (`pip cache`).

## Команды модуля

```bash
# Проверка связки pip↔Python
pip --version
python -m pip --version

# Установка, удаление, обновление
pip install requests
pip install requests==2.31.0
pip uninstall requests
pip install --upgrade requests

# Информация о пакетах
pip list
pip freeze
pip show requests

# Воспроизведение окружения
pip freeze > requirements.txt
pip install -r requirements.txt

# Индекс и кеш
pip install --index-url https://... <package>
pip cache list
pip cache purge
pip install --no-cache-dir <package>
```

## Типичные ошибки (коротко)

| Ошибка | Причина | Решение |
|--------|---------|---------|
| Пакет установлен, но `import` не работает | pip привязан к другому Python | Проверить `python -m pip --version`, использовать `python -m pip install` |
| Установка Python-библиотек через apt | Путаница pip и apt | Использовать pip для Python-пакетов |
| Путаница `pip list` и `pip freeze` | Похожие названия | `list` — для просмотра; `freeze` — для requirements |
| Проект не воспроизводится у коллеги | Нет requirements.txt или устарел | `pip freeze` перед коммитом, обновлять при изменениях |

## Схема

```
pip install requests
        │
        ├── Обращение к индексу (PyPI по умолчанию)
        ├── Скачивание в кеш (если включён)
        └── Установка в site-packages активного Python
                └── python -m pip --version показывает путь

pip freeze > requirements.txt   ──→   pip install -r requirements.txt
        (фиксация)                          (воспроизведение)
```
